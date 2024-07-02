<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Item as ItemModel;

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
                'listKondisi'   =>  ItemModel::listKondisi(),
                'listStatus'    =>  ItemModel::listStatus(),
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
            $kondisi        =   $request->kondisi;
            $statusBarang   =   $request->status;

            $doesUpdate     =   !empty($id);
            if($doesUpdate){
                $item   =   ItemModel::find($id);
                if(empty($item)){
                    throw new Exception('Item tidak terdefinisi!');
                }
            }

            if(!$doesUpdate){
                $dateToday      =   date('Y-m-d');
                $dateTimeToday  =   date('Y-m-d H:i:s');

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

                $initialLetter  =   'A';
                if($jenis == 'ruang'){
                    $initialLetter  =   'R';
                }
                
                $urutan     =   str_pad($urutanItemToday, 3, '0', STR_PAD_LEFT);
                $kode       =   $initialLetter.date('Ymd').$urutan;

                $item   =   new ItemModel();
                $item->kode         =   $kode;
                $item->createdBy    =   $administratorId;
                $item->createdAt    =   $dateTimeToday;
            }
            
            $item->nama         =   $nama;
            $item->jenis        =   $jenis;
            $item->kelompok     =   $kelompok;
            $item->kondisi      =   $kondisi;
            $item->status       =   $statusBarang;
            $saveItem   =   $item->save();

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
            $itemJenis  =   $item->jenis;

            $encryptedId    =   encrypt($itemId);
            $hasDetail      =   in_array($itemJenis, $itemHaveDetail);

            $listItem[$index]['nomorUrut']      =   $nomorUrut;
            $listItem[$index]['encryptedId']    =   $encryptedId;
            $listItem[$index]['hasDetail']      =   $hasDetail;

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
}
