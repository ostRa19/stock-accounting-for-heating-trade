<?php

namespace App\Http\Controllers;

use App\Property;
use App\PropertyValue;
use Illuminate\Http\Request;
use App\Product;
use App\Catalog;

class AdminProductsController extends Controller
{
    public function __construct ()
    {
        $this->middleware('auth:admin');
    }

    public function list ()
    {
        //todo app settings
        $products = Product::paginate(15);
        $categories = Catalog::all('id', 'name');
        return view('admin.products', ['products' => $products, 'categories' => $categories]);
    }

    public function categoryFilter (Request $request, $category_id)
    {
        $products = $category_id ?
            Product::where('catalog_id', $category_id)->paginate(10) :
            Product::paginate(10);

        if ($request->ajax()) {
            return view('admin.products-load', compact('products'))->render();
        }

        $categories = Catalog::all('id', 'name');
        return view('admin.products', ['products' => $products, 'categories' => $categories]);
    }

    public function search(Request $request, Product $product)
    {
        $keyword = $request->get('keyword');
        if (empty($keyword))
            return back();

        $products   = Product::where("name", "LIKE","%$keyword%")->paginate(15);
        $categories = Catalog::all('id', 'name');

        $this->_assign('keyword',       $keyword);
        $this->_assign('products',      $products);
        $this->_assign('categories',    $categories);

        return view('admin.products');
    }

    public function delete (Request $request)
    {

        if (!$request->id) return back()->withErrors('Server Error... Please try again.');

        $product = Product::find($request->id);

        if (!$product) return back()->withErrors('Server Error... Product not found');

        $product->delete();
        return redirect()->back()->with('message', 'Product ' . $product->name . ' was deleted!');
    }

    public function addProduct()
    {
        $categories = Catalog::all('id', 'name');
        $properties = Property::all();

        return view('admin.add-product', [
            'categories' => $categories,
            'properties' => $properties
        ]);
    }

    public function addProductPost(Request $request, Product $product)
    {
        $this->validate($request, [
            'name'      => 'required | min:3 | max:150',
            'price'     => 'required | min:1 | max:10',
            'qty'       => 'required | min:0',
            'image'     => 'image | mimes:jpeg,png,jpg,gif,svg | max:2048',
            'category'  => 'required'
        ]);

        $message = 'Товар ' . $request->name . ' був доданий!';

        $product->name          = $request->name;
        $product->price         = $request->price;
        $product->description   = $request->description;
        $product->catalog_id    = $request->category;
        $product->qty           = $request->qty;

        $product->qty_order = $product->qty_delivery = 0;

        if ($request->hasFile('image'))
        {
            $image      = $request->file('image');
            $imageName  = 'prod_' . time() . '.' . $image->getClientOriginalExtension();

            $imageDestinationPath = public_path('images/products/');
            $image->move($imageDestinationPath, $imageName);

            $product->image = 'products/' . $imageName;
        }
        //todo image resize

        $product->save();

        return redirect(url('admin/products'))->with('message', $message);
    }

    //Remove property from product
    public function deleteProperty (Request $request, $product_id)
    {
        if (!$request->value_id) return back()->withErrors('Server Error... Please try again.');

        $product = Product::find($product_id);

        if (!$product) return back()->withErrors('Server Error... Product not found');

        $product->properties()->detach($request->value_id);

        return $request->value_id;
    }

    public function showEditForm ($id = null)
    {
        $categories = Catalog::all('id', 'name');
        $product = null;
        if ($id) $product = Product::find($id);
        if ($id && !$product) return back()->withErrors('Server Error... Product not found');
        if ($product->properties) {
            foreach ($product->properties as $property) {
                if ($property->properties->type === 'selector') {
                    $property->properties->selectProperties = PropertyValue::where('property_id', $property->properties->id)->pluck( 'value', 'id');
                }
            }
        }
        return view('admin.edit-product', ['product' => $product, 'categories' => $categories]);
    }

    public function update (Request $request)
    {
        $this->validate($request, [
            'name'      => 'required | min:3 | max:150',
            'price'     => 'required | min:1 | max:10',
            'qty'       => 'required | min:0',
            'image'     => 'image | mimes:jpeg,png,jpg,gif,svg | max:2048',
            'category'  => 'required'
        ]);
        if ($request->id) {
            $product = Product::find($request->id);
            $message = 'Товар ' . $request->name . ' був редагован!';
        } else {
            $product = new Product;
            $message = 'Товар ' . $request->name . ' був доданий!';
        }

        //update properties
        if (isset($request->propertyIds))
        {
            $propertyValueIds = [];
            foreach ($request->propertyIds as $key => $propertyId) {
                //validate if type of property is "number"
                if ($request->propertyTypes[$key] === 'number') {
                    $this->validate($request, [
                        'propertyValues.'.$key => 'numeric'
                    ],
                    [
                        'propertyValues.'.$key.'.numeric' => 'The property '.Property::find($propertyId)->name.' must be a number',
                    ]);
                }

                $propertyValues = PropertyValue::firstOrCreate(
                    ['value' => $request->propertyValues[$key], 'property_id' => $propertyId]
                );
                $propertyValueIds[] = $propertyValues->id;
            }

            $product->properties()->sync($propertyValueIds);
        }

        $product->name          = $request->name;
        $product->price         = $request->price;
        $product->description   = $request->description;
        $product->catalog_id    = $request->category;
        $product->qty           = $request->qty;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = 'prod_' . time() . '.' . $image->getClientOriginalExtension();
            $imageDestinationPath = public_path('images/products/');
            $image->move($imageDestinationPath, $imageName);
            $product->image = 'products/' . $imageName;
        }
        //todo image resize

        $product->save();

        return redirect(url('admin/products'))->with('message', $message);
    }

    public function getProperties (Request $request, $product_id)
    {
        $product = Product::find($product_id);

        if (!$product) return back()->withErrors('Server Error... Product not found');

        if ($request->ajax()) {
            return view('admin.product-properties', compact('product'))->render();
        }
    }


    /**
     * Get Product By Manufacturer
     *
     * @param Request $request
     * @param Product $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function getProductByManufacturer(Request $request, Product $product)
    {
        $property_id = $request->get('property_id');
        if (empty($property_id))
            return response()->json(['error' => '-1']);

        session()->put('property_id', $property_id);

        $products = $product::join('product_property', function ($join) {
            $property_id = session()->get('property_id');
            session()->flash('property_id');

            $join->on('product_id', '=', 'products.id')->where('property_value_id', $property_id);
        })->get(['products.id', 'products.name']);

        return response()->json(['content' => $products->toArray()]);
    }

    /**
     * Check Product
     *
     * @param Request $request
     * @param Product $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function checkProduct(Request $request, Product $product)
    {
        $product_id = $request->get('product_id');
        if(empty($product_id))
            return response()->json(['error' => '-1'], 403);

        $product = $product::find($product_id);
        if (empty($product))
            return response()->json(['error' => '-1'], 403);

        return response()->json(['content' => $product->toArray()]);
    }

}
