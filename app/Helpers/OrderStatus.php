<?php


namespace App\Helpers;

/**
 * Class OrderStatus
 * @package App\Helpers
 */
class OrderStatus
{

    /**
     * Order Status
     *
     * @param $status
     * @return string
     */
    public static function orderStatus($status) {
        switch ($status) {
            case 'completed':
                $status = 'завершено';
                break;

            case 'pending payment':
                $status = 'очікування платежу';
                break;

            case 'process':
                $status = 'процес';
                break;

            case 'deleted':
                $status = 'видалено';
                break;
        }

        return $status;
    }

}