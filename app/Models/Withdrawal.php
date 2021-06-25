<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Withdrawal extends Model
{
    //
    public $table = 'withdrawal';
    public $timestamps = true;
    public $dateFormat = 'U';
    public $fillable = [
        'money', 'realname', 'alipaycode', 'status','user_id'
    ];

    public function getCreatedAtAttribute($date)
    {
        return date('Y-m-d H:i:s', $date);
    }
}
