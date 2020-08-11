<?php

namespace App\Http\Controllers;

use App\Product;
use App\PropertyValue;
use App\Supply;
use App\SupplyProduct;
use App\User;
use Barryvdh\DomPDF\PDF;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminSupplyController extends Controller
{
    /**
     * @var User
     */
    private $user;

    /**
     * AdminSupplyController constructor.
     * @param User $user
     */
    public function __construct (User $user)
    {
        $this->middleware('auth:admin');
        $this->user = $user;
    }

    /**
     * Display a listing of the resource.
     *
     * @param Supply $supply
     * @param PropertyValue $propertyValue
     * @return View
     */
    public function index(Supply $supply, PropertyValue $propertyValue) : View
    {
        $supply_list = $supply::orderBy('created_at', 'DESC')->paginate($this->list_item_count);

        $property_id   = config('constants.manufacturer_properties_id');
        $manufacturers = $propertyValue::all()->where('property_id', $property_id)->toArray();

        foreach ($supply_list as $key => $supply)
            $supply_list[$key]->property_label = isset($manufacturers[$supply->property_id]['value']) ? $manufacturers[$supply->property_id]['value'] : '-';

        $this->_assign('supply_list', $supply_list);

        return view('admin.supply.list');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @param PropertyValue $propertyValue
     * @return View
     */
    public function create(PropertyValue $propertyValue) : View
    {
        $property_id   = config('constants.manufacturer_properties_id');
        $manufacturers = $propertyValue::all()->where('property_id', $property_id);

        $this->_assign('manufacturers', $manufacturers);
        return view('admin.supply.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param Supply $supply
     * @param SupplyProduct $supplyProduct
     * @param Product $product
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request, Supply $supply, SupplyProduct $supplyProduct, Product $product)
    {
        $date           = $request->get('date');
        $products       = $request->get('products');
        $manufacturer   = $request->get('manufacturer');

        if (empty($date) || empty($products) || empty($manufacturer))
            return redirect()->back();

        $general = 0;
        if (!empty($products))
        {
            $product_ids  = array_keys($products);
            $product_list = Product::whereIn('id', $product_ids)->get(['id', 'price'])->toArray();

            if (!empty($product_list))
                foreach ($product_list as $item)
                    $general += $item['price'] * $products[$item['id']];
        }

        $supply->fill([
            'date'          => $date,
            'property_id'   => $manufacturer,
            'user_id'       => Auth::id(),
            'general_price' => $general
        ]);
        $supply->save();

        if (!empty($supply->id))
            $supplyProduct->asyncProducts($products, $supply->id);

        return redirect()->to(route('admin.supply.list'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param Supply $supply
     * @param SupplyProduct $supplyProduct
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, Supply $supply, SupplyProduct $supplyProduct)
    {
        $supply->status_id = 1;
        $supply->save();

        $products = $supplyProduct::where('supply_id', $supply->id)
                        ->get(['product_id', 'count'])->toArray();

        if (!empty($products))
        {
            $product_list = [];
            foreach ($products as $product)
                $product_list[$product['product_id']] = $product['count'];

            $supplyProduct->updateProductQty($product_list, 2);
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Supply $supply
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Supply $supply)
    {
        $supply->status_id = 2;
        $supply->save();

        return redirect()->back();
    }

    /**
     * Print Supply
     * @param Supply $supply
     * @param SupplyProduct $supplyProduct
     * @param PDF $pdf
     * @return \Illuminate\Http\Response
     */
    public function print(Supply $supply, SupplyProduct $supplyProduct, PDF $pdf)
    {
        $products = $supplyProduct::where('supply_id', $supply->id)
                                    ->join('products', 'supply_products.product_id', 'products.id')
                                    ->get(['products.*', 'supply_products.count']);

        return $pdf->loadView('print.supply_order', [
            'supply'    => $supply,
            'products'  => $products
        ])->stream();
    }
}
