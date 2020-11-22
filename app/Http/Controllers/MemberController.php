<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

use App\Model\HsTourMember;

use Ramsey\Uuid\Uuid as Generator;

class MemberController extends Controller
{
    //Regist Function
    public function doMemberRegister(Request $request) {
        $this->validate($request, [
            'email' => 'required|email|max:40|unique:hs_tour_members,vch_email',
            'password' => 'required|confirmed|min:8',
            'full_name' => 'required|string|max:40',
            'phone' => 'required|string|max:15'
        ]);

        try {
            $member = new HsTourMember;

            $member->vch_email = $request->email;
            $member->vch_password = Hash::make($request->password);
            $member->vch_full_name = $request->full_name;
            $member->vch_phone = $request->phone;
            $member->status = 1;

            $member->save();

            return response()->json(['error' => 0, 'message' => 'Register Successfully']);
        } catch (Exception $e) {
            return response()->json(['error' => 1, 'message' => $e]);
        }
    }

    public function doMemberLogin(Request $request) {
        $this->validate($request, [
            'email' => 'required|email|',
            'password' => 'required'
        ]);

        if (!$authorized = Auth::attempt(['vch_email' => $request->email, 'vch_password' => Hash::make($request->password)])) {
            return response()->json(['error' => 1, 'message' => 'Invalid Credentials']);
        }

        dd($this->respondWithToken($authorized));
    }

    //Generate JWT
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
