

@extends('app')

@section('content')
<div class="container">
    <div class="row">
        <a href="{{route('shop')}}" class="btn btn-primary">Назад до товарів</a>
        <a href="{{route('orders')}}" class="btn btn-primary">До замовлення</a>
    </div>
</div>
@stop