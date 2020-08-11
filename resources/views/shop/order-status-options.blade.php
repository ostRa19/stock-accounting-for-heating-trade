<option>виберіть дію ..</option>
@if ($order->status !== 'pending payment')
    <option value="repeat" data-order-id="{{$order->id}}">повторити замовлення</option>
@else
    <option value="replay payment" data-order-id="{{$order->id}}">replay payment</option>
    <option value="deleted" data-order-id="{{$order->id}}">undo order</option>
@endif