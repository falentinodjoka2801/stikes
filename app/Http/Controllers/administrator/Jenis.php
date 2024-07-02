<?php

namespace App\Http\Controllers\administrator;

#Models
use App\Models\Jenis as JenisModel;

#Libraries
use App\Libraries\APIRespondFormat;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\View\View;

class Jenis extends Controller{
    public function index(Request $request): View{
        $data   =   [
            'pageTitle'     =>  'List Jenis'
        ];
        return view('administrator.jenis.index', $data);
    }
    public function data(Request $request): JsonResponse{
        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search         =   $request->search;
        
        $recordsTotal   =   JenisModel::when(!empty($search), function(Builder $builder) use ($search){
                                if(is_array($search)){
                                    if(array_key_exists('value', $search)){
                                        $searchValue    =   $search['value'];
                                        if(!empty($searchValue)){
                                            $builder->where('nama', 'like', '%'.$searchValue.'%');
                                            $builder->orWhere('keterangan', 'like', '%'.$searchValue.'%');
                                        }
                                    }
                                }

                                return $builder;
                            })->count(['id']);   

        $listJenis      =   JenisModel::query()
                            ->when(!empty($search), function(Builder $builder) use ($search){
                                if(is_array($search)){
                                    if(array_key_exists('value', $search)){
                                        $searchValue    =   $search['value'];
                                        if(!empty($searchValue)){
                                            $builder->where('nama', 'like', '%'.$searchValue.'%');
                                            $builder->orWhere('keterangan', 'like', '%'.$searchValue.'%');
                                        }
                                    }
                                }

                                return $builder;
                            })
                            ->limit($length)
                            ->offset($start)
                            ->get();

        $nomorUrut  =   1;
        foreach($listJenis as $index => $jenis){
            $jenisId     =   $jenis->id;

            $encryptedId    =   encrypt($jenisId);

            $listJenis[$index]['nomorUrut']      =   $nomorUrut;
            $listJenis[$index]['encryptedId']    =   $encryptedId;

            $nomorUrut++;
        }

        $respond   =   [
            'listJenis'          =>  $listJenis,
            'draw'              =>  $draw,
            'recordsFiltered'   =>  $recordsTotal,
            'recordsTotal'      =>  $recordsTotal
        ];

        return response()->json($respond);
    }
    public function add(Request $request, ?string $encryptedId = null): View{
        try{
            $id     =   null;
            $jenis  =   null;

            if(!empty($encryptedId)){
                $id     =   decrypt($encryptedId);
                $jenis  =   JenisModel::find($id);
            }

            $doesUpdate =   !empty($jenis);

            $data   =   [
                'pageTitle'     =>  ($doesUpdate)? 'Update Jenis' : 'Jenis Baru',
                'pageDesc'      =>  ($doesUpdate)? $jenis->nama : '',
                'jenis'         =>  $jenis
            ];
            return view('administrator.jenis.add', $data);
        }catch(Exception $e){
            abort(500);
        }
    }
    public function save(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memproses Jenis!';
        $data       =   null;

        try{
            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;

            #Collect Data
            $id             =   $request->id;
            $nama           =   $request->nama;
            $keterangan     =   $request->keterangan;

            $doesUpdate     =   !empty($id);
            if($doesUpdate){
                $jenis   =   JenisModel::find($id);
                if(empty($jenis)){
                    throw new Exception('Jenis tidak terdefinisi!');
                }
            }

            $dateTimeToday  =   date('Y-m-d H:i:s');
            
            if(!$doesUpdate){
                $jenis   =   new JenisModel();
                $jenis->createdBy    =   $administratorId;
                $jenis->createdAt    =   $dateTimeToday;
            }else{
                $jenis->updatedBy   =   $administratorId;
                $jenis->updatedAt   =   $dateTimeToday;
            }
            
            $jenis->nama        =   $nama;
            $jenis->keterangan  =   $keterangan;
            $saveJenis          =   $jenis->save();

            if($saveJenis){
                $status     =   true;
                $message    =   'Berhasil memproses Jenis!';
                $data       =   [
                    'id'    =>  $jenis->id
                ];
            }

        }catch(Exception $e){
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function delete(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal menghapus Jenis!';
        $data       =   null;

        try{
            #Collect Data
            $jenis     =   $request->jenis;
            $detailJenis     =   JenisModel::query()->find($jenis);
            if(empty($detailJenis)){
                throw new Exception('Jenis tidak terdefinisi!');
            }

            $delete     =   $detailJenis->delete();
            if($delete){
                $status     =   true;
                $message    =   'Berhasil menghapus jenis!';
            }
        }catch(Exception $e){
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
}
