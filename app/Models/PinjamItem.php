<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PinjamItem extends Model{
    protected $table            =   'pinjam_item';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;    
}
