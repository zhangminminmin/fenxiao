<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Terrace extends Model
{
    //
    public $table='terrace';
    public $timestamps = true;
    public $dateFormat = 'U';

    public function getImageAttribute($image)
    {
        $re = '';
        if ($image) {
            $re = env('APP_URL') . '/storage/' . $image;
        }
        return $re;
    }

    public function getCreatedAtAttribute($date){
        return date('Y-m-d H:i:s', $date);
    }
}
