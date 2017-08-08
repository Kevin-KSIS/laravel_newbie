<?php

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

Auth::routes();

// 
Route::get('/', function(){
	return redirect('/cl4ss');
});

Route::get('/cl4ss', 'Cl4ssController@index') -> name('cl4ss');

Route::post('/cl4ss', 'Cl4ssController@store') -> name('cl4ss.store');

Route::get('/cl4ss/{id}', 'Cl4ssController@show') -> name('cl4ss.show');

Route::post('cl4ss/upChall','Cl4ssController@upChallenge') -> name('cl4ss.upchall');

Route::post('cl4ss/upChall2','Cl4ssController@upChallenge2') -> name('cl4ss.upchall2');

Route::post('cl4ss/submithw', 'Cl4ssController@submitHomework') -> name('cl4ss.submithw');

Route::post('cl4ss/submitAns', 'Cl4ssController@submitAns') -> name('cl4ss.submitAns');

Route::get('cl4ss/download/{path}', function($path){
	return Response::download(public_path() . '/files_upload/' . $path);
}) -> name('cl4ss.download');

// 
Route::get('/home', 'HomeController@index')->name('home');

Route::put('/home/{id}', 'HomeController@update')->name('home.update');

Route::get('/home/{id}', 'HomeController@show')->name('home.show');

// 
Route::get('/chat', 'ChatsController@index') ->name('chat');
Route::get('/chat/message', 'ChatsController@fetchMessages') ->name('chat.fetch');
Route::post('/chat/message', 'ChatsController@sendMessage') ->name('chat.send');
Route::post('/chat/edit', 'ChatsController@editMessage') ->name('chat.edit');


// 
Route::get('/err404', function(){
	return view('error/404');
}) -> name('404');

Route::get('/test', 'Cl4ssController@test');





