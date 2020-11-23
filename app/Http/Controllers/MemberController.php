<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

use App\Models\HsTourMember;

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
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $inputUser = [];
        $inputUser['vch_email'] = $request->email;
        $inputUser['vch_password'] = $request->password;

        $memberData = HsTourMember::where('vch_email', $inputUser['vch_email'])->first();

        if (!$authorized = Auth::attempt($inputUser)) {
            return response()->json(['error' => 1, 'message' => 'Invalid Credentials']);
        }
        
        return response()->json(
            [
                'error' => 0,
                'message' => 'Login Successfully',
                'memberdata' => $memberData,
                'token' => $this->respondWithToken($authorized)
            ]
        );
    }
}
