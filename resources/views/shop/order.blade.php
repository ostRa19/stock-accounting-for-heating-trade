@extends('app-one-column')


@section('content')
    <order-info :order='@json($order)' product-route='{{route('product', false)}}'>
    </order-info>
@stop
