<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mahasiswa', function (Blueprint $table) {
            $table->integer('npm')->nullable(false)->primary();
            $table->string('nisn', 20)->nullable(false);
            $table->string('nama', 100)->nullable(false);
            $table->tinyInteger('angkatan')->nullable(false);
            $table->string('tempatLahir', 250)->nullable(false);
            $table->date('tanggalLahir')->nullable(false);
            $table->string('jenisKelamin', 1)->nullable(false);
            $table->string('namaIbu', 100)->nullable(false);
            $table->tinyInteger('agama')->nullable(false);
            $table->string('ktp', 50)->nullable(false);
            $table->string('penerimaKPS', 1)->nullable(false);
            $table->string('asalSekolah', 1)->nullable(false);
            $table->string('alamat', 250)->nullable(false);
            $table->string('hp', 20)->nullable(false);
            $table->string('rekomendasi', 100)->nullable()->default(null);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mahasiswa');
    }
};
