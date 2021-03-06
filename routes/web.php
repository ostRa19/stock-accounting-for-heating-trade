<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', 'ShopController@list');

Route::prefix('cart')->group( function() {
    Route::post('/', 'CartController@post')->name('post.cart');
    Route::post('/add-to-cart', 'CartController@addToCart');
    Route::get('/', 'CartController@index');
});

Route::prefix('checkout')->group( function() {
    Route::post('/', 'CheckoutController@sendPayment')->name('post.checkout');
    Route::post('/success', 'CheckoutController@success')->name('checkout.success');
    Route::get('/success', function () {
        return view('shop.order-success');
    });
});

Route::get('/orders', 'OrderController@list')->name('orders');
Route::get('/order/{id}', 'OrderController@getOrder')->name('order');
Route::put('/order/status', 'OrderController@changeOrderStatus')->name('change.order.status');
Route::get('/order/{order}/print', 'OrderController@printOrder')->name('print-order');

Route::prefix('shop')->group( function() {
    Route::get('/', 'ShopController@list')->name('shop');
    Route::get('/category/{id}', 'ShopController@get_child_catalogs');
    Route::get('/{id}', 'ShopController@get_product')->name('product');
});

Route::post('search', 'SearchController@search')->name('search');

Route::post('filter', 'PropertyController@filter');

Auth::routes();

Route::prefix('admin')->group( function() {
    Route::get('/', 'AdminController@index')->name('admin.dashboard');
    Route::get('/login', 'Auth\AdminLoginController@showLoginForm')->name('admin.login');
    Route::post('/login', 'Auth\AdminLoginController@login')->name('admin.login.submit');
    Route::get('/logout', 'Auth\AdminLoginController@adminLogout')->name('admin.logout');

    //Admin password reset
    Route::post('/password/email', 'Auth\AdminForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
    Route::get('/password/reset', 'Auth\AdminForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
    Route::post('/password/reset', 'Auth\AdminResetPasswordController@reset');
    Route::get('/password/reset/{token}', 'Auth\AdminResetPasswordController@showResetForm')->name('admin.password.reset');

    //Admin categories management
    Route::get('/categories', 'AdminCategoriesController@list')->name('admin.categories');
    Route::delete('/categories/{id}', 'AdminCategoriesController@delete');
    Route::get('/add-category', 'AdminCategoriesController@showEditForm')->name('add-category');
    Route::get('/edit-category/{id}', 'AdminCategoriesController@showEditForm');
    Route::post('/categories', 'AdminCategoriesController@update');

    //Admin products management
    Route::get('/products', 'AdminProductsController@list')->name('admin.products');
    Route::delete('/products', 'AdminProductsController@delete')->name('product.delete');
    Route::get('/add-product', 'AdminProductsController@addProduct')->name('add-product');
    Route::post('/add-product', 'AdminProductsController@addProductPost')->name('add-product-post');
    Route::get('/edit-product/{id}', 'AdminProductsController@showEditForm');
    Route::post('/products', 'AdminProductsController@update')->name('update-product-post');
    Route::get('/products/category/{id}', 'AdminProductsController@categoryFilter');
    Route::post('/products/get-product-by-manufacturer', 'AdminProductsController@getProductByManufacturer');
    Route::post('/products/check-product', 'AdminProductsController@checkProduct');
    Route::get('/products/search', 'AdminProductsController@search')->name('products.search');

    //Admin add and remove products properties
    Route::delete('/product/{product_id}/property', 'AdminProductsController@deleteProperty');
    Route::get('/product/{product_id}/properties', 'AdminProductsController@getProperties');

    Route::get('/products/property-types', 'AdminPropertiesController@getProperties');
    Route::get('/products/property/{id}/values', 'AdminPropertiesController@getPropertyValues');
    Route::post('/product/property-type', 'AdminPropertiesController@addPropertyToProduct');
    Route::post('/properties', 'AdminPropertiesController@createProperty');

    Route::get('/users', 'AdminUsersController@list')->name('admin.users');
    Route::get('/edit-user/{id}', 'AdminUsersController@showEditForm');
    Route::put('/user', 'AdminUsersController@update')->name('user.update');
    Route::post('/users', 'AdminUsersController@search')->name('users.search');
    Route::put('/users/', 'AdminUsersController@deleteCart')->name('cart.delete');

    Route::get('/orders', 'AdminOrdersController@list')->name('admin.orders');
    Route::get('/show-order/{id}', 'AdminOrdersController@showEditForm');
    Route::put('/order', 'AdminOrdersController@update')->name('order.update');
    Route::post('/orders', 'AdminOrdersController@search')->name('order.search');
    Route::put('/order/{order}/status', 'AdminOrdersController@status')->name('admin.order.status');

    Route::get('/shipping-methods', 'AdminShippingMethodsController@list')->name('admin.shipping-methods');
    Route::put('/shipping-method', 'AdminShippingMethodsController@changeStatus');

    // Admin supply
    Route::resource('supply', 'AdminSupplyController', [
        'names' => [
            'index'     => 'admin.supply.list',
            'create'    => 'admin.supply.create',
            'store'     => 'admin.supply.store',
            'show'      => 'admin.supply.item',
            'edit'      => 'admin.supply.edit',
            'update'    => 'admin.supply.update',
            'destroy'   => 'admin.supply.delete',
        ]
    ]);
    Route::get('supply/{supply}/print', 'AdminSupplyController@print')->name('admin.supply.print');
});

Route::get('/test', 'TestController@test');
