<?php

namespace App\Http\Controllers\user;

use Illuminate\Http\Request;
use Illuminate\View\View;

use App\Http\Controllers\Controller;

class Home extends Controller
{
    public function dashboard(): View{
        $pageTitle  =   'Dashboard';
        $pageDesc   =   'Halaman Utama';
        
        return view('user.dashboard', compact(['pageTitle', 'pageDesc']));
    }
}
