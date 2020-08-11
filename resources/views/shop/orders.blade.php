@extends('app')


@section('content')

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-3">Замовлення</h3>
        </div>
    </div>
    <div class="orders-list">
        <div class="row" style="margin-bottom: 5px;">
            <div class="col-md-2">Код</div>
            <div class="col-md-3">Створено</div>
            <div class="col-md-2">Загалом</div>
            <div class="col-md-3">Статус</div>
            <div class="col-md-2"></div>
        </div>
        @if (!empty($orders))
            @foreach ($orders as $order)
                <div class="row" style="margin-bottom: 5px;">
                    <div class="col-md-2">{{$order->order_label}}</div>
                    <div class="col-md-3">{{$order->created_at->format('Y-M-d h:i')}}</div>
                    <div class="col-md-2">{{$order->total}}</div>
                    <div class="col-md-3 order-status">{{$order->status}}</div>
                    <div class="col-md-2"><a href="{{route('order', ['id' => $order->id])}}">детальніше</a></div>
                </div>
            @endforeach
            <div class="users-pagination">
                {{ $orders->links() }}
            </div>
        @endif
    </div>

@stop