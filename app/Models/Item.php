<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Item extends Model{
    protected $table            =   'item';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $incrementing        =   false;
    public $timestamps          =   false;

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
}
