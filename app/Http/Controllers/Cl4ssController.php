<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Cl4ss;
use App\User;
use Auth;
use Validator;

class Cl4ssController extends Controller
{
    public function __construct(){
        date_default_timezone_set("Asia/Ho_Chi_Minh");
    }

    // list classes in home
    public function index(){
    	$classes = Cl4ss::all();
        $user_arr = DB::table('users')->where('role', 2)->get()->toArray();
        $users = array_column($user_arr, NULL, 'id');
    	return view('cl4ss', compact('classes', 'users'));
    }

    // display details of class
    public function show($id){
        $members = DB::table('members')->where('class_id', $id)->get()->toArray();
        $classes = DB::table('classes')->where('id', $id)->get()[0];
        $homeworks = DB::table('homeworks')->where('class_id', $id)->get();

        $user_arr = DB::table('users')->get()->toArray();
        $users = array_column($user_arr, NULL, 'id');
        $submit_homeworks = $submit_homeworks = DB::table('submit_homeworks')->get();
        
        return view('cl4ssdetail', compact('classes', 'users', 'members', 'homeworks', 'submit_homeworks'));
    }

    // handing register to class
    public function store(Request $request){
    	$t=time();
    	$task = $request->input('task');	
        $class_id = $request->input('class_id');
        $members = DB::table('members')->where('class_id', $class_id)->get()->toArray();
        if ($task === "suggest" and !Auth::guest() and !in_array(Auth::user()->id, array_column($members, 'student_id'))){
	    	DB::table('members') -> insert([
                'student_id' => Auth::user()->id,
	    		'class_id' => $class_id,
	    		'accepted' => 0,
	    		'created_at' => date("Y-m-d h:m:s",$t),
	    	]);
	    	return 'Success';
    	}

        if ($task === "unregis" and !Auth::guest() and in_array(Auth::user()->id, array_column($members, 'student_id'))){
            $homework_id_arr = DB::table('homeworks')->where('class_id', $class_id)->pluck('id');

            // delete from 'submit_homework' table
            foreach ($homework_id_arr as $key => $homework_id) {
                DB::table('submit_homeworks') -> where([
                    ['student_id', Auth::user()->id],
                    ['homework_id', $homework_id]])
                    -> delete();
            }
            // // detele from 'members' table
            DB::table('members') -> where([
                ['student_id', Auth::user()->id],
                ['class_id', $class_id]])
                -> delete();

            return 'Success';
        }

        if ($task === 'accept'){
            $t=time();
            $class_id = $request -> input('class_id');
            $teacher_id = DB::table('classes')->where('id', $class_id)->pluck('teacher_id')[0];
            $student_id = $request -> input('student_id');

            if (!Auth::guest() and $teacher_id === Auth::user()->id){
                $flag = DB::table('members') 
                    -> where([
                        ['class_id'     , $class_id],
                        ['student_id'   , $student_id],
                        ]) 
                    -> pluck('accepted')[0];

                DB::table('members')  
                    -> where([
                        ['class_id'    , $class_id],
                        ['student_id'  , $student_id],
                        ])
                    -> update(['accepted' => 1 ^ $flag]);
            return;
            }else{
                return "Permission Deny";
            }
        }

    	return 'Fails';
    }

    // handing upload homeworks
    public function upChallenge(Request $request){
        $t=time();
        $destinationPath = 'files_upload';
        $class_id = $request->input('class_id');
        $teacher_id = DB::table('classes')->where('id', $class_id)->pluck('teacher_id')[0];
        // Author
        if ((!Auth::guest() and Auth::user()->id === $teacher_id)){
            $validator = Validator::make($request->all(), [
                'fileChall' =>   'required|mimes:pdf,doc,ppt,xls,docx,pptx,xlsx,rar,zip|max:2048',
            ]);

            if (!$validator -> fails()){
                $file = $request->file('fileChall');
                $extension = $file -> getClientOriginalExtension();
                $filename = $t . '.' . $extension;
                $title = $file -> getClientOriginalName();
                $data = json_encode([
                    'title' => $title,
                    'path'  => $filename
                ]);

                $file->move($destinationPath,$filename);

                // update database
                DB::table('homeworks')  -> insertGetId([
                            'class_id' => $class_id,
                            'homework' => $data,
                            'created_at' => date("Y-m-d h:m:s",$t),
                        ]);
                return redirect(route('cl4ss.show', $class_id));
            }else{
                return redirect(route('404'));
            } 
        }
        return redirect(route('cl4ss.show', $class_id));
    }

