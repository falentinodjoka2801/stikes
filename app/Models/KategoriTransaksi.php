<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class KategoriTransaksi extends Model{
    protected $table            =   'kategori_transaksi';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    public static string $inisialisasi  =   '5';

    public static string $in    =   'in';
    public static string $out   =   'out';
    public static array $inOut  =   [
        'in'    =>  'Penambahan',
        'out'   =>  'Pengurangan'
    ];

    public function scopeIn(Builder $builder){
        $builder->where('inOut', self::$in);
        return $builder;
    }
    public function scopeOut(Builder $builder){
        $builder->where('inOut', self::$out);
        return $builder;
    }
    public function scopeExcludeInisialisasi(Builder $builder){
        $builder->where('id', '!=', self::$inisialisasi);
        return $builder;
    }
}
