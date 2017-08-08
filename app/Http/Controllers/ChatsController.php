<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Events\MessageSent;

class ChatsController extends Controller
{
    public function __construct()
	{
	  $this->middleware('auth');
	  date_default_timezone_set("Asia/Ho_Chi_Minh");
	}	

	/**
	 * Show chats
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
	  return view('chat');
	}

	/**
	 * Fetch all messages
	 *
	 * @return Message
	 */
	public function fetchMessages(Request $request){
		$data = array();
		$receiver_id = $request->input('receiver_id');
		$results = DB::table('messages') -> where('receiver_id', $receiver_id) -> get();
		foreach ($results as $key => $value) {
			$a = array(
				'id' => $value->id,
				'sender'=> DB::table('users')->where('id', $value -> sender_id)->get()[0]->username, 
				'message'=> $value->message, 
				'created_at'=> explode(' ', $value->created_at)[1]);
			array_push($data, $a);
		}
		return $data;
	}

	/**
	 * Persist message to database
	 *
	 * @param  Request $request
	 * @return Response
	 */
	public function sendMessage(Request $request){
	  $userID = $request -> input('userid');
	  $message = $request -> input('message');

	  // insert
	  DB::table("messages")->insertGetId([
	  			'sender_id'=> Auth::user()->id,
	  			'receiver_id'=> $userID,
	  			'message'=> $message,
	  			'created_at' => date("Y-m-d h:m:s",time()),
	  		]);

	  return  [
	  			['id' 			=> DB::table('messages')->max('id'),
			  	'message'		=> $message,
			  	'sender'		=> Auth::user()->username,
			  	'created_at'	=> date("Y-m-d h:m:s",time())
			  ] ];
	}

	public function editMessage(Request $request){
		$flag = false;
		$user = Auth::user();
		$msgID = $request -> input('commentid');
		$newmsg = $request -> input('newmsg');

		// author
		$ownerID = DB::table('messages')->where('id', $msgID)->get()[0]->sender_id;
		if ($ownerID === $user->id){
			$flag = true;
		}

		// update
		if ($flag){
			DB::table('messages')->where('id', $msgID)
						->	update(['message'=>$newmsg]);
			return 'Updated';
		}

		return 'Permission Deny';
 	}
}
