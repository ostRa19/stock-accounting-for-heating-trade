<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class SupplyProduct extends Model
{

    /**
     * @var string $table
     */
    protected $table = 'supply_products';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'product_id',
        'supply_id',
        'count'
    ];

    /**
     * Async Products
     * @param $products
     * @param $supply_id
     * @return bool
     */
    public function asyncProducts($products, $supply_id)
    {
        $this::where('supply_id', $supply_id)->delete();

        $fill_product = [];
        foreach ($products as $key => $count)
            $fill_product[] = [
                'product_id'    => $key,
                'supply_id'     => $supply_id,
                'count'         => $count,
                'created_at'    => Carbon::now()->toDateTimeString(),
                'updated_at'    => Carbon::now()->toDateTimeString(),
            ];

        if (!empty($fill_product))
            $this::insert($fill_product);

        /*
         * Update product qty
         */
        $this->updateProductQty($products);
    }

    /**
     * Update Product qty
     * @param Supply $supply
     * @param $products
     * @param int $status
     */
    public function updateProductQty($products, $status = 1)
    {
        /*
         * Status ID 1 - in supply, 2 - in storage
         */
        if (!in_array($status, [1, 2]))
            $status = 1;

        $mProduct = new Product();

        foreach ($products as $id => $count)
        {
            $update_qr = [
                ($status == 1 ? 'qty_delivery' : 'qty') => DB::raw(($status == 1 ? 'qty_delivery' : 'qty') . '+' . $count),
            ];

            if ($status == 2)
               $update_qr = array_merge($update_qr, ['qty_delivery' => DB::raw('qty_delivery' . '-' . $count)]);

            $mProduct->where('id', $id)->update($update_qr);
        }
    }

}
