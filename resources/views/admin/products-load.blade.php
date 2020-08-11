@php $i=0; @endphp
@foreach ($products as $product)
    @php $i++; @endphp
    <div class="row" style="margin-bottom: 5px;">
        <div class="col-md-1">{{$i}}</div>
        <div class="col-md-1">
            <img src="{{ url('images/'.$product->image) }}" class="img-thumbnail" alt="image" width="152" height="118">
        </div>
        <div class="col-md-2">{{$product->name}}</div>
        <div class="col-md-2">{{ \Illuminate\Support\Str::limit($product->description, 50, $end='...') }}</div>
        <div class="col-md-1">{{$product->price}}</div>
        <div class="col-md-2">{{$product->catalogs->name}}</div>
        <div class="col-md-2">
            На складi: {{ $product->qty }} <br>
            У постачанні: {{ $product->qty_delivery }} <br>
            В заказi: {{ $product->qty_order }}
        </div>
        <div class="col-md-1 text-center">
            <a href="{{ url('/admin/edit-product/'.$product->id) }}">редагувати</a>
            <form method="POST" action="{{ route('product.delete') }}">
                <input type="hidden" name="id" value="{{ $product->id }}">
                {{ method_field('DELETE') }}
                {{ csrf_field() }}
                <button class="btn btn-xs btn-default"  type="submit" data-toggle="confirmation-singleton">
                    видалити
                </button>
            </form>
        </div>
    </div>
@endforeach
<div class="products-pagination">
    @if(!empty($keyword))
        {{ $products->appends(['keyword' => $keyword])->links() }}
    @else
        {{ $products->links() }}
    @endif
</div>
