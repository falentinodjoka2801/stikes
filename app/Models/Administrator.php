<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Administrator extends Model{
    protected $table            =   'administrator';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $incrementing        =   false;
    public $timestamps          =   false;
}
