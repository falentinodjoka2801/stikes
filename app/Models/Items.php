<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Facades\DB;

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
    public function getStok($itemId){
        $stok   =   ItemStok::query()->select([DB::raw('SUM(quantity) as quantityStok')])
                    ->where('item', $itemId)
                    ->where('quantity', '>=', 0)
                    ->first();
        return $stok;
    }
    public static function getStokIn($itemId){
        $stokIn    =   ItemStok::query()->select([DB::raw('ABS(SUM(quantity)) as quantity')])
                        ->where('item', $itemId)
                        ->where('quantity', '>=', 0)
                        ->first();
        return $stokIn;
    }
    public static function getStokOut($itemId){
        $stokOut    =   ItemStok::query()->select([DB::raw('ABS(SUM(quantity)) as quantity')])
                        ->where('item', $itemId)
                        ->where('quantity', '<=', -1)
                        ->first();
        return $stokOut;
    }
}
