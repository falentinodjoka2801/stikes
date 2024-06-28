<?php

#Controllers
use App\Http\Controllers\Home;
use App\Http\Controllers\Autentikasi;

use App\Http\Controllers\administrator\Item;

#User Controller
use App\Http\Controllers\user\Home as UserHome;
use App\Http\Controllers\user\Autentikasi as UserAutentikasi;
use App\Http\Controllers\user\Pinjam;

#Facede
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
    Route::get('/', [Home::class, 'dashboard'])->middleware('autentikasi')->name('/');
    
    Route::prefix('/')->group(function(){
        //TODO : Untuk sekarang path login ketika diakses pada saat sudah login akan tetap mengarah ke halaman login. Untuk saat ini itu dibiarkan dulu, ke depannya akan ada perbaikan
        Route::get('login', [Autentikasi::class, 'login'])->name('admin.login');
        Route::post('login', [Autentikasi::class, 'loginProcess'])->name('admin.login-process');
        
        Route::get('logout', [Autentikasi::class, 'logout'])->name('admin.logout')->middleware('autentikasi');
    });

    Route::prefix('/item')->middleware('autentikasi')->group(function(){
        Route::get('', [Item::class, 'index'])->name('admin.item');
        Route::get('/add', [Item::class, 'add'])->name('admin.item.add');
        Route::post('/save', [Item::class, 'save'])->name('admin.item.save');
    });
});

Route::prefix('/')->group(function(){
    Route::get('/', [UserHome::class, 'dashboard'])->middleware('userAutentikasi')->name('/');

    Route::prefix('/')->group(function(){
        Route::get('login', [UserAutentikasi::class, 'login'])->name('user.login');
        Route::post('login', [UserAutentikasi::class, 'loginProcess'])->name('user.login-process');
        
        Route::get('logout', [UserAutentikasi::class, 'logout'])->name('user.logout')->middleware('userAutentikasi');
    });

    Route::prefix('/pinjam')->middleware('userAutentikasi')->group(function(){
        Route::get('/', [Pinjam::class, 'index'])->name('user.pinjam');
        Route::get('/data', [Pinjam::class, 'data'])->name('user.pinjam.data');
        Route::get('/add', [Pinjam::class, 'add'])->name('user.pinjam.add');
        Route::post('/save', [Pinjam::class, 'save'])->name('user.pinjam.save');
    });

});