    // handing upload challenge
    public function upChallenge2(Request $request){
        $t=time();
        $destinationPath = 'files_upload';
        $classID = $request->input('classid');
        $hint = $request->input('hint');
        $teacher_id = DB::table('classes')->where('id', $classID)->get()[0]->teacher_id;

        // // Author
        if (!Auth::guest() and (Auth::user()->id === $teacher_id)){
            $validator = Validator::make($request->all(), [
                'fileChall2' =>   'required|mimes:txt|max:2048',
            ]);

            if (!$validator -> fails()){
                $file = $request->file('fileChall2');
                $filename = $file -> getClientOriginalName();
                $title = "Challenge " . $t;
                $data = json_encode([
                    'title' => $title,
                    'hint' => $hint,
                    // 'path'  => $filename
                ]);

                $file->move($destinationPath,$filename);

                // // update database
                DB::table('homeworks')  -> insertGetId([
                            'class_id' => $classID,
                            'homework' => $data,
                            'flag' => 2,
                            'created_at' => date("Y-m-d h:m:s",$t),
                        ]);
                return redirect(route('cl4ss.show', $classID));
            }else{
                return redirect(route('404'));
            } 
        }
        return redirect(route('404'));
    }

    // handing upload "submit homework"
    public function submitHomework(Request $request){
        $t=time();
        $class_id = $request->input('classid');
        $members = DB::table('members')->where('class_id', $class_id)->get()->toArray();
        $destinationPath = 'files_upload';
        $homeworkID = $request->input('homeworkid');

        // Author
        if (!Auth::guest() and in_array(Auth::user()->id, array_column($members, 'student_id'))){
            $validator = Validator::make($request->all(), [
                'filehw' =>   'required|mimes:pdf,doc,ppt,xls,docx,pptx,xlsx,rar,zip|max:2048',
            ]);

            if (!$validator -> fails()){
                $file = $request->file('filehw');
                $extension = $file -> getClientOriginalExtension();
                $filename = $t . '.' . $extension;
                $title = $file -> getClientOriginalName();
                $data = json_encode([
                    'title' => $title,
                    'path'  => $filename
                ]);

                $file->move($destinationPath,$filename);

                // update database
                DB::table('submit_homeworks')  -> insertGetId([
                            'student_id' => Auth::user()->id,
                            'homework_id' => $homeworkID,
                            'data' => $data,
                            'created_at' => date("Y-m-d h:m:s",$t),
                        ]);
                return redirect(route('cl4ss.show', $class_id));
            }else{
                return redirect(route('404'));
            } 
        }
        return redirect(route('cl4ss.show', $class_id));
    }

    // handing "submit answer the challenge"
    public function submitAns(Request $request){
        $t=time();
        $classID = $request->input('classid');
        $homeworkID = $request->input('homeworkid');
        $members = DB::table('members')->where('class_id', $classID)->get()->toArray();

       if (!Auth::guest() and in_array(Auth::user()->id, array_column($members, 'student_id'))){
            $answer = $request->input('answer');
            $pattent = 'files_upload/' . $answer . '.txt';
            if (file_exists($pattent)){
                return str_replace("\n", "<br>", file_get_contents($pattent));
            
            }
            return "Incorrect";
        }
        return "Permission Deny";
    }

    public function test(){
        $submit_homeworks = DB::table('submit_homeworks')->get();
        foreach ($submit_homeworks as $k => $d){
            echo $d->student_id.'<br>';
            echo $d -> created_at.'<br>';
            echo $d->data.'<br>';
        }
    }
}
