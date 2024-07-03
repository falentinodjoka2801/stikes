<?php

#Administrator Controllers
use App\Http\Controllers\administrator\Home;
use App\Http\Controllers\administrator\Autentikasi;
use App\Http\Controllers\administrator\Item;
use App\Http\Controllers\administrator\Jenis;
use App\Http\Controllers\administrator\Pinjam as AdministratorPinjam;

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

#Administrator
Route::prefix('/admin')->group(function(){
    Route::get('/', [Home::class, 'dashboard'])->middleware('autentikasi')->name('admin.dashboard');
    
    Route::prefix('/')->group(function(){
        //TODO : Untuk sekarang path login ketika diakses pada saat sudah login akan tetap mengarah ke halaman login. Untuk saat ini itu dibiarkan dulu, ke depannya akan ada perbaikan
        Route::get('login', [Autentikasi::class, 'login'])->name('admin.login');
        Route::post('login', [Autentikasi::class, 'loginProcess'])->name('admin.login-process');
        
        Route::get('logout', [Autentikasi::class, 'logout'])->name('admin.logout')->middleware('autentikasi');
    });

    Route::prefix('/item')->middleware('autentikasi')->group(function(){
        Route::get('', [Item::class, 'index'])->name('admin.item');
        Route::get('/data', [Item::class, 'data'])->name('admin.item.data');
        Route::get('/add', [Item::class, 'add'])->name('admin.item.add');
        Route::post('/save', [Item::class, 'save'])->name('admin.item.save');
        Route::post('/delete', [Item::class, 'delete'])->name('admin.item.delete');
        Route::get('/edit/{encryptedId}', [Item::class, 'add'])->name('admin.item.edit');
        Route::get('/detail/{encryptedId}', [Item::class, 'detail'])->name('admin.item.detail');
        Route::post('/save-item', [Item::class, 'saveItem'])->name('admin.item.save-item');
        Route::post('/delete-item', [Item::class, 'deleteItem'])->name('admin.item.delete-item');
        Route::get('/import', [Item::class, 'import'])->name('admin.item.import');
        Route::post('/import', [Item::class, 'import'])->name('admin.item.import');
    });

    Route::prefix('/jenis')->middleware('autentikasi')->group(function(){
        Route::get('', [Jenis::class, 'index'])->name('admin.jenis');
        Route::get('/data', [Jenis::class, 'data'])->name('admin.jenis.data');
        Route::get('/add', [Jenis::class, 'add'])->name('admin.jenis.add');
        Route::post('/save', [Jenis::class, 'save'])->name('admin.jenis.save');
        Route::post('/delete', [Jenis::class, 'delete'])->name('admin.jenis.delete');
        Route::get('/edit/{encryptedId}', [Jenis::class, 'add'])->name('admin.jenis.edit');
    });

    Route::prefix('/pinjam')->middleware('autentikasi')->group(function(){
        Route::get('/peminjaman', [AdministratorPinjam::class, 'peminjaman'])->name('admin.pinjam.peminjaman');
        Route::get('/pengembalian', [AdministratorPinjam::class, 'pengembalian'])->name('admin.pinjam.pengembalian');
        Route::post('/proses-nomor-peminjaman', [AdministratorPinjam::class, 'prosesNomorPengembalian'])->name('admin.pinjam.proses-nomor-peminjaman');
        Route::get('/pengembalian/{encryptedIdPeminjaman}', [AdministratorPinjam::class, 'pengembalian']);
        Route::get('/distribusi/{encryptedIdPeminjaman}', [AdministratorPinjam::class, 'distribusi'])->name('admin.pinjam.distribusi');
        Route::get('/peminjaman-data', [AdministratorPinjam::class, 'peminjamanData'])->name('admin.pinjam.peminjaman-data');
        Route::post('/proses-pengembalian', [AdministratorPinjam::class, 'prosesPengembalian'])->name('admin.pinjam.proses-pengembalian');
        Route::post('/proses-distribusi', [AdministratorPinjam::class, 'prosesDistribusi'])->name('admin.pinjam.proses-distribusi');
    });
});

#User
Route::prefix('/')->group(function(){
    Route::get('/', [UserHome::class, 'dashboard'])->middleware('userAutentikasi')->name('user.dashboard');

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
        Route::get('/data-item', [Pinjam::class, 'dataItem'])->name('user.pinjam.data-item');
    });

});