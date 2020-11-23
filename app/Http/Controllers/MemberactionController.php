<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\HsTourIsland;

class MemberactionController extends Controller
{
    public function getIslands() {
        try {
            $islands = HsTourIsland::all();

            if (empty($islands)) {
                return response()->json(
                    [
                        'error' => 1,
                        'message' => 'No Data Found'
                    ]
                );
            }

            return response()->json(
                [
                    'error' => 0,
                    'message' => 'Successfully Retrieve Data',
                    'data' => $islands
                ]
            );
        } catch (Exception $e) {
            return response()->json(
                [
                    'error' => 1,
                    'message' => $e->message
                ]
            );
        }
    }
}
