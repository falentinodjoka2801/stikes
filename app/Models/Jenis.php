<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Jenis extends Model{
    protected $table            =   'jenis';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;
}
