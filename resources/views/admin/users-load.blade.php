<div class="row" style="margin-bottom: 5px;">
    <div class="col-md-1">Код</div>
    <div class="col-md-2">Ім'я</div>
    <div class="col-md-2">Електронна пошта</div>
</div>
@foreach ($users as $user)
    <div class="row" style="margin-bottom: 5px;">
        <div class="col-md-1">{{$user->id}}</div>
        <div class="col-md-2">{{$user->name}}</div>
        <div class="col-md-2">{{$user->email}}</div>
        <div class="col-md-1"><a href="{{ url('/admin/edit-user/'.$user->id) }}">редагувати</a></div>
        <div class="col-md-2 text-center"><a href="{{ route('admin.orders') }}?user={{ $user->id }}">Замовлення</a></div>
        <div class="col-md-1">
            <form name="clearCart" method="POST" action="{{ route('cart.delete') }}">
                {{ csrf_field() }}
                <input type="hidden" name="id" value="{{ $user->id }}">
                <input type="hidden" name="_method" value="put">
                <button class="btn btn-xs btn-default"  type="submit" data-toggle="confirmation-singleton">
                    Вийти/Очистити кошик
                </button>
            </form>
        </div>
    </div>
@endforeach
<div class="users-pagination">
{{ $users->links() }}
</div>
