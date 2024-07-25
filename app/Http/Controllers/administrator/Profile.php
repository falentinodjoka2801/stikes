<?php

namespace App\Http\Controllers\administrator;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Libraries\APIRespondFormat;

#Model
use App\Models\Administrator;

use Exception;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class Profile extends Controller
{
    public function index(){
        $administrator          =   session()->get('administrator');
        $administratorId        =   $administrator->id;
        $detailAdministrator    =   Administrator::find($administratorId);

        $data   =   [
            'administrator' =>  $detailAdministrator
        ];

        return view('administrator.profile.index', $data);
    }
    public function save(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memproses update profile!';
        $data       =   null;

        DB::beginTransaction();

        try{
            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;
            
            #Validation Rules 
            #ada baiknya dibuatkan library tersendiri untuk get max input yg dapat ditampung oleh suatu field
            $validationRules    =   [
                'nama'      =>  'required|max:250',
                'telepon'   =>  'required',
                'email'     =>  'required',
                'alamat'    =>  'required'      
            ];
            $validator  =   Validator::make($request->input(), $validationRules);
            if($validator->fails()){
                throw new Exception('Data yang diinput tidak memenuhi validasi!');
            }
            
            $nama       =   $request->nama;
            $telepon    =   $request->telepon;
            $email      =   $request->email;
            $alamat     =   $request->alamat;

            $detailAdministrator    =   Administrator::query()->select(['id', 'nama', 'password'])->find($administratorId);
            $detailAdministrator->nama          =   $nama;
            $detailAdministrator->telepon       =   $telepon;
            $detailAdministrator->email         =   $email;
            $detailAdministrator->alamat        =   $alamat;
            $detailAdministrator->updatedBy     =   $administratorId;
            $detailAdministrator->updatedAt     =   rightNow();
            $saveProfileBaru    =   $detailAdministrator->save();

            if($saveProfileBaru){
                $status =   true;
            }
        }catch(QueryException $e){
            $message    =   $e->getMessage();
            DB::rollBack();
        }catch(Exception $e){
            $message    =   $e->getMessage();
            DB::rollBack();
        }

        if($status){
            DB::commit();
            $message    =   'Berhasil memproses update profile!';
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond    =   $apiRespondFormat->getRespond();
        return response()->json($respond);
    }
    public function saveGantiPassword(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memproses penggantian password!';
        $data       =   null;

        DB::beginTransaction();

        try{
            $passwordSaatIni        =   $request->passwordSaatIni;
            $passwordBaru           =   $request->passwordBaru;
            $konfirmasiPasswordBaru =   $request->konfirmasiPasswordBaru;

            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;
            $detailAdministrator    =   Administrator::query()->select(['id', 'nama', 'password'])->find($administratorId);
            
            #Detail Administrator
            $administratorPassword  =   $detailAdministrator->password;

            if(md5($passwordSaatIni) != $administratorPassword){
                throw new Exception('Password saat ini tidak sesuai dengan password yang sedang aktif!');
            }

            if(md5($passwordBaru) != md5($konfirmasiPasswordBaru)){
                throw new Exception('Passsword Baru dan Konfirmasi Password tidak sesuai!');
            }

            $detailAdministrator->password  =   md5($passwordBaru);
            $savePasswordBaru   =   $detailAdministrator->save();

            if($savePasswordBaru){
                $status     =   true;
            }
        }catch(QueryException $e){
            $message    =   $e->getMessage();
            DB::rollBack();
        }catch(Exception $e){
            $message    =   $e->getMessage();
            DB::rollBack();
        }

        if($status){
            DB::commit();
            $message    =   'Berhasil memproses penggantian password!';
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond    =   $apiRespondFormat->getRespond();
        return response()->json($respond);
    }
}
