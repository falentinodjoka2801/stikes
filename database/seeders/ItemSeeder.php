<?php

namespace Database\Seeders;

use App\Models\Item;
use Illuminate\Database\Seeder;

class ItemSeeder extends Seeder
{
    public function run()
    {
        $dateToday   =   date('Ymd');

        #Alat
        for($i = 1; $i <= 100; $i++){
            $kode   =   'A'.$dateToday.str_pad($i, 3, '0', STR_PAD_LEFT);
            $nama   =   'Alat '.$i;

            $item   =   new Item();
            $item->kode     =   $kode;
            $item->nama     =   $nama;
            $item->jenis    =   'alat';
            $item->kelompok =   '-';
            $item->kondisi  =   'bagus';
            $item->status   =   'ready';
            $item->peminjam =   null;
            $item->save();
        }
        
        #Ruangan
        for($i = 1; $i <= 100; $i++){
            $kode   =   'R'.$dateToday.str_pad($i, 3, '0', STR_PAD_LEFT);
            $nama   =   'Ruangan '.$i;

            $item   =   new Item();
            $item->kode     =   $kode;
            $item->nama     =   $nama;
            $item->jenis    =   'ruang';
            $item->kelompok =   '-';
            $item->kondisi  =   'bagus';
            $item->status   =   'ready';
            $item->peminjam =   null;
            $item->save();
        }
    }
}
