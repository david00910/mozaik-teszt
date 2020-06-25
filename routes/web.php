<?php

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

// Reading all the counties
Route::get('/counties', 'SettlementFinderController@indexCounties')->name('counties');
// Reading all the settlements
Route::get('/settlements/{id}', 'SettlementFinderController@indexSettlements')->name('settlements');
// Adding new settlements
Route::post('/addSettlement', 'SettlementFinderController@addNewSettlement')->name('addSettlement');
// Editing settlement
Route::post('/editSettlement/{id}', 'SettlementFinderController@editSettlement')->name('editSettlement');
// Deleting settlement
Route::delete('/deleteSettlement/{id}', 'SettlementFinderController@deleteSettlement')->name('deleteSettlement');



