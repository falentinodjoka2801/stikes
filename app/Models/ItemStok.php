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

    public static string $createdFrom_pengembalian      =   'pengembalian';
    public static string $createdFrom_item              =   'item';
    public static string $createdFrom_stockMinimum      =   'stockMinimum';
    public static array $createdFrom    =   [
        'pengembalian'  =>  'Pengembalian',
        'item'          =>  'Item',
        'stockMinimum'  =>  'Stock Minimum'
    ];

    public function item(): HasOne{
        return $this->hasOne(Items::class, 'id', 'item');
    }
}
