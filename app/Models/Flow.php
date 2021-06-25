<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flow extends Model
{
    //
    public $table = 'flow';
    public $timestamps = false;
    public $fillable = [
        'user_id',
        'money',
        'afford_user_id',
        'type',
        'level',
        'created_at',
        'terrace_name',
    ];
}
