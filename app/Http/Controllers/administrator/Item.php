<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Item as ItemModel;

#Libraries
use App\Libraries\APIRespondFormat;
use Illuminate\Http\Request;

#Facades
use Illuminate\Support\Facades\DB;

use App\Http\Controllers\Controller;
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
        $status     =   false;
        $message    =   'Gagal memproses Item!';
        $data       =   null;

        #Collect Data
        $nama       =   $request->nama;
        $jenis      =   $request->jenis;
        $kelompok   =   $request->kelompok;
        $kondisi    =   $request->kondisi;
        $statusBarang   =   $request->status;

        $kode   =   date('YmdHis');

        $item   =   new ItemModel();
        $item->kode         =   $kode;
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

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    } 
}
