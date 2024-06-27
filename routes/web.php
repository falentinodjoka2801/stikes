<?php

#Controllers
use App\Http\Controllers\Home;
use App\Http\Controllers\Autentikasi;

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::fallback(function(){
    return view('errors.404');
});

Route::prefix('/admin')->group(function(){
    Route::get('/', [Home::class, 'dashboard'])->name('/')->middleware('autentikasi');
    
    Route::prefix('/')->group(function(){
        //TODO : Untuk sekarang path login ketika diakses pada saat sudah login akan tetap mengarah ke halaman login. Untuk saat ini itu dibiarkan dulu, ke depannya akan ada perbaikan
        Route::get('login', [Autentikasi::class, 'login'])->name('admin.login');
        Route::post('login', [Autentikasi::class, 'loginProcess'])->name('admin.login-process');
        
        Route::get('lupa-password', [Autentikasi::class, 'lupaPassword'])->name('admin.lupa-password')->middleware('autentikasi');
        Route::get('logout', [Autentikasi::class, 'logout'])->name('admin.logout')->middleware('autentikasi');
    });
});
