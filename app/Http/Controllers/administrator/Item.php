<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Item as ItemModel;

#Libraries
use App\Libraries\APIRespondFormat;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
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
    public function add(Request $request): View{
        $data   =   [
            'pageTitle'     =>  'Item Baru',
            'listJenis'     =>  ItemModel::listJenis(),
            'listKondisi'   =>  ItemModel::listKondisi(),
            'listStatus'    =>  ItemModel::listStatus(),
        ];
        return view('administrator.item.add', $data);
    }
    public function save(Request $request): JsonResponse{
        $administrator      =   session()->get('administrator');
        $administratorId    =   $administrator->id;

        $status     =   false;
        $message    =   'Gagal memproses Item!';
        $data       =   null;

        #Collect Data
        $nama           =   $request->nama;
        $jenis          =   $request->jenis;
        $kelompok       =   $request->kelompok;
        $kondisi        =   $request->kondisi;
        $statusBarang   =   $request->status;

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
        $item->nama         =   $nama;
        $item->jenis        =   $jenis;
        $item->kelompok     =   $kelompok;
        $item->kondisi      =   $kondisi;
        $item->status       =   $statusBarang;
        $item->createdBy    =   $administratorId;
        $item->createdAt    =   $dateTimeToday;
        $saveItem   =   $item->save();

        if($saveItem){
            $status     =   true;
            $message    =   'Berhasil memproses item!';
            $data       =   [
                'id'    =>  $item->id
            ];
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
        
        $recordsTotal   =   ItemModel::count(['id']);   

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
            $listItem[$index]['nomorUrut'] =   $nomorUrut;
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
}
