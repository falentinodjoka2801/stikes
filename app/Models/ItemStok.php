<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ItemStok extends Model{
    protected $table            =   'item_stok';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    public static string $createdFrom_pengembalian  =   'pengembalian';
    public static array $createdFrom    =   [
        'pengembalian'  =>  'Pengembalian'
    ];
}
