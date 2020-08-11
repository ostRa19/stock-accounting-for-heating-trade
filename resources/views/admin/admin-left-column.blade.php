@extends('admin.admin')

@section('left-column')

    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading"> 
          {{-- <img src="/images/logo.jpg" alt="..." class="rounded float-left" style="max-width: 100%;">   --}}
        </div>
      <div class="list-group list-group-flush">


    {{-- <div class="row"> --}}
        <div><a class="list-group-item list-group-item-action bg-light" href="{{ route('admin.categories') }}">Категорії</a></div>
        <div><a class="list-group-item list-group-item-action bg-light" href="{{ route('admin.products') }}">Товари</a></div>
        <div><a class="list-group-item list-group-item-action bg-light" href="{{ route('admin.users') }}">Користувачі</a></div>
        <div><a class="list-group-item list-group-item-action bg-light" href="{{ route('admin.orders') }}">Замовлення</a></div>
        {{-- <div>Payment</div> --}}
        <div><a class="list-group-item list-group-item-action bg-light" href="{{ route('admin.shipping-methods') }}">Метод доставки</a></div>
        <div><a class="list-group-item list-group-item-action bg-light" href="{{ route('admin.supply.list') }}">Поставки</a></div>
        {{-- <div>Settings</div> --}}
    {{-- </div> --}}
 
      </div>
    </div>



@stop