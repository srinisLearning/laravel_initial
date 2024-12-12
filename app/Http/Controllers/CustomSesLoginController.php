<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Models\User;
use Hash;

class CustomSesLoginController extends Controller
{
    public function showLogin()
    {
        return view('auth.login');
    }

    public function showRegister()
    {
        return view('auth.register');
    }

    public function registerUser(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required | email | unique:users',
            'password' => 'required',
            'mobile' => 'required'
        ]);
        /*
        $user =  User::create([
            'name' => request('name'),
            'email' => request('email'),
            'mobile' => request('mobile'),
            'password' => request('password')
        ]);
        */
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->mobile = $request->mobile;
        $res = $user->save();
        if ($res) {
            return redirect()->route('showLogin')->with('success', 'Registartion successfull.Pls Login');
        } else {
            return back()->with('error', 'Registration failed');
        }
    }

    public function loginUser(Request $request)
    {
        $request->validate([
            'email' => 'required | email  ',
            'password' => 'required:min:5|max:12'
        ]);
        $user = User::where('email', '=', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $request->session()->put('loginId', $user->id);
                return redirect('dashboard');
            } else {
                return back()->with('error', 'Password do not match');
            }
        } else {
            return back()->with('error', 'This email is not registered');
        }
    }

    public function dashboard()
    {

        //dd(session()->get('loginId'));
                                  
        $data = array();
        if (Session::has('loginId')) {

            $data = User::where('id', '=', session()->get('loginId'))->first();
        }

        return view('dashboard',compact('data'));
    }

    public function logout(){
        if(Session::has('loginId')){
            Session::pull('loginId');
            return  redirect('login');
            }
  
}

}
