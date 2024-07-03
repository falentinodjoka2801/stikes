<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Items as ItemModel;

#Libraries
use App\Libraries\APIRespondFormat;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Models\ItemDetail;
use App\Models\Jenis;

use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\View\View;

class Item extends Controller{
    public function index(Request $request): View{
        $data   =   [
            'pageTitle'     =>  'List Item'
        ];
        return view('administrator.item.index', $data);
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

            $listJenis  =   Jenis::query()->select(['id', 'nama'])->get();

            $data   =   [
                'pageTitle'     =>  ($doesUpdate)? 'Update Item' : 'Item Baru',
                'pageDesc'      =>  ($doesUpdate)? $item->nama : '',
                'listJenis'     =>  $listJenis,
                'item'          =>  $item
            ];
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

            $doesUpdate     =   !empty($id);
            if($doesUpdate){
                $item   =   ItemModel::find($id);
                if(empty($item)){
                    throw new Exception('Item tidak terdefinisi!');
                }
            }

            $detailJenis    =   Jenis::query()->select(['nama'])->find($jenis);
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
                $item->updatedBy    =   $administratorId;
                $item->updatedAt    =   $dateTimeToday;
            }
            
            $item->nama             =   $nama;
            $item->jenis            =   $jenis;
            $item->kelompok         =   $kelompok;
            $item->quantityStok     =   $quantityStok;
            $item->satuan           =   $satuan;
            $saveItem               =   $item->save();

            if($saveItem){
                $status     =   true;
                $message    =   'Berhasil memproses item!';
                $data       =   [
                    'id'    =>  $item->id
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
        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search         =   $request->search;
        
        $itemHaveDetail =   ItemModel::$itemsHaveDetail;
        $recordsTotal   =   ItemModel::when(!empty($search), function(Builder $builder) use ($search){
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
    #Only For Me
    /*
    public function import(Request $request): View|JsonResponse{
        $file   =   $request->file('file');
        if(empty($file)){
            return view('administrator.item.import');
        }else{
            
            DB::beginTransaction();
            $namaRuang  =   'Laboratorium Biomedik';
            $listItemRuang  =   [
                ['jumlah' => '1', 'ruang' => 'Meja Dosen'],
                ['jumlah' => '2', 'ruang' => 'Meja Panjang'],
                ['jumlah' => '6', 'ruang' => 'Kursi'],
                ['jumlah' => '1', 'ruang' => 'Lemari '],
                ['jumlah' => '1', 'ruang' => 'Tong Sampah'],
                ['jumlah' => '1', 'ruang' => 'Tv'],
                ['jumlah' => '1', 'ruang' => 'Jam Dinding'],
                ['jumlah' => '1', 'ruang' => 'Mikroskop'],
                ['jumlah' => '2', 'ruang' => 'Multifunctional Mixer'],
                ['jumlah' => '1', 'ruang' => 'Electrolyte Analyzer']





            ];
            
            $item   =   new ItemModel();
            $kode   =   'R'.date('Ymd').str_pad('20', 3, 0, STR_PAD_LEFT);

            $item->kode =   $kode;
            $item->nama =   $namaRuang;
            $item->jenis    =   5;
            $item->kelompok =   '-';
            $item->kondisi  =   'bagus';
            $item->status   =   'ready';
            $item->peminjam =   null;
            $item->createdBy    =   2;
            $item->createdAt    =   date('Y-m-d H:i:s');
            $item->save();

            $nomorUrut  =   1;
            foreach($listItemRuang as $index => $ruang){
                $nomorUrut  =   $index + 1;

                $itemDetail   =   new ItemDetail();
                $itemDetail->item   =   $item->id;
                $itemDetail->detail =   $ruang['ruang'];
                $itemDetail->jumlah =   $ruang['jumlah'];
                $itemDetail->createdBy  =   2;
                $itemDetail->createdAt  =   date('Y-m-d H:i:s');
                $itemDetail->save();

                $nomorUrut++;
            }

            DB::commit();

            return response()->json(['data' => 'OK']);
        }
    }
    */
}
