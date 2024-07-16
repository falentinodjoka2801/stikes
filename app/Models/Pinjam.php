<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Pinjam extends Model{
    protected $table            =   'pinjam';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    public function items(): HasMany{
        return $this->hasMany(PinjamItem::class, 'pinjam', 'id');
    }
    public function peminjam(): HasOne{
        return $this->hasOne(Mahasiswa::class, 'npm', 'createdBy');
    }

    public static string $statusPeminjaman_dipinjam             =   'dipinjam';
    public static string $statusPeminjaman_distribusi           =   'distribusi';
    public static string $statusPeminjaman_dikembalikan         =   'dikembalikan';
    public static array $statusPeminjaman   =   [
        'dipinjam'          =>  'Sedang Dipinjam',
        'distribusi'        =>  'Butuh Distribusi',
        'dikembalikan'      =>  'Sudah Dikembalikan'
    ];
}
