@extends('admin.admin')

@section('left-column')
    @include('admin.admin-left-column')
@stop

@section('content')
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-3">
                {{ !empty($supply) ? 'Редагувати' : 'Додати нову' }} поставку
            </h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <form method="POST" class="form-horizontal"
                  action="{{ !empty($supply) ? route('admin.supply.update', ['supply' => $supply->id]) : route('admin.supply.store') }}">

                @csrf()

                @if(!empty($supply))
                    @method('PUT')
                @endif

                @if(!empty($supply))
                    <div class="form-group">
                        <label for="id" class="col-sm-2 control-label">Код поставки:</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control" id="id" placeholder="Код поставки"
                                   value="{{ $supply->id }}">
                        </div>
                    </div>
                @endif

                <div class="form-group required">
                    <label for="product_supply" class="col-sm-2 control-label">Виробник:</label>

                    <div class="col-sm-10">
                        <select id="product_manufacturer" name="manufacturer" class="w-100 bootstrap-select custom-select-lg bg-white">
                            <option value="">Виробник</option>
                            @foreach($manufacturers as $item)
                                <option value="{{ $item->id }}">{{ $item->value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="form-group required">
                    <label for="date" class="col-sm-2 control-label">Дата поставки:</label>
                    <div class="col-sm-10">
                        <input type="text" name="date" class="form-control datepicker" id="date" placeholder="Дата поставки" required>
                    </div>
                </div>

                <div class="form-group required">
                    <label for="product_supply" class="col-sm-2 control-label">Товари:</label>
                    <div class="col-sm-10">

                        <div class="row py-3">
                            <div class="col-4">Товар</div>
                            <div class="col-3 text-center">Цiна</div>
                            <div class="col-3 text-center">Кiлькiсть</div>
                            <div class="col-2 text-center">Дiя</div>
                        </div>

                        <div class="row product-form">
                            <div class="col-4">
                                <select id="product_supply" class="bootstrap-select custom-select-lg bg-white">
                                    <option value="">Додати товар</option>
                                </select>
                            </div>
                            <div class="col-3 text-center">-</div>
                            <div class="col-3 text-center">-</div>
                            <div class="col-2 text-center">-</div>
                        </div>

                        <div class="row mb-3 disc-row product-row d-none">
                            <div class="col-4">
                                <span data-type="name"></span>
                            </div>
                            <div class="col-3 text-center">
                                <span data-type="price"></span>
                            </div>
                            <div class="col-3 text-center">
                                <input class="form-control text-center" type="number" data-type="count" name="" min="1" value="1">
                            </div>
                            <div class="col-2 text-center">
                                <span class="btn btn-link btn-delete-product-row">Видалити</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10 mt-3">
                        <button class="btn btn-default" type="submit">
                            {{ !empty($supply) ? 'Редагувати' : 'Додати' }} поставку
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@stop