<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Item extends Model{
    protected $table            =   'item';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    #Item yang memiliki detail
    public static array $itemsHaveDetail  =   [5];

    public static function listKondisi(): array{
        $listKondisi    =   [
            ['id' => 'bagus', 'nama' => 'Bagus'],
            ['id' => 'rusak', 'nama' => 'Rusak']
        ];

        return $listKondisi;
    }
    public static function listStatus(): array{
        $listStatus    =   [
            ['id' => 'ready', 'nama' => 'Ready'],
            ['id' => 'dipinjam', 'nama' => 'Dipinjam']
        ];

        return $listStatus;
    }
    public function items(): HasMany{
        return $this->hasMany(ItemDetail::class, 'item', 'id');
    }
}
