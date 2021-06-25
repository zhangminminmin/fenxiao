<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    //
    protected $table='user';
    public $timestamps = true;
    public $dateFormat = 'U';
    public $fillable = [
        'mobile',
        'password',
        'city_id',
        'city',
        'terrace_ids',
        'terrace_names',
        'realname',
        'front_card',
        'back_card',
        'hand_card',
        'parent_id',
        'parent_two_id',
        'created_at',
        'avatar',
    ];

    public function getCreatedAtAttribute($date)
    {
        return date('Y-m-d H:i:s', $date);
    }
}
