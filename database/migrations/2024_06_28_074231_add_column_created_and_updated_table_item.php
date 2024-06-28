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
        Schema::table('item', function (Blueprint $table) {
            $table->integer('createdBy')->nullable();
            $table->dateTime('createdAt')->nullable();
            $table->integer('updatedBy')->nullable()->default(null);
            $table->dateTime('updatedAt')->nullable()->default(null);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('item', function (Blueprint $table) {
            $table->dropColumn('createdBy');
            $table->dropColumn('createdAt');
            $table->dropColumn('updatedBy');
            $table->dropColumn('updatedAt');
        });
    }
};
