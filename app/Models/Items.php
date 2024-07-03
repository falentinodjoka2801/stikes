<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Items extends Model{
    protected $table            =   'items';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    #Item yang memiliki detail
    public static array $itemsHaveDetail    =   [5];

    #Item yang memiliki stock
    public static array $itemsHaveStock     =   [11];

    public function items(): HasMany{
        return $this->hasMany(ItemDetail::class, 'item', 'id');
    }
    public function jenis(): HasOne{
        return $this->hasOne(Jenis::class, 'id', 'jenis');
    }
}
