@extends('app')

@section('left-column')
    <h4 class="header">Фільтри:</h4>
    @foreach($properties as $property)
        <product-filter :property="{{$property}}"></product-filter>
    @endforeach
@stop