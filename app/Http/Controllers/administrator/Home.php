<?php

namespace App\Http\Controllers\administrator;

use App\Http\Controllers\Controller;
use Illuminate\View\View;

class Home extends Controller
{
    public function dashboard(): View{
        $pageTitle  =   'Dashboard';
        $pageDesc   =   'Halaman Utama';
        
        return view('administrator.dashboard', compact(['pageTitle', 'pageDesc']));
    }
}
