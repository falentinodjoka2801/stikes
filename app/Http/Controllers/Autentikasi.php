<?php

namespace App\Http\Controllers;

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

class Autentikasi extends Controller{
    public function login(): View{
        return view('autentikasi.login');
    }
    public function loginProcess(Request $request): JsonResponse|RedirectResponse {
        $status     =   false;
        $message    =   'Kombinasi username dan password tidak valid!';
        $data       =   null;

        $username   =   $request->username;
        $password   =   $request->password;

        $administrator  =   Administrator::query()->where(function(Builder $builder) use ($username, $password){
            $builder->where('username', '=', $username);
            $builder->where('password', '=', md5($password));
        })->first();
        if(!empty($administrator)){
            session()->put('administrator', $administrator);

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
        $request->session()->remove('administrator');
        return response()->redirectToRoute('admin.login');
    }
}
