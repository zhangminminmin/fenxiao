<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    //
    public $table='city';
    public $timestamps = true;
    public $dateFormat = 'U';

    public function setTerraceIdsAttribute($value)
    {
        $this->attributes['terrace_ids'] = implode(',', $value);
    }

    public function getCreatedAtAttribute($value) {
        return date('Y-m-d H:i:s', $value);
    }
}
