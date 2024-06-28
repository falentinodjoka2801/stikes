<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Item as ItemModel;

#Libraries
use App\Libraries\APIRespondFormat;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\View\View;

class Item extends Controller{
    public function index(Request $request): View{
        $data   =   [
            'pageTitle'     =>  'List Item',
            'listItem'      =>  []
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
}
