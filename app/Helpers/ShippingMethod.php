<?php


namespace App\Helpers;

/**
 * Class ShippingMethod
 * @package App\Helpers
 */
class ShippingMethod
{

    /**
     * Shipping Method
     *
     * @param $method
     * @return mixed
     */
    public static function shippingMethod($method)
    {
        switch ($method) {
            case 'Fix Rate Shipping':
                $method = 'Доставка по фіксованій ставці';
                break;

            case 'Free Shipping':
                $method = 'Безкоштовна доставка';
                break;
        }

        return $method;
    }

}