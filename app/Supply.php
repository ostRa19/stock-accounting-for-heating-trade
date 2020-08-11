<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supply extends Model
{

    /**
     * @var string $table
     */
    protected $table = 'supply';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'date',
        'property_id',
        'user_id',
        'general_price',
        'status_id'
    ];
}
