<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\FPModel;
use App\Models\PGModel;
use App\Models\User;


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
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
          
        return view('home.home');
    }

    public function updateUser(Request $req){
      //  dd($req->all());

        $user = User::find(Auth::id());
        $user->mobile = $req['mobile'];
        $user->email = $req['email'];
        $user->save();
        return redirect()->route('home')->with('message','User Updated successfully');
    }
}
