@extends('admin.admin')

@section('left-column')
    @include('admin.admin-left-column')
@stop

@section('content')
    <!-- Add Property Modal -->
    <div id="propertyModalAdd" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <input type="text" hidden id="modal-product-id">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Додати характеристики товара</h4>
                </div>
                <div class="modal-body" id="property-modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <select class="selectpicker" data-live-search="true" id="propertyType" data-input-type="">
                                <option value="-1">Обрати характеристику</option>
                                @foreach ($properties as $propertyType)
                                    <option value="{{$propertyType->id}}">{{$propertyType->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6" id="propertyValues">
                            {{-- select inclided by AJAX --}}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" id="new-property-modal-button">
                        Нова характеристика
                    </button>
                    <button type="button" class="btn btn-primary" id="add-property-modal-button-add">
                        Додати характеристику
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div id="newPropertyModal" class="modal fade" role="dialog">
        {{-- @include('admin.new-property-modal') --}}
    </div>

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-3">
                {{-- @if ($product) Edit Product --}}
                {{-- @else  --}}
                Додати новий товар
                {{-- @endif --}}
            </h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <form method="POST" action="{{ route('add-product-post') }}" enctype="multipart/form-data" class="form-horizontal">
                {{ csrf_field() }}
                {{-- @if ($product)
                    <input type="hidden" name="id" value="{{$product->id}}">
                @endif --}}
                <div class="form-group required">
                    <label for="inputName" class="col-sm-2 control-label">Назва:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="inputName" placeholder="Назва"
                               required minlength="3" maxlength="150">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputDescription" class="col-sm-2 control-label">Опис:</label>
                    <div class="col-sm-10">
                        <input type="text" name="description" class="form-control" id="inputDescription"
                               placeholder="Опис">
                    </div>
                </div>
                <div class="form-group required">
                    <label for="category" class="col-sm-2 control-label">Категорія:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="category" name="category" required>
                            <option value="">Обрати категорію</option>
                            @foreach( $categories as $category )
                                <option value="{{$category->id}}">
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <label for="inputPrice" class="col-sm-1 control-label">Ціна:</label>
                    <div class="col-sm-2">
                        <input required type="text" name="price" class="form-control" id="inputPrice"
                               placeholder="Ціна" minlength="1" maxlength="10">
                    </div>
                    <label for="inputQty" class="col-sm-2 control-label">Одиниць:</label>
                    <div class="col-sm-2">
                        <input required type="text" name="qty" class="form-control" id="inputQty"
                               placeholder="Одиниць" minlength="1" maxlength="10">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputFile" class="col-sm-2 control-label">Обрати зображення</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <label class="input-group-btn">
                                <span class="btn btn-primary">
                                    Завантаження&hellip; <input type="file" accept="image/*" data-preview="#preview" name="image" id="inputFile" style="display: none;">
                                </span>
                            </label>
                            <input type="text" class="form-control" readonly>
                        </div>
                        <span class="help-block">
                            Зображення повинно бути jpeg/jpg/gif/png/svg менше ніж 2Mb
                        </span>
                        
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-default" type="submit">
                            
                            Додати товар
                            
                        </button>
                    </div>
                </div>
                <div class="form-group" style="display:none;">
                    <div class="col-sm-6">
                        <h4>Характеристика:</h4>
                        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#propertyModalAdd">
                            Додати характеристику
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@stop