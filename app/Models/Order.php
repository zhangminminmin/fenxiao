<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    //
    public $table = 'order';
    public $timestamps = true;
    public $dateFormat = 'U';
    public $fillable = [
        'realname',
        'money',
        'mobile',
        'time',
        'format_time',
        'terrace',
        'city',
        'user_id',
    ];
}
