<?php

namespace App\Http\Controllers;

use App\Helpers\OrderStatus;
use Barryvdh\DomPDF\PDF;
use Illuminate\Http\Request;

use App\Order;
use App\OrderData;
use Carbon\Carbon;
use App\Library\Services\CartService;
use Illuminate\Support\Facades\Auth;
use App\Product;
use App\RelatedProduct;
use Illuminate\Support\Facades\View;

class OrderController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    private $order;
    private $cartService;
    private $orderData;

    public function __construct(Order $order, CartService $cartService, OrderData $orderData)
    {
        $this->order = $order;
        $this->orderData = $orderData;
        $this->cartService = $cartService;
        $this->middleware('auth')->except(['logout', 'printOrder']);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function list()
    {
        $userId = Auth::user()->id;
        $orders = $this->order->getOrdersByUserId($userId)->orderBy('created_at', 'desc')->paginate(15);

        if (!empty($orders))
            foreach ($orders as $key => $order)
                if (isset($order->status))
                    $order->status = OrderStatus::orderStatus($order->status);

        return view('shop.orders', ['orders' => $orders]);
    }

    public function changeOrderStatus(Request $request)
    {
        $orderStatus = $request->get('status');
        $orderId = $request->get('id');

        //For repeat order add products to cart and user will be redirected to cart
        if ($orderStatus === 'repeat') {
            $this->makeCartByOrderId($orderId);
            return 'redirect_to_cart';
        }

        $userId = Auth::user()->id;
        $order = $this->order->where([['id', '=', $orderId],['user_id', '=', $userId]])->first();
        $order->status = $orderStatus;
        $order->save();

        $html = view('shop.order-status-options', compact('order'))->render();

        return response()->json(compact('html'));
    }

    public function getOrder(int $id)
    {
        $userId = Auth::user()->id;
        $selectedOrder = $this->order->where([['id', '=', $id],['user_id', '=', $userId]])->with('orderData.product')->first();
        if (empty($selectedOrder)) return  back()->with('error', 'Замовлення не знайдено');

        if (!empty($selectedOrder) && isset($selectedOrder->status))
            $selectedOrder->status = OrderStatus::orderStatus($selectedOrder->status);

        return view('shop.order',['order' => $selectedOrder]);
    }

    public function printOrder(Order $order, OrderData $orderData, PDF $pdf)
    {
        $products = $orderData->select(['products.*', 'order_data.qty as order_qty'])
                              ->where(['order_id' => $order->id])
                              ->join('products', 'products.id', 'product_id')
                              ->get();

        return $pdf->loadView('print.client_order', [
            'order'     => $order,
            'products'  => $products
        ])->stream();
    }

    private function makeCartByOrderId(int $orderId)
    {
        $orderDetails = $this->orderData->where('order_id', $orderId)->get();
        if (empty($orderDetails)) {
            //Todo return error
            return 'error';
        }
        foreach ($orderDetails as $orderRow) {
            $this->cartService->addToCart($orderRow->product_id, $orderRow->qty);
        }
        return;
    }
}
