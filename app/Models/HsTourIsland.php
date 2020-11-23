<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class HsTourIsland extends Model
{
    
    use SoftDeletes;

    protected $table = "hs_tour_islands";

    protected $primaryKey = 'vch_island_id';
}
