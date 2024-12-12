<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\PGModel;
use App\Models\User;
use App\Models\AppointmentsTable;
class AccomodationProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth')->except('index');
    }

    public function index()
    {
    // dd()$data = PGModel::where('user_id','!=',Auth::id())->get();
    $data = PGModel::latest()->get();
     return view('pg.index',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pg.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->all());
        $facilites_array = ($request->facilites);
        if($facilites_array > 0 ){
            $facilites = implode(" , ",$facilites_array);
            }
            else{
            $facilites = '';
            }
                 //print $facilites;
        //exit();
       
       $userid = Auth::user()->id;
       $user = User::find($userid);
        
       $image = $request->file('ap_img');
       $name = time().'.'.$image->getClientOriginalExtension();
       $destinationPath = public_path('/images');
       $image->move($destinationPath,$name);       
       if($user->isPGServiceProvider === 0)
       
       {
       PGModel::create([
           "user_id"=>$userid,         
           "ap_name"=>$request['ap_name'],
           "area"=>$request['ap_area'],
           "landmark"=>$request['ap_landmark'],
           "city"=>$request['ap_city'],
           "facilites"=>$facilites,
           "adl_info"=>$request['ap_adl_info'],
           "image"=>$name,
           "persons"=>$request['ap_persons'],
           "rent"=>$request['ap_rent'],
           "gender"=>$request['ap_gender'],
           "usertype"=>$request['ap_usertype'],
           "certificate"=>$request['ap_certificate'],
       ]);

    }
       $user->isPGServiceProvider = 1;
       $user->save();
       return redirect()->route('home')->with('message','Paying Guest Accomodation  added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = PGModel::find($id);
        return view('pg.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        
       $pg_provider= PGModel::find($id);
        $facilites_array = ($request->facilites);
        if($facilites_array > 0 ){
        $facilites = implode(" , ",$facilites_array);
        }
        else{
        $facilites = '';
        }
      
      
       if($request->has('ap_img')){
        $image = $request->file('ap_img');
        $name = time().'.'.$image->getClientOriginalExtension();
        $destinationPath = public_path('/images');
        $image->move($destinationPath,$name);
       
      // dd('Image is present');
       }
       else{
           $name = $pg_provider->image;
        // dd('Image is not present');
       }
       
        $pg_provider= PGModel::find($id);
        $pg_provider->ap_name = $request['ap_name'];
        $pg_provider->area = $request['ap_area'];
        $pg_provider->city = $request['ap_city'];
        $pg_provider->landmark = $request['ap_landmark'];
        $pg_provider->image = $name;   
        $pg_provider->facilites =$facilites;
        $pg_provider->persons =$request['ap_persons'];
        $pg_provider->rent =$request['ap_rent'];
        $pg_provider->certificate =$request['ap_certificate'];
        $pg_provider->save();
        return redirect()->route('home')->with('message','Paying Guest Accomodation  updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

      // dd($id,Auth::User()->id);
       $pg = PGModel::findorfail($id);
        $pg->delete();  
        $userid = Auth::user()->id;
        $user = User::find($userid);
        $user->isPGServiceProvider = 0;
        $user->save();
       return redirect()->route('home')->with('message','Paying Guest Accomodation  deleted successfully');

    
}
public function pgSearch(Request $req){
   // dd($req['search']);
    $data = PGModel::where('city','like',$req['search'].'%')->orWhere('area','like',$req['search'].'%')->latest()->get();
    return view('ap.index',compact('data'));

}
public function pgAppointment($user_id){
    
  // dd($user_id);
   $user = User::find($user_id);
   return view('pg.pg-appointment',compact('user'));

 }
 public function store_app(Request $req){

    $app_date_string = strtotime($req['app_date']); 
     $app_date =  date('d M y', $app_date_string);
     $app_time = $req['app_time'];
     $owner_id = $req['owner_id'];
     $user_id = Auth::id();
     //dd($app_date,$app_time,$owner_id,$user_id);
     AppointmentsTable::create([
       'date'=>$app_date,
       'time'=>$app_time,
       'owner_id'=>$owner_id,
       'user_id'=>$user_id
     ]);

     return redirect()->route('home')->with('message','Appointments Fixed Successfully');
  
   }
}