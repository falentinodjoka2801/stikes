<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Items as ItemModel;

#Libraries
use App\Libraries\APIRespondFormat;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Models\ItemDetail;
use App\Models\ItemStok;
use App\Models\Jenis;
use App\Models\KategoriTransaksi;

use Exception;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class Item extends Controller{
    public function index(Request $request): View{
        $data   =   [
            'pageTitle'     =>  'List Item',
            'pageDesc'      =>  'Daftar Alat, Ruang, BHP, dsb',
            'pagePath'      =>  ['Item', 'List Item']
        ];

        $listKategoriTransaksi  =   KategoriTransaksi::query()->in()->excludeInisialisasi()->select(['id', 'nama'])->get();
        $listJenis              =   Jenis::query()->select(['id', 'nama'])->get();

        $additionalData     =   [
            'listJenis'             =>  $listJenis,
            'listKategoriTransaksi' =>  $listKategoriTransaksi
        ];

        return view('administrator.item.index', $data)->with($additionalData);
    }
    public function add(Request $request, ?string $encryptedId = null): View{
        try{
            $id     =   null;
            $item   =   null;

            if(!empty($encryptedId)){
                $id     =   decrypt($encryptedId);
                $item   =   ItemModel::find($id);
            }

            $doesUpdate =   !empty($item);

            $listJenis      =   Jenis::query()->select(['id', 'nama'])->get();
            
            $data   =   [
                'pageTitle'     =>  ($doesUpdate)? 'Update Item' : 'Item Baru',
                'pageDesc'      =>  ($doesUpdate)? $item->nama : '',
                'pagePath'      =>  ['Item', ($doesUpdate)? 'Update Item' : 'Item Baru'],
                'listJenis'     =>  $listJenis,
                'item'          =>  $item
            ];

            if($doesUpdate){
                $itemHasStock       =   in_array($item->jenis, ItemModel::$itemsHaveStock);
                $data['hasStock']   =   $itemHasStock;
            }

            return view('administrator.item.add', $data);
        }catch(Exception $e){
            abort(500);
        }
    }
    public function save(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memproses Item!';
        $data       =   null;

        try{
            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;

            #Collect Data
            $id             =   $request->id;
            $nama           =   $request->nama;
            $jenis          =   $request->jenis;
            $kelompok       =   $request->kelompok;
            $quantityStok   =   $request->quantityStok;
            $satuan         =   $request->satuan;
            $stokMinimum    =   $request->stokMinimum;

            $doesUpdate             =   !empty($id);
            $canUpdateQuantityStok  =   true;

            if($doesUpdate){
                $item   =   ItemModel::find($id);
                if(empty($item)){
                    throw new Exception('Item tidak terdefinisi!');
                }
            }

            $detailJenis    =   Jenis::query()->select(['id', 'nama'])->find($jenis);
            if(empty($detailJenis)){
                throw new Exception('Jenis tidak terdefinisi!');
            }
            
            $dateToday      =   date('Y-m-d');
            $dateTimeToday  =   date('Y-m-d H:i:s');
            if(!$doesUpdate){
                $jumlahItemToday    =   ItemModel::query()
                                        ->where(function (Builder $builder) use ($dateToday) {
                                            $builder->where('createdAt', '>=', $dateToday . ' 00:00:00');
                                            $builder->where('createdAt', '<=', $dateToday . ' 23:59:59');
                                        })->where(function(Builder $builder) use ($jenis){
                                            $builder->where('jenis', $jenis);
                                        })
                                        ->count();

                if ($jumlahItemToday == 0) {
                    $urutanItemToday  =   1;
                } else {
                    $urutanItemToday  =   $jumlahItemToday + 1;
                }

                $initialLetter  =   Jenis::getInitialLetter($jenis);
                if(empty($initialLetter)){
                    $initialLetter  =   'X';
                }

                $urutan     =   str_pad($urutanItemToday, 3, '0', STR_PAD_LEFT);
                $kode       =   $initialLetter.date('Ymd').$urutan;

                $item   =   new ItemModel();
                $item->kode         =   $kode;
                $item->createdBy    =   $administratorId;
                $item->createdAt    =   $dateTimeToday;
            }else{
                $itemQuantityStok   =   $item->quantityStok;
                if(!empty($itemQuantityStok)){
                    $canUpdateQuantityStok  =   false;
                }
                
                $item->updatedBy    =   $administratorId;
                $item->updatedAt    =   $dateTimeToday;
            }
            
            $item->nama             =   $nama;
            $item->jenis            =   $jenis;
            $item->kelompok         =   $kelompok;

            if($canUpdateQuantityStok){
                $item->quantityStok     =   $quantityStok;
            }
            
            $item->satuan           =   $satuan;
            $item->stokMinimum      =   $stokMinimum;
            $saveItem               =   $item->save();
            $itemId                 =   $item->id;

            if($canUpdateQuantityStok){
                #Insert Stock Inisialisasi
                $itemStock              =   new ItemStok();
                $itemStock->item        =   $itemId;
                $itemStock->quantity    =   $quantityStok;
                $itemStock->kategori    =   5; #inisialisasi
                $itemStock->createdBy   =   $administratorId;
                $itemStock->createdFrom =   ItemStok::$createdFrom_item;
                $itemStock->createdAt   =   $dateTimeToday;
                $itemStock->save();
            }

            if($saveItem){
                $status     =   true;
                $message    =   'Berhasil memproses item!';
                $data       =   [
                    'id'    =>  $itemId
                ];
            }

        }catch(Exception $e){
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function data(Request $request): JsonResponse{
        #Collect Data
        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search     =   $request->search;

        $jenis      =   $request->jenis;
        
        $itemHaveDetail     =   ItemModel::$itemsHaveDetail;
        $itemsHaveStock     =   ItemModel::$itemsHaveStock;

        $recordsTotal   =   ItemModel::query()
                            ->when(!empty($jenis), function(Builder $builder) use ($jenis){
                                $builder->where('jenis', $jenis);
                                return $builder;
                            })
                            ->when(!empty($search), function(Builder $builder) use ($search){
                                if(is_array($search)){
                                    if(array_key_exists('value', $search)){
                                        $searchValue    =   $search['value'];
                                        if(!empty($searchValue)){
                                            $builder->where('nama', 'like', '%'.$searchValue.'%');
                                            $builder->orWhere('kode', 'like', '%'.$searchValue.'%');
                                        }
                                    }
                                }

                                return $builder;
                            })->count(['id']);   

        $listItem       =   ItemModel::query()
                            ->when(!empty($jenis), function(Builder $builder) use ($jenis){
                                $builder->where('jenis', $jenis);
                                return $builder;
                            })
                            ->when(!empty($search), function(Builder $builder) use ($search){
                                if(is_array($search)){
                                    if(array_key_exists('value', $search)){
                                        $searchValue    =   $search['value'];
                                        if(!empty($searchValue)){
                                            $builder->where('nama', 'like', '%'.$searchValue.'%');
                                            $builder->orWhere('kode', 'like', '%'.$searchValue.'%');
                                        }
                                    }
                                }

                                return $builder;
                            })
                            ->limit($length)
                            ->offset($start)
                            ->get();

        $nomorUrut  =   1;
        foreach($listItem as $index => $item){
            $itemId     =   $item->id;
            $itemJenis  =   $item->jenis()->select(['id', 'nama'])->first();

            $encryptedId    =   encrypt($itemId);
            $hasDetail      =   in_array($itemJenis->id, $itemHaveDetail);
            $hasStock       =   in_array($itemJenis->id, $itemsHaveStock);
            $jenisNama      =   $itemJenis->nama; 

            $listItem[$index]['nomorUrut']      =   $nomorUrut;
            $listItem[$index]['encryptedId']    =   $encryptedId;
            $listItem[$index]['hasDetail']      =   $hasDetail;
            $listItem[$index]['jenis']          =   $jenisNama;

            $nomorUrut++;
        }

        $respond   =   [
            'listItem'          =>  $listItem,
            'draw'              =>  $draw,
            'recordsFiltered'   =>  $recordsTotal,
            'recordsTotal'      =>  $recordsTotal
        ];

        return response()->json($respond);
    }
    public function delete(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal menghapus item!';
        $data       =   null;

        try{
            #Collect Data
            $item     =   $request->item;
            $detailItem     =   ItemModel::query()->find($item);
            if(empty($detailItem)){
                throw new Exception('Item tidak terdefinisi!');
            }

            $delete     =   $detailItem->delete();
            if($delete){
                $status     =   true;
                $message    =   'Berhasil menghapus item!';
            }
        }catch(Exception $e){
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function detail(Request $request, ?string $encryptedId = null): View{
        try{
            $id     =   null;
            $item   =   null;

            if(!empty($encryptedId)){
                $id     =   decrypt($encryptedId);
                $item   =   ItemModel::find($id);
            }
            
            $data   =   [
                'pageTitle'     =>  'Detail Item',
                'pageDesc'      =>  $item->nama,
                'pagePath'      =>  ['Item', 'Detail Item'],
                'item'          =>  $item
            ];
            return view('administrator.item.detail', $data);
        }catch(Exception $e){
            abort(500);
        }
    }
    public function saveItem(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memproses Detail Item!';
        $data       =   null;

        try{
            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;

            #Collect Data
            $item           =   $request->item;
            $detail         =   $request->detail;
            $jumlah         =   $request->jumlah;
            $satuan         =   $request->satuan;

            #Checking Item
            $item     =   ItemModel::query()->select(['id'])->find($item);
            if(empty($item)){
                throw new Exception('Item tidak terdefinisi!');
            }

            #Initial Data
            $dateTimeToday  =   date('Y-m-d H:i:s');

            $itemDetail             =   new ItemDetail();
            $itemDetail->item       =   $item->id;
            $itemDetail->detail     =   $detail;
            $itemDetail->jumlah     =   $jumlah;
            $itemDetail->satuan     =   $satuan;
            $itemDetail->createdBy  =   $administratorId;
            $itemDetail->createdAt  =   $dateTimeToday;
            $saveItemDetail         =   $itemDetail->save();

            if($saveItemDetail){
                $status     =   true;
                $message    =   'Berhasil memproses detail item!';
                $data       =   [
                    'id'    =>  $itemDetail->id
                ];
            }

        }catch(Exception $e){
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function deleteItem(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal menghapus detail item!';
        $data       =   null;

        try{
            #Collect Data
            $id     =   $request->id;
            $detailItem     =   ItemDetail::query()->find($id);
            if(empty($detailItem)){
                throw new Exception('Detail Item tidak terdefinisi!');
            }

            $delete     =   $detailItem->delete();
            if($delete){
                $status     =   true;
                $message    =   'Berhasil menghapus detail item!';
            }
        }catch(Exception $e){
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function stok(Request $request): View{
        $data   =   [
            'pageTitle'     =>  'Stok Item',
            'pageDesc'      =>  'Riwayat Penggunaan Stok Item'
        ];

        $itemIdInStock  =   [];
        $itemsInStock   =   ItemStok::query()->select(['item'])->groupBy('item')->get();
        foreach($itemsInStock as $item){
            $itemId             =   $item->item;
            $itemIdInStock[]    =   $itemId;
        }

        $listKategoriTransaksi  =   KategoriTransaksi::query()->in()->excludeInisialisasi()->select(['id', 'nama'])->get();
        $listItems              =   ItemModel::query()->select(['id', 'kode', 'nama'])->whereIn('id', $itemIdInStock)->get();
        $listStokMenipis        =   ItemStok::query()
                                    ->select(['item', DB::raw('SUM(quantity) as quantity')])
                                    ->groupBy('item')
                                    ->get();

        $listStokMenipisFiltered    =   [];
        foreach($listStokMenipis as $index  => $stokMenipis){
            $item   =   $stokMenipis->item()->select(['nama', 'kode', 'satuan', 'id', 'stokMinimum'])->first();

            $itemStokMinimum    =   $item->stokMinimum;
            $itemQuantity       =   $stokMenipis->quantity;
            if($itemQuantity <= $itemStokMinimum){
                $listStokMenipisFiltered[$index]['item']          =   $item;
                $listStokMenipisFiltered[$index]['stokSaatIni']   =   $itemQuantity;
            }
        }

        $additionalData =   [
            'listItems'             =>  $listItems,
            'listStokMenipis'       =>  $listStokMenipisFiltered,
            'listKategoriTransaksi' =>  $listKategoriTransaksi
        ];

        return view('administrator.item.stok', $data)->with($additionalData);
    }
    public function stokData(Request $request): JsonResponse{
        #Collect Data
        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search     =   $request->search;

        #Filter Data
        $item           =   $request->item;
        $rentangAwal    =   $request->rentangAwal;
        $rentangAkhir   =   $request->rentangAkhir;

        
        $recordsTotal       =   ItemStok::query()
                                ->when(!empty($item), function(Builder $builder) use ($item){
                                    $builder->where('item', $item);
                                    return $builder;
                                })
                                ->when(!empty($rentangAwal), function(Builder $builder) use ($rentangAwal){
                                    $rentangAwal    =   $rentangAwal.' 00:00:00';
                                    $builder->where('createdAt', '>=', $rentangAwal);
                                    return $builder;
                                })
                                ->when(!empty($rentangAkhir), function(Builder $builder) use ($rentangAkhir){
                                    $rentangAkhir   =   $rentangAkhir.' 23:59:59';
                                    $builder->where('createdAt', '<=', $rentangAkhir);
                                    return $builder;
                                })
                                ->when(!empty($search), function(Builder $builder) use ($search){
                                    if(is_array($search)){
                                        if(array_key_exists('value', $search)){
                                            $searchValue    =   $search['value'];
                                            if(!empty($searchValue)){
                                                $builder->where('keterangan', 'like', '%'.$searchValue.'%');
                                            }
                                        }
                                    }

                                    return $builder;
                                })
                                ->orderBy('createdAt', 'desc')
                                ->count(['id']);   

        $listHistoryStok    =   ItemStok::query()
                                ->when(!empty($item), function(Builder $builder) use ($item){
                                    $builder->where('item', $item);
                                    return $builder;
                                })
                                ->when(!empty($rentangAwal), function(Builder $builder) use ($rentangAwal){
                                    $rentangAwal    =   $rentangAwal.' 00:00:00';
                                    $builder->where('createdAt', '>=', $rentangAwal);
                                    return $builder;
                                })
                                ->when(!empty($rentangAkhir), function(Builder $builder) use ($rentangAkhir){
                                    $rentangAkhir   =   $rentangAkhir.' 23:59:59';
                                    $builder->where('createdAt', '<=', $rentangAkhir);
                                    return $builder;
                                })
                                ->when(!empty($search), function(Builder $builder) use ($search){
                                    if(is_array($search)){
                                        if(array_key_exists('value', $search)){
                                            $searchValue    =   $search['value'];
                                            if(!empty($searchValue)){
                                                $builder->where('keterangan', 'like', '%'.$searchValue.'%');
                                            }
                                        }
                                    }

                                    return $builder;
                                })
                                ->limit($length)
                                ->offset($start)
                                ->orderBy('createdAt', 'desc')
                                ->get();

        $nomorUrut  =   1;
        foreach($listHistoryStok as $index => $history){
            $detailItem                 =   $history->item()->select(['nama', 'kode', 'satuan'])->first();
            $historyKategoriTransaksi   =   $history->kategori;

            $detailKategoriTransaksi    =   KategoriTransaksi::query()->select(['id', 'nama', 'inOut'])->find($historyKategoriTransaksi);

            $listHistoryStok[$index]['nomorUrut']           =   $nomorUrut;
            $listHistoryStok[$index]['item']                =   $detailItem;
            $listHistoryStok[$index]['kategori']            =   $detailKategoriTransaksi;

            $nomorUrut++;
        }

        $respond   =   [
            'listHistoryStok'   =>  $listHistoryStok,
            'draw'              =>  $draw,
            'recordsFiltered'   =>  $recordsTotal,
            'recordsTotal'      =>  $recordsTotal
        ];

        return response()->json($respond);
    }
    public function rekapStokData(Request $request): JsonResponse{
        #Collect Data
        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search     =   $request->search;

        #Filter Data
        $item           =   $request->item;
        $rentangAwal    =   $request->rentangAwal;
        $rentangAkhir   =   $request->rentangAkhir;
        
        $recordsTotal       =   ItemStok::query()
                                ->select(['item'])
                                ->when(!empty($item), function(Builder $builder) use ($item){
                                    $builder->where('item', $item);
                                    return $builder;
                                })
                                ->when(!empty($rentangAwal), function(Builder $builder) use ($rentangAwal){
                                    $rentangAwal    =   $rentangAwal.' 00:00:00';
                                    $builder->where('createdAt', '>=', $rentangAwal);
                                    return $builder;
                                })
                                ->when(!empty($rentangAkhir), function(Builder $builder) use ($rentangAkhir){
                                    $rentangAkhir   =   $rentangAkhir.' 23:59:59';
                                    $builder->where('createdAt', '<=', $rentangAkhir);
                                    return $builder;
                                })
                                ->when(!empty($search), function(Builder $builder) use ($search){
                                    if(is_array($search)){
                                        if(array_key_exists('value', $search)){
                                            $searchValue    =   $search['value'];
                                            if(!empty($searchValue)){
                                                $builder->where('keterangan', 'like', '%'.$searchValue.'%');
                                            }
                                        }
                                    }

                                    return $builder;
                                })
                                ->groupBy('item')
                                ->count(['id']);   

        $listRekapanStok    =   ItemStok::query()
                                ->select(['item'])
                                ->when(!empty($item), function(Builder $builder) use ($item){
                                    $builder->where('item', $item);
                                    return $builder;
                                })
                                ->when(!empty($rentangAwal), function(Builder $builder) use ($rentangAwal){
                                    $rentangAwal    =   $rentangAwal.' 00:00:00';
                                    $builder->where('createdAt', '>=', $rentangAwal);
                                    return $builder;
                                })
                                ->when(!empty($rentangAkhir), function(Builder $builder) use ($rentangAkhir){
                                    $rentangAkhir   =   $rentangAkhir.' 23:59:59';
                                    $builder->where('createdAt', '<=', $rentangAkhir);
                                    return $builder;
                                })
                                ->when(!empty($search), function(Builder $builder) use ($search){
                                    if(is_array($search)){
                                        if(array_key_exists('value', $search)){
                                            $searchValue    =   $search['value'];
                                            if(!empty($searchValue)){
                                                $builder->where('keterangan', 'like', '%'.$searchValue.'%');
                                            }
                                        }
                                    }

                                    return $builder;
                                })
                                ->limit($length)
                                ->offset($start)
                                ->groupBy('item')
                                ->get();

        $nomorUrut  =   1;
        foreach($listRekapanStok as $index => $rekap){

            $detailItem     =   $rekap->item()->select(['id', 'nama', 'kode', 'satuan'])->first();
            $itemId         =   $detailItem->id;

            $getRekapStokIn     =   ItemModel::getStokIn($itemId);
            $getRekapStokOut    =   ItemModel::getStokOut($itemId);

            $rekapStokIn    =   (!empty($getRekapStokIn))? $getRekapStokIn->quantity : 0;
            $rekapStokOut   =   (!empty($getRekapStokOut))? $getRekapStokOut->quantity : 0;
            $rekapStok      =   $rekapStokIn - $rekapStokOut;
            
            $listRekapanStok[$index]['nomorUrut']   =   $nomorUrut;
            $listRekapanStok[$index]['item']        =   $detailItem;
            $listRekapanStok[$index]['stok']        =   $rekapStok;
            $listRekapanStok[$index]['stokIn']      =   $rekapStokIn;
            $listRekapanStok[$index]['stokOut']     =   $rekapStokOut;

            $nomorUrut++;
        }

        $respond   =   [
            'listRekapanStok'   =>  $listRekapanStok,
            'draw'              =>  $draw,
            'recordsFiltered'   =>  $recordsTotal,
            'recordsTotal'      =>  $recordsTotal
        ];

        return response()->json($respond);
    }
    public function addStock(Request $request): View|JsonResponse{
        $item               =   $request->item;
        $quantity           =   $request->quantity;
        $kategoriTransaksi  =   $request->kategoriTransaksi;
        $createdFrom        =   $request->createdFrom;
        $keterangan         =   $request->keterangan;

        if(!empty($item) && !empty($quantity) && !empty($kategoriTransaksi) && !empty($createdFrom)){
            $status     =   false;
            $message    =   'Gagal menambah stok item!';
            $data       =   null;

            try{
                DB::beginTransaction();

                $administrator      =   session()->get('administrator');
                $administratorId    =   $administrator->id;
                $dateTimeToday      =   date('Y-m-d H:i:s');

                #Checking Item
                $detailItem     =   ItemModel::query()->find($item);
                if(empty($detailItem)){
                    throw new Exception('Item tidak dikenal!');
                }
                
                #Checking Kategori Transaksi
                $detailKategoriTransaksi    =   KategoriTransaksi::query()->select(['id'])->find($kategoriTransaksi);
                if(empty($detailKategoriTransaksi)){
                    throw new Exception('Kategori Transaksi tidak dikenal!');
                }
                
                #Detail Item
                $itemId         =   $detailItem->id;
                $itemName       =   $detailItem->nama;
                $itemSatuan     =   $detailItem->satuan;

                #Checking Quantity
                if($quantity <= 0){
                    throw new Exception('Minimal quantity penambahan stock 1 '.$itemSatuan.'!');
                }

                #Checking Created From
                if(!in_array($createdFrom, array_keys(ItemStok::$createdFrom))){
                    throw new Exception('Created From code tidak dikenal!');
                }

                $itemStock  =   new ItemStok();
                $itemStock->item        =   $itemId;
                $itemStock->quantity    =   $quantity;
                $itemStock->keterangan  =   !empty($keterangan)? $keterangan : null;
                $itemStock->createdBy   =   $administratorId;
                $itemStock->createdFrom =   $createdFrom;
                $itemStock->createdAt   =   $dateTimeToday;
                $itemStock->kategori    =   $kategoriTransaksi;
                $saveItemStock  =   $itemStock->save();
                
                if($saveItemStock){
                    $itemStockId    =   $itemStock->id;

                    $getQuantityTerbaru =   ItemStok::query()
                                            ->select([DB::raw('SUM(quantity) as quantityTerbaru')])
                                            ->where('item', $itemId)
                                            ->first();
                    $quantityTerbaru    =   !empty($getQuantityTerbaru)? $getQuantityTerbaru->quantityTerbaru : 0;

                    $detailItem->quantityStok   =   $quantityTerbaru;
                    $detailItem->save();
                
                    $status     =   true;
                    $message    =   'Berhasil menambahkan stok Item '.$itemName.'!';
                    $data       =   ['id' => $itemStockId];
                }                

                if($status){
                    DB::commit();
                }
            }catch(QueryException $e){
                DB::rollBack();
                $message    =   $e->getMessage();
            }catch(Exception $e){
                DB::rollBack();
                $message    =   $e->getMessage();
            }

            $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
            $respond            =   $apiRespondFormat->getRespond();
            return response()->json($respond);
        }
    }
}
