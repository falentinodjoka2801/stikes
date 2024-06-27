<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class Home extends Controller
{
    public function dashboard(): View{
        $pageTitle  =   'Dashboard';
        $pageDesc   =   'Halaman Utama';
        
        return view('dashboard', compact(['pageTitle', 'pageDesc']));
    }
}
