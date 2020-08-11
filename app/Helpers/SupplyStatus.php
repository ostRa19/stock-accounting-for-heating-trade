<?php


namespace App\Helpers;

/**
 * Class OrderStatus
 * @package App\Helpers
 */
class SupplyStatus
{

    /**
     * Order Status
     *
     * @param $status
     * @return string
     */
    public static function supplyStatus($status) {
        switch ($status) {
            case 0:
                $status = 'очікується';
                break;

            case 1:
                $status = 'виконано';
                break;

            case 2:
                $status = 'скасовано';
                break;
        }

        return $status;
    }

}