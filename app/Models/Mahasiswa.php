<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model{
    protected $table            =   'mahasiswa';
    protected $primaryKey       =   'npm';
    protected $keyType          =   'integer';
    public $incrementing        =   false;
    public $timestamps          =   false;
}
