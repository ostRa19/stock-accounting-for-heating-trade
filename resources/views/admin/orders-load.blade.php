<div class="row" style="margin-bottom: 5px;">
    <div class="col-md-2">Код</div>
    <div class="col-md-2">Створено</div>
    <div class="col-md-2">Користувач/Електрона пошта</div>
    <div class="col-md-1">Загалом</div>
    <div class="col-md-1">Статус</div>
    <div class="col-md-1"></div>
    <div class="col-md-3"></div>
</div>
@if (!empty($orders))
    @foreach ($orders as $order)
        <div class="row" style="margin-bottom: 5px;">
            <div class="col-md-2">{{$order->order_label}}</div>
            <div class="col-md-2">{{$order->created_at->format('Y-M-d h:i')}}</div>
            <div class="col-md-2">{{$order->user->name}}<br>{{$order->user->email}}</div>
            <div class="col-md-1">{{$order->total}}</div>
            <div class="col-md-1">{{ \App\Helpers\OrderStatus::orderStatus($order->status) }}</div>
            <div class="col-md-1 text-center">
                <a href="{{ route('print-order', ['order' => $order->id]) }}">друк</a>
            </div>
            <div class="col-md-3">
                @if(!empty($statuses))
                    <form action="{{ route('admin.order.status', ['order' => $order->id ]) }}" method="POST">
                        @csrf
                        @method('PUT')

                        <select class="form-control" name="status" id="order-status-actions" onchange="if(this.value != 0) this.form.submit();" data-order-id="{{$order->id}}">
                            <option value="0">Змiнити статус</option>
                            @foreach($statuses as $status)
                                @if($status!= $order->status)
                                    <option value="{{ $status }}">{{ \App\Helpers\OrderStatus::orderStatus($status) }}</option>
                                @endif
                            @endforeach
                        </select>
                    </form>
                @endif
            </div>
        </div>
    @endforeach
    <div class="users-pagination">
        @if(!empty($user_param))
            {{ $orders->appends(['user' => $user_param])->links() }}
        @else
            {{ $orders->links() }}
        @endif
    </div>
@endif
