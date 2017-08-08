@extends('layouts.app')

@section('css')
<link rel="stylesheet" href="{{url('css/chat/box.css')}}">
@endsection('css')

@section('content')
<div class="container">
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="image">
                                <img src={{url("images/home/background.jpg")}} alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <img class="avatar border-white" src={{url("images/home/face-2.jpg")}} alt="..."/>
                                  <h4 class="title">{{$user -> username}}<br />
                                     <a href="#"><small>
                                         @if($user->role === 2) Professor @endif
                                         @if($user->role === 1) Student @endif
                                     </small></a>
                                  </h4>
                                </div>
                                <p class="description text-center">
                                    "I like the way you work it <br>
                                    No diggity <br>
                                    I wanna bag it up"
                                </p>
                            </div>
                            <hr>
                            <div class="text-center">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-1">
                                        <h5>12<br /><small>Files</small></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>2GB<br /><small>Used</small></h5>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>24,6$<br /><small>Spent</small></h5>
                                    </div>
                                </div>
                            </div>
                        <!-- end card card-user-->
                        </div>
                        <div class="card">
                        <!-- end card -->
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Edit Profile</h4>
                            </div>
                            <div class="content">
                                <form id='formUpdate' method='post'>
                                    <input type="hidden" name="_method" value="put">

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Phone number</label>
                                                <input type="text" name="phonenumber" class="form-control border-input" placeholder="Your Phone number" value="{{ $user->phone_number }}">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" class="form-control border-input" placeholder="Username" value="{{$user->username}}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email address</label>
                                                <input type="email" class="form-control border-input" placeholder="Email" disabled value="{{$user->email}}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control border-input" placeholder="Home Address" value="Melbourne, Australia">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Current password</label>
                                                <input type="password" class="form-control border-input" name="currentpw" placeholder="Your current password">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>New password</label>
                                                <input type="password" class="form-control border-input" name="newpw" placeholder="Your new password">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Retype new password</label>
                                                <input type="password" class="form-control border-input" name="repw" placeholder="Retype new password">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>About Me</label>
                                                <textarea rows="5" class="form-control border-input" placeholder="Here can be your description" value="Mike">
                                                Oh so, your weak rhyme
                                                You doubt I'll bother, reading into it'
                                                I'll probably won't, left to my own devices
                                                But that's the difference in our opinions.</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    @if (Auth::user()->id === $user->id)
                                    <div class="text-center">
                                        {{ csrf_field() }}
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Update Profile</button>
                                    </div>
                                    @endif
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- end container-fluid -->
            </div>
        <!-- end content -->
        </div>
    <!-- end main-panel -->
    </div>

    <div class="modal fade" id="Modal-chat" tabindex="-1" role="dialog" aria-labelledby="Modal-label-chat">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="col-md-8 col-md-offset-8">
                    <div class="portlet portlet-default">
                        <div class="portlet-heading">
                            <div class="portlet-title portlet-heading">
                                <h4>{{ $user->name }}</h4>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!-- message -->
                        <div id="chat" class="panel-collapse collapse in">
                            <div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;" id="bodyMsg">
                            </div>
                            <div class="portlet-footer">
                                <form role="form" id="formSendMsg">
                                    <div class="form-group">
                                        <textarea class="form-control" id="message" placeholder="Enter message..."></textarea>
                                        <input type="submit" id="btnSend" class="btn btn-success pull-right" value="Send"></input>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection('content')

@section('js')
<script>
    $('#formUpdate').submit(function(){
        $.ajax({
            type: 'POST',
            url: "{{ route('home.update', $own->id) }}",
            data: $('#formUpdate').serializeArray(),
            success: function(data){
                alert(data);
            },
            error: function(request, status, error){
                alert(data);
            }
        });
        event.preventDefault();        
    });

    // send messages
    $('#btnSend').click(function(){
        msg = $('#message').val();
        $.ajax({
            type: 'POST',
            url: "{{ route('chat.send') }}",
            data: {
                'message': msg,
                'userid': {{$user->id}},
                '_token': "{{ csrf_token() }}"
            },
            success: function(data){
                fillMsg(data);
                console.log(data);
            },
            error: function(request, status, error){
                console.log('404 ERR');
            }
        });

        event.preventDefault();        
    });

    // load message
    $(document).ready(function(){
        $.ajax({
            type: 'GET',
            url: "{{ route('chat.fetch') }}",
            data:{
                'receiver_id': "{{$user->id}}"
            },
            success: function(data){
                fillMsg(data);
                console.log(data);
            },
            error: function(){
                console.log('404 ERR');
            }
        });
    })

    function fillMsg(data){
        $('#bodyMsg').html("");
        for (index in data){
            id = data[index].id;
            msg = data[index].message;
            sender = data[index].sender;
            time = data[index].created_at;

            div = $('<div class="row"></div');
            div1 = $('<div class="col-lg-12"></div>');
            div2 = $('<div class="media"></div>');
            a = $('<a class="pull-left" href="#"></a');
            img = $('<img class="media-object img-circle avatar-chat" src={{url("images/home/face-2.jpg")}} alt="">');
            div3 = $('<div class="media-body"></div>');
            h4 = $('<h4 class="media-heading"></h4>');
            span = $('<span class="small pull-right"></span>');
            a2 = $('<a onclick="modifiesMsg();"></a>').attr('id', id);
            hr = $('<hr>');            

            a2.html(msg);
            span.html(time);
            h4.html(sender);

            a.append(img);
            h4.append(span);
            div3.append(h4);
            div3.append(a2);
            div2.append(a);
            div2.append(div3);
            div1.append(div2);
            div.append(div1);
            div.appendTo($('#bodyMsg'));
            hr.appendTo($('#bodyMsg'));
        }
    }

    function modifiesMsg(){
        id = $(event.target).attr('id');
        $(event.target).attr('id', 'edittext');
        btnEdit = $('<input type="submit" id="btnEdit" class="btn btn-success pull-right" value="Edit" onclick="submitEdit('+id+')"></input>')
        $('#message').html($(event.target).html());
        $('#btnSend').replaceWith(btnEdit);
    }

    function submitEdit(id){
        event.preventDefault();        
        newMsg = $('#message').val();
        $('#edittext').html(newMsg);

        $.ajax({
            type: 'POST',
            url: "{{route('chat.edit')}}",
            data:{
                'commentid': id,
                'newmsg': newMsg,
                '_token': "{{csrf_token()}}"
            },
            success: function(data){
                console.log(data);
            },
            error: function(){
                console.log('404 ERR');
            }
        });
    }
</script>
@endsection('js')
