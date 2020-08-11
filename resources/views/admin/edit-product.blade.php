@extends('admin.admin')

@section('left-column')
    @include('admin.admin-left-column')
@stop

@section('content')
    <!-- Add Property Modal -->
    <div id="propertyModal" class="modal fade" role="dialog">
        {{-- content "admin.property-modal" included  by AJAX --}}
    </div>

    <div id="newPropertyModal" class="modal fade" role="dialog">
        @include('admin.new-property-modal')
    </div>

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-3">
                @if ($product) Редагувати товар
                @else Додати новий товар
                @endif
            </h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <form method="POST" action="{{ url('/admin/products/') }}" enctype="multipart/form-data" class="form-horizontal">
                {{ csrf_field() }}
                @if ($product)
                    <input type="hidden" name="id" value="{{$product->id}}">
                @endif
                <div class="form-group required">
                    <label for="inputName" class="col-sm-2 control-label">Назва:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="inputName" placeholder="Назва"
                               @if ($product) value="{{$product->name}}" @endif
                               required minlength="3" maxlength="150">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputDescription" class="col-sm-2 control-label">Description:</label>
                    <div class="col-sm-10">
                        <input type="text" name="description" class="form-control" id="inputDescription"
                               @if ($product) value="{{$product->description}}" @endif
                               placeholder="Опис">
                    </div>
                </div>
                <div class="form-group required">
                    <label for="category" class="col-sm-2 control-label">Категорія:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="category" name="category" required>
                            <option @if (!$product) selected @endif value="">Обрати категорію</option>
                            @foreach( $categories as $category )
                                <option value="{{$category->id}}"
                                    @if ( $product && ($category->id == $product->catalog_id) ) selected @endif>
                                    {{$category->name}}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <label for="inputPrice" class="col-sm-1 control-label">Ціна:</label>
                    <div class="col-sm-2">
                        <input required type="text" name="price" class="form-control" id="inputPrice"
                               @if ($product) value="{{$product->price}}" @endif
                               placeholder="Ціна" minlength="1" maxlength="10">
                    </div>
                    <label for="inputQty" class="col-sm-2 control-label">Одиниць:</label>
                    <div class="col-sm-2">
                        <input required type="text" name="qty" class="form-control" id="inputQty"
                               @if ($product) value="{{$product->qty}}" @endif
                               placeholder="Одиниць" minlength="1" maxlength="10">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputFile" class="col-sm-2 control-label">Обрати Зображення</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <label class="input-group-btn">
                                <span class="btn btn-primary">
                                    Завантажити&hellip; <input type="file" accept="image/*" data-preview="#preview" name="image" id="inputFile" style="display: none;">
                                </span>
                            </label>
                            <input type="text" class="form-control" readonly>
                        </div>
                        <span class="help-block">
                            Зображення повинно бути jpeg/jpg/gif/png/svg менше ніж 2Mb
                        </span>
                        <img id="blah" src="@if ($product) {{ url('images/'.$product->image) }} @else # @endif" alt="image" class="img-thumbnail" alt="Product image" width="200">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-default" type="submit">
                            @if ($product) Оновити
                            @else Додати товар
                            @endif
                        </button>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6">
                        <h4>Характеристики:</h4>
                        <button class="btn btn-primary" type="button" data-product-id="{{$product->id}}" data-toggle="modal" id="propertyModalAdd" data-target="#propertyModal">
                            Додати характеристику
                        </button>
                    </div>
                </div>
                <div id="propertiesContent">
                    @include('admin.product-properties')
                </div>
            </form>
        </div>
    </div>
@stop