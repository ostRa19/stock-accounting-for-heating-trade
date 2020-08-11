<?php

namespace App\Http\Controllers;

use App\User;
use App\Order;
use App\OrderData;
use Illuminate\Http\Request;

/**
 * Class AdminOrdersController
 * @package App\Http\Controllers
 */
class AdminOrdersController extends Controller
{
    private $user;
    private $order;
    private $orderData;

    /**
     * Statuses
     * @var array[]
     */
    public $statuses = [
        'completed',
        'pending payment',
        'process',
        'deleted'
    ];

    /**
     * AdminOrdersController constructor.
     *
     * @param User $user
     * @param Order $order
     * @param OrderData $orderData
     */
    public function __construct (User $user, Order $order, OrderData $orderData)
    {
        $this->middleware('auth:admin');
        $this->user = $user;
        $this->order = $order;
        $this->orderData = $orderData;
    }

    public function list (Request $request)
    {
        $user_id = $request->get('user');

        $query = $this->order->orderBy('created_at', 'desc');
        if (!empty($user_id))
            $query = $query->where('user_id', $user_id);

        $orders = $query->paginate(15);
        $users  = $this->user->all(['id', 'name']);

        $this->_assign('user_param', $user_id);
        $this->_assign('statuses',   $this->statuses);
        $this->_assign('orders',     $orders);
        $this->_assign('users',      $users);

        return view('admin.orders');
    }

    public function delete (Request $request) { /* */ }

    public function search(Request $request)
    {
        $keyword = $request->get('keyword');

        if (empty($keyword)) return back();

        $selectedOrder = $this->order->getOrderByLabel($keyword)->paginate(15);

        $this->_assign('statuses',  $this->statuses);
        $this->_assign('orders',    $selectedOrder);

        return view('admin.orders');
    }


    public function showEditForm (int $id) { /* */ }

    public function update (Request $request) { /* */ }

    public function status(Request $request, Order $order)
    {
        $status = $request->get('status');
        if (!empty($status) && in_array($status, $this->statuses))
        {
            $order->status = $status;
            $order->save();
        }

        return redirect()->back();
    }

}
