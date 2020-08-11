<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSupplyProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('supply_products', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->bigInteger('supply_id')->unsigned();
            $table->bigInteger('product_id')->unsigned();
            $table->bigInteger('count')->default(1);
            $table->timestamps();

//            $table->foreign('supply_id')->references('id')->on('supply');
//            $table->foreign('product_id')->references('id')->on('products');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('supply_products');
    }
}
