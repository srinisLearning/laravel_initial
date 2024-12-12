<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePGModelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('p_g_models', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned();         
            $table->string('ap_name');
            $table->string('area');
            $table->string('facilites');
            $table->string('adl_info')->nullable();
            $table->string('gender');
            $table->string('usertype')->nullable();
            $table->string('city');
            $table->string('landmark');
            $table->string('image');
            $table->smallInteger('persons');
            $table->integer('rent');
            $table->string('certificate');
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('p_g_models');
    }
}
