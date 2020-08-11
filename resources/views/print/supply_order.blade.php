@extends('layouts.print')

@section('content')
    @if(!empty($supply))
        <h3 style="text-align: center">
            Поставка №{{ $supply->id }}
        </h3>

        <br><br>

        <table style="width: 100%">
            <thead>
                <tr>
                    <th style="text-align: left">#</th>
                    <th style="text-align: center">Створено</th>
                    <th style="text-align: center">Загалом</th>
                    <th style="text-align: center">Статус</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td style="text-align: left">{{ $supply->id }}</td>
                    <td style="text-align: center">{{ $supply->created_at }}</td>
                    <td style="text-align: center">{{ $supply->general_price }}</td>
                    <td style="text-align: center">{{ \App\Helpers\SupplyStatus::supplyStatus($supply->status_id) }}</td>
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
                @php $count = 0; @endphp
                @foreach($products as $product)
                    <tr>
                        <td style="text-align: left">{{ $product->name }}</td>
                        <td style="text-align: center">{{ $product->price }}</td>
                        <td style="text-align: center">{{ $product->count }}</td>
                    </tr>
                    @php $count += $product->count; @endphp
                @endforeach
                <tr>
                    <td style="text-align: left"><small><b>Загалом:</b></small></td>
                    <td style="text-align: center"><small><b>{{ $supply->general_price }}</b></small></td>
                    <td style="text-align: center"><small><b>{{ $count }}</b></small></td>
                </tr>
            </tbody>
        </table>
    @endif

    @if(!empty($supply))
        <br><hr>
        <small>Кiлькiсть товарiв: {{ !empty($count) ? $count : '-' }}</small><br>
        <small>Вартiсть: {{ $supply->general_price }}</small>
    @endif
@endsection