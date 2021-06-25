<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;
class Notice extends Model
{
    //
    public $table='notice';
    public $timestamps = true;
    public $dateFormat = 'U';


    public function getCreatedAtAttribute($date){
        return date('Y-m-d H:i:s', $date);
    }
}
