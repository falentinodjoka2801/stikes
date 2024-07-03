<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Jenis extends Model{
    protected $table            =   'jenis';
    protected $primaryKey       =   'id';
    protected $keyType          =   'integer';
    public $timestamps          =   false;

    public static string $jenis_alat        =   '3';
    public static string $jenis_ruangan     =   '5';
    public static string $jenis_phantom     =   '10';
    public static string $jenis_bhp         =   '11';

    public static function getInitialLetter($jenis): string{
        $initialLetter  =   null;
        
        if($jenis == self::$jenis_alat){
            $initialLetter  =   'A';
        }
        if($jenis == self::$jenis_ruangan){
            $initialLetter  =   'R';
        }
        if($jenis == self::$jenis_phantom){
            $initialLetter  =   'P';
        }
        if($jenis == self::$jenis_bhp){
            $initialLetter  =   'BHP';
        }

        return $initialLetter;                
    }
}
