<div class="row" style="margin-bottom: 5px;">
    <div class="col-md-4">Мітка</div>
    <div class="col-md-2">Характеристика</div>
    <div class="col-md-1">Статус</div>
    <div class="col-md-1"></div>
    <div class="col-md-1"></div>
</div>
@if (!empty($shippingMethods))
    @foreach ($shippingMethods as $shippingMethod)
        <div class="row" style="margin-bottom: 5px;">
            <div class="col-md-4">{{ \App\Helpers\ShippingMethod::shippingMethod($shippingMethod->label) }}</div>
            <div class="col-md-2">{{$shippingMethod->priority}}</div>
            <div class="col-md-1">{{$shippingMethod->enable ? '' : 'Не'}} Активний</div>
            <div class="col-md-1"><a href="#">редагувати</a></div>
            <div class="col-md-1">
                <a class="btn btn-sm btn-default shipping-method-change-status" href="#"
                    data-status="{{$shippingMethod->enable}}" data-method-id="{{$shippingMethod->id}}">
                </a>
            </div>
        </div>
    @endforeach
@endif
