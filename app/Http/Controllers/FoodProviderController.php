<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\FPModel;
use App\Models\User;
use App\Models\MealBookingTable;

class FoodProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     * 
     * 
     */
    public function __construct()
    {
        $this->middleware('auth')->except('index');
    }

    public function index()
    {
       // $data = FPModel::all();
        $data = FPModel::where('user_id','!=',Auth::id())->get();
        return view('fp.index',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('fp.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
     // dd($request->all());
     $userid = Auth::user()->id;
     $user = User::find($userid);

     $foodImage = $request->file('fp_food_img');
       $foodName = time().'.'.$foodImage->getClientOriginalExtension();
       $destinationPath = public_path('/images');
       $foodImage->move($destinationPath,$foodName);

       $kitchenImage = $request->file('fp_kitchen_img');
       $kitchenName = time().'1.'.$kitchenImage->getClientOriginalExtension();
       $destinationPath1 = public_path('/images');
       $kitchenImage->move($destinationPath1,$kitchenName);

       
     if($user->isFoodProvider === 0)
     {
     FPModel::create([
        "user_id"=>Auth::user()->id,          
        "fp_name"=>$request['fp_name'],
        "fp_area"=>$request['fp_area'],
        "fp_landmark"=>$request['fp_landmark'],
        "fp_menu"=>$request['fp_menu'],
        "price"=>$request['fp_price'],
        "fp_food_img"=>$foodName,
        "fp_kitchen_img"=>$kitchenName,
         
    ]);
      }
     
    $user->isFoodProvider = 1;
    $user->save();
   
    return redirect()->route('home')->with('message','Food Accomodation  added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        dd($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $food = FPModel::find($id);
         return view('fp.edit',compact('food'));
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
        //dd($request->all());

        $food = FPModel::find($id);        

        if($request->has('fp_food_img')){
            $foodImage = $request->file('fp_food_img');
            $foodName = time().'.'.$foodImage->getClientOriginalExtension();
            $destinationPath = public_path('/images');
            $foodImage->move($destinationPath,$foodName);         
          }
           else{
               $foodName = $food->fp_food_img;
       
           }

           if($request->has('fp_kitchen_img')){
            $kitchenImage = $request->file('fp_kitchen_img');
            $kitchenName = time().'.'.$kitchenImage->getClientOriginalExtension();
            $destinationPath = public_path('/images');
            $kitchenImage->move($destinationPath,$kitchenName);
           
            
           }
           else{
               $kitchenName = $food->fp_kitchen_img;
             
           }

        $food->fp_name = $request['fp_name'];
        $food->fp_area = $request['fp_area'];
        $food->fp_landmark = $request['fp_landmark'];
        $food->fp_menu = $request['fp_menu'];
        $food->price = $request['fp_price'];
        $food->fp_food_img = $foodName;
        $food->fp_kitchen_img = $kitchenName;
        $food->save();
        return redirect()->route('home')->with('message','Food Provider Updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

     //  dd($id,Auth::User()->id);
       $pg = FPModel::findorfail($id);
        $pg->delete();  
        $userid = Auth::user()->id;
        $user = User::find($userid);
        $user->isFoodProvider = 0;
        $user->save();
       return redirect()->route('home')->with('msg','Food Provider  deleted successfully');

    
}

   public function bookMeal($pid,$meal){

    if($meal === "LUNCH"){
    
   // $lunchUser = MealBookingTable::where('consumer_id','=',Auth::id())->where('meal','=','LUNCH')->whereDate('created_at', '=',date('Y-m-d'))->get();
    $lunchUser = MealBookingTable::where('consumer_id','=',Auth::id())->where('provider_id','=',$pid)->where('meal','=','LUNCH')->whereDate('created_at', '=',date('Y-m-d'))->get();
 
      
      if($lunchUser->count()>0){
             
         // return redirect()->route('home')->with('mess',  'You can book only one Lunch from a provider per day');
         return redirect()->route('home')->withErrors('message','You can book only one Lunch from a provider per day');
      }
      else
        {
     
       MealBookingTable::create([
        "consumer_id"=>Auth::id(),          
        "provider_id"=>$pid,
        "meal"=>$meal,
       ]);

       
       return redirect()->route('home')->with('messsage', 'LUNCH booked successfully');
       }

    }

    else{

        

  //$dinnerUser = MealBookingTable::where('consumer_id','=',Auth::id())->where('meal','=','DINNER')->whereDate('created_at', '=',date('Y-m-d'))->get();
   
  $dinnerUser = MealBookingTable::where('consumer_id','=',Auth::id())->where('provider_id','=',$pid)->where('meal','=','DINNER')->whereDate('created_at', '=',date('Y-m-d'))->get();
   

       if($dinnerUser->count()>0){           
         // return redirect()->route('home')->with('message','You can book only one Dinner from a provider per day');
           return redirect()->route('home')->withErrors('message' , 'You can book only one Dinner from a provider per day');
       }
       else
         {      
        MealBookingTable::create([
         "consumer_id"=>Auth::id(),          
         "provider_id"=>$pid,
         "meal"=>$meal,
        ]);
      
        return redirect()->route('home')->with('message','DINNER booked successfully');
        }
      
    }
    
   }

   public function fpSearch(Request $req){
     //dd($req['search']);
     $data = FPModel::where('fp_name','like',$req['search'].'%')
                      ->orWhere('fp_menu','like',$req['search'].'%')
                      ->latest()
                      ->get();
     return view('fp.index',compact('data'));
 
 }

}

