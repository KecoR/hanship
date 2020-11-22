<?php

namespace App\Traits;

use Ramsey\Uuid\Exception\UnsatisfiedDependencyException;
use Ramsey\Uuid\Uuid as Generator;

trait Uuid
{
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            try {

                $runCheckId = true;

                while ($runCheckId) {

                    $uuid = Generator::uuid4()->toString();
                    
                    $checkId = $model::find($uuid);

                    if (empty($checkId)) {
                        $runCheckId = false;
                    }

                }

                $model->{$model->uuidAttribute} = $uuid;

            } catch (UnsatisfiedDependencyException $e) {

                abort(500, $e->getMessage());
                
            }
        });
    }
}