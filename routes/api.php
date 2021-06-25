<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('registerStepOne','api\LoginController@registerStepOne');
Route::post('registerStepTwo','api\LoginController@registerStepTwo');
Route::post('registerStepThree','api\LoginController@registerStepThree');
Route::post('login','api\LoginController@login');
Route::post('modifyPassStepOne','api\LoginController@modifyPassStepOne');
Route::post('modifyPassStepTwo','api\LoginController@modifyPassStepTwo');
Route::get('cityTerrace','api\LoginController@cityTerrace');
Route::post('sendSmsCode','api\LoginController@sendSmsCode');
Route::get('baseConfig','api\IndexController@baseConfig');
Route::post('NoticeList','api\IndexController@NoticeList');
Route::post('NoticeInfo','api\IndexController@NoticeInfo');
Route::get('terrace','api\IndexController@terrace');

Route::middleware('jwt')->group(function () {
    Route::post('homePage','api\IndexController@homePage');
    Route::get('userData','api\IndexController@userData');
    Route::post('myCommission','api\IndexController@myCommission');
    Route::post('subWithdrawal','api\IndexController@subWithdrawal');
    Route::post('withdrawal','api\IndexController@withdrawal');
    Route::post('mySonOrder','api\IndexController@mySonOrder');
    Route::post('mySonOrderSort','api\IndexController@mySonOrderSort');
    Route::post('modifyMyPassword','api\IndexController@modifyMyPassword');
    Route::post('sharePath','api\IndexController@sharePath');
    Route::post('uploadAvatar','api\LoginController@uploadAvatar');
});

