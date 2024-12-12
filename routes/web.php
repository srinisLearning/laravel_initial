<?php

use App\Http\Controllers\CustomSesLoginController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('login',[CustomSesLoginController::class,'showLogin'])->name('showLogin')->middleware('auth-check');

Route::get('register',[CustomSesLoginController::class,'showRegister'])->name('register')->middleware('auth-check');

Route::post('/register-user',[CustomSesLoginController::class,'registerUser'])->name('register-user');

Route::post('/login-user',[CustomSesLoginController::class,'loginUser'])->name('login-user');

Route::get('/dashboard',[CustomSesLoginController::class,'dashboard'])->name('dashboard')->middleware('isLoggedIn');

Route::get('/logout',[CustomSesLoginController::class,'logout'])->name('logout');

