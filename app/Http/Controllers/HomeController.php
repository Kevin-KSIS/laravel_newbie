<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\User;
use App\Http\Controllers\Controller;
use Validator;
use Hash;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        return redirect("/home/".auth()->user()->id);
    }

    public function update(Request $request, $id){
        // info of user id == $id
        $user_target = DB::table('users')->where('id', $id)->get()[0];

        // check same old password
        Validator::extend('old_password', function ($attribute, $value, $parameters, $validator) {
                return Hash::check($value, current($parameters));
        });

        // user teacher allow change info of students account
        if (!Auth::guest() and (Auth::user()->role === 2) and ($user_target -> role === 1)){   // admin  
            $validator = Validator::make($request->all(), [
                'phonenumber' => 'required',
                'newpw' => "same:repw",
            ]);
        }else{  // students
            $validator = Validator::make($request->all(), [
                'phonenumber' => 'required',
                'currentpw' => "required|old_password:".$user_target->password,
                'newpw' => "same:repw",
            ]);
        }

        if (!$validator->fails()){
            $phonenumber = $request->input('phonenumber');
            $currentpw = $request->input('currentpw');
            $newpw = $request->input('newpw');
            $repw = $request->input('repw');

            if (empty($newpw)){
                DB::table('users')
                -> where ('id', $id)
                -> update(['phone_number' => $phonenumber]);
            }else{
                DB::table('users')
                -> where ('id', $id)
                -> update(['phone_number' => $phonenumber, 
                            'password' => bcrypt($newpw)
                    ]);
            }          
            return "Updated";
        }
        
        return "Wrong password or not same password or everythings";
    }

    public function show($id){
        $own = Auth::user();
        $user_target = DB::table('users')->where('id', $id)->get()[0];

        if(((int)$id === $own->id) or ($own->role === 2 and $user_target->role === 1)){
            $user = User::find($id);
            return view('home', compact('user', 'own'));   
        }

        $user = User::find($id);
        return view('home2', compact('user', 'own'));   
    }

    public function test(){
        $a = $user_target = DB::table('users')->where('id', 2)->get()[0];
        var_dump($a);
    }
}
