<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class PinjamItem extends Model{
    protected $table            =   'pinjam_item';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;    

    public function item(): HasOne{
        return $this->hasOne(Items::class, 'id', 'item');
    }
}
