<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    //
    public $table = 'banner';
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
}
