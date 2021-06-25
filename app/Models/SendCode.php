<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SendCode extends Model
{
    //
    public $table = 'send_code';
    public $timestamps = false;
    public $fillable = [
        'mobile','code','type','exp_time','created_at'
    ];
}
