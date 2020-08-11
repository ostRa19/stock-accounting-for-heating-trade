@extends('admin.admin')

@section('left-column')
    @include('admin.admin-left-column')
@stop

@section('content')
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-3">Товари</h3>
            <a class="btn bg-primary" href="{{route('add-product')}}">Додати новий товар</a>
        </div>
    </div>
    <div class="row" style="margin-bottom: 20px;">
        <div class="col-sm-4 col-lg-offset-1">
            <div class="input-group">
                <form action="{{ route('products.search') }}" method="GET">
                    <input type="text" name="keyword" class="form-control w-auto" placeholder="Пошук" value="{{ !empty($keyword) ? $keyword : '' }}" id="nav-search">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" id="nav-search-btn">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-4">
            <select class="form-control" id="product-category" name="category">
                <option selected value="">Обрати категорію</option>
                @foreach( $categories as $category )
                    <option value="{{$category->id}}">
                        {{$category->name}}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
    <div class="product-list">
        @include('admin.products-load')
    </div>
@stop