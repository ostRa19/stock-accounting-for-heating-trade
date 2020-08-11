@extends('layouts.print')

@section('content')
    @if(!empty($order))
        <h3 style="text-align: center">
            Замовлення №{{ $order->id }}
        </h3>

        <br><br>

        <table style="width: 100%">
            <thead>
                <tr>
                    <th style="text-align: left">#</th>
                    <th style="text-align: center">Створено</th>
                    <th style="text-align: center">Вартiсть</th>
                    <th style="text-align: center">Статус</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td style="text-align: left">{{ $order->id }}</td>
                    <td style="text-align: center">{{ $order->created_at }}</td>
                    <td style="text-align: center">{{ $order->total }}</td>
                    <td style="text-align: center">{{ \App\Helpers\OrderStatus::orderStatus($order->status) }}</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <br>
                        Доповнення: <span>{{ !empty($order->commentary) ? $order->commentary : '-' }}</span>
                    </td>
                </tr>
            </tbody>
        </table>
    @endif

    @if(!empty($products))
        <br><br>
        <h3>Продукцiя</h3>
        <br>

        <table border="1" cellspacing="0" cellpadding="10" style="width: 100%">
            <thead>
                <tr>
                    <th style="text-align: left">Товар</th>
                    <th style="text-align: center">Цiна</th>
                    <th style="text-align: center">Кiлькiсть</th>
                </tr>
            </thead>

            <tbody>
                @foreach($products as $product)
                    <tr>
                        <td style="text-align: left">{{ $product->name }}</td>
                        <td style="text-align: center">{{ $product->price }}</td>
                        <td style="text-align: center">{{ $product->order_qty }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif

    @if(!empty($order))
        <br><hr>
        <small>Кiлькiсть товарiв: {{ !empty($products) ? count($products) : '-' }}</small><br>
        <small>Вартiсть: {{ $order->total }}</small>
    @endif
@endsection