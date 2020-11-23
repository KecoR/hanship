<?php

namespace App\Models;

use App\Traits\Uuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Laravel\Lumen\Auth\Authorizable;



class HsTourMember extends Model implements JWTSubject, AuthorizableContract, AuthenticatableContract
{
    use Uuid, SoftDeletes, Authenticatable, Authorizable;

    protected $table = "hs_tour_members";

    protected $primaryKey = 'vch_member_id';

    protected $fillable = [
        'vch_member_id',
        'vch_full_name',
        'vch_email',
        'vch_password',
        'vch_phone',
        'status'
    ];

    protected $hidden = ['vch_password'];

    public $uuidAttribute = 'vch_member_id';
    public $incrementing = false;

    protected $dates = ['deleted_at'];
    
    public function getJWTIdentifier() {
        return $this->getKey();
    }

    public function getJWTCustomClaims() {
        return [];
    }
}
