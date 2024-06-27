<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Item extends Model{
    protected $table            =   'item';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $incrementing        =   false;
    public $timestamps          =   false;

    public static function listJenis(): array{
        $listJenis    =   [
            ['id' => 'tool', 'nama' => 'Alat Kesehatan'],
            ['id' => 'room', 'nama' => 'Ruangan']
        ];

        return $listJenis;
    }
    public static function listKondisi(): array{
        $listKondisi    =   [
            ['id' => 'good', 'nama' => 'Bagus'],
            ['id' => 'broken', 'nama' => 'Rusak']
        ];

        return $listKondisi;
    }
    public static function listStatus(): array{
        $listStatus    =   [
            ['id' => 'ready', 'nama' => 'Ready'],
            ['id' => 'borrowed', 'nama' => 'Dipinjam']
        ];

        return $listStatus;
    }
}
