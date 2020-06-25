<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class County extends Model
{
    protected $table = 'Counties';

    public function settlements()
    {
        return $this->hasMany('App\Settlement', 'county');
    }
}
