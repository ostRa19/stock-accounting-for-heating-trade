@extends('admin.admin')

@section('left-column')
    @include('admin.admin-left-column')
@stop

@section('content')

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-3">Поставки</h3>
            <a class="btn bg-primary" href="{{route('admin.supply.create')}}">Додати нову поставку</a>
        </div>
    </div>

    <div class="row" style="margin-bottom: 5px; min-height: 50px">
        <div class="col-md-1"># Код</div>
        <div class="col-md-2">Дата</div>
        <div class="col-md-2">Постачальник</div>
        <div class="col-md-2">Загалом</div>
        <div class="col-md-2">Статус</div>
        <div class="col-md-1">Друк</div>
        <div class="col-md-2"></div>
    </div>

    @php $i=0; @endphp
    @forelse($supply_list as $supply)
        <div class="row" style="margin-bottom: 5px; min-height: 50px">
            <div class="col-md-1"># {{ $supply->id }}</div>
            <div class="col-md-2">{{ $supply->date }}</div>
            <div class="col-md-2">{{ $supply->property_label }}</div>
            <div class="col-md-2">{{ $supply->general_price }}</div>
            <div class="col-md-2">{{ ucfirst(\App\Helpers\SupplyStatus::supplyStatus($supply->status_id)) }}</div>
            <div class="col-md-1">
                <a href="{{ route('admin.supply.print', ['supply' => $supply->id ]) }}">Друк</a>
            </div>
            <div class="col-md-2">
                @if($supply->status_id == 0)
                    <form method="POST" action="{{ route('admin.supply.update', ['supply' => $supply->id ]) }}">
                        @csrf()
                        @method('PUT')

                        <button type="submit" class="btn btn-link p-0">Виконано</button>
                    </form>
                    <form method="POST" action="{{ route('admin.supply.delete', ['supply' => $supply->id]) }}">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}

                        <button class="btn btn-xs btn-default"  type="submit" data-toggle="confirmation-singleton">
                            Скасувати
                        </button>
                    </form>
                @else
                    -
                @endif
            </div>
        </div>
    @empty
        <div class="row" style="margin-bottom: 5px;">
            <div class="col-12">
                <span>Список поставок порожній</span>
            </div>
        </div>
    @endforelse

@stop