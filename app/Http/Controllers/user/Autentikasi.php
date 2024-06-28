<?php

namespace App\Http\Controllers\user;

#Libraries
use App\Libraries\APIRespondFormat;

#Facades
use Illuminate\Support\Facades\DB;

#Models
use App\Models\Administrator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\RedirectResponse;

use App\Http\Controllers\Controller;
use App\Models\Mahasiswa;

class Autentikasi extends Controller{
    public function login(): View{
        return view('autentikasi.user.login');
    }
    public function loginProcess(Request $request): JsonResponse|RedirectResponse {
        $status     =   false;
        $message    =   'Kombinasi username dan password tidak valid!';
        $data       =   null;

        $username   =   $request->username;
        $password   =   $request->password;

        $mahasiswa  =   Mahasiswa::query()->where(function(Builder $builder) use ($username, $password){
            $builder->where('npm', '=', $username);
            $builder->where('password', '=', md5($password));
        })->first();
        if(!empty($mahasiswa)){
            session()->put('user', $mahasiswa);

            $status     =   true;
            $message    =   'Berhasil!';
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function lupaPassword(): View{
        return view('autentikasi.lupa-password');
    }
    public function logout(Request $request): RedirectResponse{
        $request->session()->remove('user');
        return response()->redirectToRoute('user.login');
    }
}
