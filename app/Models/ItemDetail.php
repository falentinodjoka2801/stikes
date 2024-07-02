<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ItemDetail extends Model{
    protected $table            =   'item_detail';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    public function creator(): HasOne{
        return $this->hasOne(Administrator::class, 'id', 'createdBy');
    }
}
