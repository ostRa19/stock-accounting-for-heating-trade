(function($) {
    $('#product_manufacturer').on('change', function (e) {
        var id = e.target.value,
            list = $('#product_supply');

        let ajax_params = {
            url: '/admin/products/get-product-by-manufacturer',
            type: 'POST',
            data: {
                property_id: id,
                _token:      $('input[name=_token]').val()
            },
            dataType: 'json',
            beforeSend: function () {
                list.find('option:not(:first-of-type)').remove();
                $('.prmanufacturer').remove();
            },
            success: function (data) {
                if (data.content) {
                    let content = data.content,
                        option_str;

                    $(content).each(function (k, i) {
                        option_str += '<option value="' + i.id + '">' + i.name + '</option>';
                    })

                    if (option_str)
                        list.append(option_str);
                }
            }
        };

        $.ajax(ajax_params);
    })

    $('#product_supply').on('change', function(e) {
        var id = e.target.value;

        if(id) {
            let ajax_params = {
                url: '/admin/products/check-product',
                type: 'POST',
                data: {
                    product_id: id,
                    _token:     $('input[name=_token]').val()
                },
                dataType: 'json',
                success: function (data) {
                    if(data.content) {
                        let content = data.content,
                            row     = $('.disc-row').clone(),
                            form    = $('.product-form');

                        row.removeClass('disc-row').removeClass('d-none').addClass('prmanufacturer');
                        row.find('[data-type=name]').html(content.name);
                        row.find('[data-type=price]').html(content.price);
                        row.find('[data-type=count]').attr('name', 'products[' + id + ']');

                        row.find('.btn-delete-product-row').on('click', function (e) {
                            $(e.target).parents('.product-row').remove();
                        });

                        row.insertBefore(form);
                        form.find('option:selected').prop('selected', false);
                    }
                }
            };

            $.ajax(ajax_params);
        }
    });
}(jQuery));