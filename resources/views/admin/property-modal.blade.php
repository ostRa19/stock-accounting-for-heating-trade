<div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
        <input type="text" hidden id="modal-product-id">
        <div class="modal-header">
            <h4 class="modal-title pt-2">Додати характеристику до товару</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" id="property-modal-body">
            <div class="row">
                <div class="col-sm-6">
                    <select class="selectpicker" data-live-search="true" id="propertyType" data-input-type="">
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
            <button type="button" class="btn btn-primary" id="add-property-modal-button">
                Додати характеристику
            </button>
        </div>
    </div>
</div>