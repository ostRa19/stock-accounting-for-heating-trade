<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\View;

class Controller extends BaseController
{
    use AuthorizesRequests,
        DispatchesJobs,
        ValidatesRequests;

    /**
     * @var int $list_item_count
     */
    protected $list_item_count = 15;

    /**
     * A simple form of assigning a view variable
     *
     * @param $key
     * @param $value
     * @return mixed
     */
    private static function setViewAssign($key, $value)
    {
        return View::share($key, $value);
    }

    /**
     * Assigning a variable to the template body
     *
     * @param $key
     * @param $value
     * @return mixed
     */
    protected function _assign($key, $value)
    {
        return self::setViewAssign($key, $value);
    }
}
