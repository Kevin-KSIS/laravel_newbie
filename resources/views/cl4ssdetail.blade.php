@extends('layouts.app')

@section('css')
  <link href={{ url("css/home/style.css")}} rel="stylesheet">
@endsection('css')

@section('content')

<link rel="stylesheet" href="{{url('css/class/vendor.css')}}">
<link rel="stylesheet" id="theme-style" href="{{url('css/class/app.css')}}">

<div class="title-header">
  <h1>{{ $classes->name }}</h1>
  <small>-- {{ $users[$classes->teacher_id]->username }} --</small>
</div>
<div class="app" id="app">
    <article class="content dashboard-page">
       <section class="section">
          <div class="row sameheight-container">
             <div class="col col-xs-12 col-sm-12 col-md-6 col-xl-5 stats-col">
                <div class="card sameheight-item stats" data-exclude="xs">
                   <div class="card-block">
                      <div class="title-block">
                         <h4 class="title"> Stats </h4>
                         </p>
                      </div>
                      <div class="row row-sm stats-container">
                         <div class="col-xs-12 col-sm-6 stat-col">
                            <div class="stat-icon"> <i class="fa fa-rocket"></i> </div>
                            <div class="stat">
                               <div class="value"> 5407 </div>
                               <div class="name"> Active items </div>
                            </div>
                            <progress class="progress stat-progress" value="75" max="100">
                               <div class="progress">
                                  <span class="progress-bar" style="width: 75%;"></span>
                               </div>
                            </progress>
                         </div>
                         <div class="col-xs-12 col-sm-6 stat-col">
                            <div class="stat-icon"> <i class="fa fa-shopping-cart"></i> </div>
                            <div class="stat">
                               <div class="value"> 78464 </div>
                               <div class="name"> Items sold </div>
                            </div>
                            <progress class="progress stat-progress" value="25" max="100">
                               <div class="progress">
                                  <span class="progress-bar" style="width: 25%;"></span>
                               </div>
                            </progress>
                         </div>
                         <div class="col-xs-12 col-sm-6  stat-col">
                            <div class="stat-icon"> <i class="fa fa-line-chart"></i> </div>
                            <div class="stat">
                               <div class="value"> $80.560 </div>
                               <div class="name"> Monthly income </div>
                            </div>
                            <progress class="progress stat-progress" value="60" max="100">
                               <div class="progress">
                                  <span class="progress-bar" style="width: 60%;"></span>
                               </div>
                            </progress>
                         </div>
                         <div class="col-xs-12 col-sm-6  stat-col">
                            <div class="stat-icon"> <i class="fa fa-users"></i> </div>
                            <div class="stat">
                               <div class="value"> 359 </div>
                               <div class="name"> Total users </div>
                            </div>
                            <progress class="progress stat-progress" value="34" max="100">
                               <div class="progress">
                                  <span class="progress-bar" style="width: 34%;"></span>
                               </div>
                            </progress>
                         </div>
                         <div class="col-xs-12 col-sm-6  stat-col">
                            <div class="stat-icon"> <i class="fa fa-list-alt"></i> </div>
                            <div class="stat">
                               <div class="value"> 59 </div>
                               <div class="name"> Tickets closed </div>
                            </div>
                            <progress class="progress stat-progress" value="49" max="100">
                               <div class="progress">
                                  <span class="progress-bar" style="width: 49%;"></span>
                               </div>
                            </progress>
                         </div>
                         <div class="col-xs-12 col-sm-6 stat-col">
                            <div class="stat-icon"> <i class="fa fa-dollar"></i> </div>
                            <div class="stat">
                               <div class="value"> $780.064 </div>
                               <div class="name"> Total income </div>
                            </div>
                            <progress class="progress stat-progress" value="15" max="100">
                               <div class="progress">
                                  <span class="progress-bar" style="width: 15%;"></span>
                               </div>
                            </progress>
                         </div>
                      </div>
                   </div>
                </div>
             <!-- end stat -->
             </div>

             <div class="col col-xs-12 col-sm-12 col-md-6 col-xl-7 history-col">
                <div class="card sameheight-item" data-exclude="xs">
                   <div class="card-block">
                      <div class="tab-content">
                         <div role="tabpanel" class="tab-pane active fade in" id="visits">
                            <p class="title-description"> Number of unique visits last 30 days </p>
                            <div id="dashboard-visits-chart"></div>
                         </div>
                         <div role="tabpanel" class="tab-pane fade" id="downloads">
                            <p class="title-description"> Number of downloads last 30 days </p>
                            <div id="dashboard-downloads-chart"></div>
                         </div>
                      </div>
                   </div>
                </div>
             <!-- end history -->
             </div>
          </div>
       </section>

       <section class="section">
          <div class="row sameheight-container">
             <div class="col-xl-8">
                <div class="card sameheight-item items" data-exclude="xs,sm,lg">
                   <div class="bordered">
                      <div class="header-block">
                        <form id="formChall" method="post" action="{{ route('cl4ss.upchall') }}" enctype="multipart/form-data">
                            @if (!Auth::guest() and Auth::user()->id === $classes->teacher_id)
                            <label id="uploadLabel" for="fileChall" class="button btn btn-primary btn-sm rounded">Adds new</label>
                            @endif
                            <input id="fileChall" type="file" name="fileChall" style="display:none;" onchange="this.form.submit();">
                             {{ csrf_field() }}
                             <input type="hidden" name="class_id" value="{{ $classes->id }}">
                            <span>HOME WORKS</span>
                        </form>
                         
                      </div>
                   </div>

                   <ul class="item-list">
                      <li class="item item-list-header hidden-sm-down">
                         <div class="item-row">
                            <div class="item-col item-col-header fixed item-col-img xs"></div>
                            <div class="item-col item-col-header item-col-title">
                               <div> <span>Name</span> </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                               <div> <span>Points</span> </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                               <div class="no-overflow"> <span>Stats</span> </div>
                            </div>
                            <div class="item-col item-col-header item-col-date">
                               <div> <span>Published</span> </div>
                            </div>
                         </div>
                      </li>
                      <li class="item">
                      @foreach ($homeworks as $key => $value)
                        @if ($value->flag === 1)
                         <div class="item-row">
                         <div class="item-col fixed item-col-img xs">
                               <a href="{{route('cl4ss.download', json_decode($value -> homework)->path)}}">
                                  <div><i class="fa fa-download" aria-hidden="true"></i></div>
                               </a>
                            </div>
                            <div class="item-col item-col-title no-overflow">
                               <div>
                                  <a href="" data-toggle="modal" data-target="#Modal-{{$key}}">
                                     <h4 class="item-title no-wrap"> {{ json_decode($value -> homework)->title }} </h4>
                                  </a>
                               </div>
                            </div>
                            <div class="item-col item-col-date">
                               <div class="item-heading">Published</div>
                               <div> {{ $value -> created_at }} </div>
                            </div>
                         </div>
                          @endif
                         @endforeach
                      </li>
                   </ul>
                </div>
             </div>
             <div class="col-xl-4">
                <div class="card sameheight-item sales-breakdown" data-exclude="xs,sm,lg">
                   <div class="card-block">
                      <div class="dashboard-sales-breakdown-chart" id="dashboard-sales-breakdown-chart"></div>
                   </div>
                </div>
             </div>
          </div>
       </section>

       <section class="section map-tasks">
          <div class="row sameheight-container">
             <div class="col-md-8">
                <div class="card sameheight-item" data-exclude="xs,sm">
                    <div class="bordered">
                      <div class="header-block">
                        <form id="formChall2" method="post" action="{{ route('cl4ss.upchall2') }}" enctype="multipart/form-data">
                            @if (!Auth::guest() and Auth::user()->id === $classes->teacher_id)
                            <label id="uploadLabel" for="fileChall2" class="button btn btn-primary btn-sm rounded">Adds new</label>
                            @endif
                            <input id="fileChall2" type="file" name="fileChall2" style="display:none;" onchange="upload('formChall2');">
                             {{ csrf_field() }}
                             <input type="hidden" name="classid" value="{{ $classes -> id }}">
                            <span>CHALLENGES</span>
                        </form>
                         
                      </div>
                   </div>
                   <ul class="item-list">
                      <li class="item item-list-header hidden-sm-down">
                         <div class="item-row">
                            <div class="item-col item-col-header fixed item-col-img xs"></div>
                            <div class="item-col item-col-header item-col-title">
                               <div> <span>Name</span> </div>
                            </div>
                            <div class="item-col item-col-header item-col-sales">
                               <div> <span>Points</span> </div>
                            </div>
                            <div class="item-col item-col-header item-col-stats">
                               <div class="no-overflow"> <span>Stats</span> </div>
                            </div>
                            <div class="item-col item-col-header item-col-date">
                               <div> <span>Published</span> </div>
                            </div>
                         </div>
                      </li>
                      <li class="item">
                      @foreach ($homeworks as $key => $value)
                        @if ($value->flag === 2)
                         <div class="item-row">
                            <div class="item-col item-col-title no-overflow">
                               <div>
                                  <a href="" data-toggle="modal" data-target="#Modal2-{{$key}}">
                                     <h4 class="item-title no-wrap"> {{ json_decode($value -> homework)->title }} </h4>
                                  </a>
                               </div>
                            </div>
                            <div class="item-col item-col-date">
                               <div class="item-heading">Published</div>
                               <div> {{ $value -> created_at }} </div>
                            </div>
                         </div>
                          @endif
                         @endforeach
                      </li>
                   </ul>
                </div>
             </div>
             <div class="col-md-4">
                <div class="card tasks sameheight-item" data-exclude="xs,sm">
                  @if (!Auth::guest() and in_array(Auth::user()->id, array_column($members, 'student_id')))
                   <div class="bordered">
                      <div class="header-block pull-right"> 
                        <a href="" id="registered" class="btn btn-primary btn-sm rounded pull-right">
                          <span id='lbregis'>Registered</span>
                        </a> 
                      </div>
                   </div>
                  @elseif (!Auth::guest() and Auth::user()->role===1 and !in_array(Auth::user()->id, array_column($members, 'student_id')))
                   <div class="bordered">
                      <div class="header-block pull-right"> 
                        <a href="" id="register" class="btn btn-primary btn-sm rounded pull-right">
                          <span id='lbregis'>Register</span>
                        </a> 
                      </div>
                   </div>
                   @endif
                   <div class="card-block">
                      <div class="tasks-block">
                         <ul class="item-list">
                            <li class="item">
                              @foreach ($members as $mem)
                              @if ($mem->accepted) {{-- is member --}}
                               @if (!Auth::guest() and ($classes->teacher_id === Auth::user()->id)) {{-- is teacher --}}
                                  <div class="item-row">
                                      <div class="item-col item-col-title"> <label>
                                         <input class="checkbox" type="checkbox" id="ckaccept" checked="checked"> 
                                         <span onclick="accept('{{ $mem->student_id }}');">{{ $users[$mem->student_id]->username }}</span>
                                         </label>
                                       </div>
                                      <div class="item-col fixed item-col-actions-dropdown">
                                         <div class="item-actions-dropdown">
                                            <a class="" href="{{ route('home.show', $mem->student_id) }}" target="_plank">
                                            <i class="fa fa-external-link"></i>
                                            </a>
                                         </div>
                                      </div>
                                   </div>
                               @else  {{-- not teacher --}}
                                  <div class="item-row">
                                      <div class="item-col item-col-title"> 
                                        <label>
                                          <span onclick="accept('{{ $mem->student_id }}');">{{ $users[$mem->student_id]->username }}</span>
                                         </label>
                                       </div>
                                      <div class="item-col fixed item-col-actions-dropdown">
                                         <div class="item-actions-dropdown">
                                            <a class="" href="{{ route('home.show', $mem->student_id) }}" target="_plank">
                                            <i class="fa fa-external-link"></i>
                                            </a>
                                         </div>
                                      </div>
                                   </div>
                               @endif
                              @elseif (!Auth::guest() and ($classes->teacher_id === Auth::user()->id))
                                  <div class="item-row">
                                      <div class="item-col item-col-title"> <label>
                                         <input class="checkbox" type="checkbox" id="ckaccept"> 
                                         <span onclick="accept('{{ $mem->student_id }}');">{{ $users[$mem->student_id]->username }}</span>
                                         </label>
                                       </div>
                                      <div class="item-col fixed item-col-actions-dropdown">
                                         <div class="item-actions-dropdown">
                                            <a class="" href="{{ route('home.show', $mem->student_id) }}" target="_plank">
                                            <i class="fa fa-external-link"></i>
                                            </a>
                                         </div>
                                      </div>
                                   </div>
                              @endif
                              @endforeach
                            </li>
                         </ul>
                      </div>
                   </div>
                </div>
             </div>
          </div>
       </section>
    </article>


<!-- modals 1 -->
  @foreach ($homeworks as $key => $h)
  @if ($h->flag === 1)
  <div class="modal fade" id="Modal-{{$key}}" tabindex="-1" role="dialog" aria-labelledby="Modal-label-{{$key}}">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
          <p>{{ json_decode($h -> homework)->title }}</p>
        </div>
          <div class="modal-body">  
        @foreach ($submit_homeworks as $k => $d)
          @if (!Auth::guest() and (($d->student_id === Auth::user()->id) or ($classes->teacher_id === Auth::user()->id)) and ($d->homework_id === $h->id))
            <a href="{{ route('home.show', $d->student_id) }}" target="_plank">{{ $users[$d->student_id]->username }}</a>
            <small style="color:black;padding-left:5em">&middot;&nbsp;{{ $d -> created_at }}&nbsp;&middot;</small>
            <a href="{{route('cl4ss.download', json_decode($d->data)->path)}}" style="float:right">{{ json_decode($d->data)->title }} </a>
            <p></p>
          @endif
        @endforeach
          </div>

        // upload allow member
        <div class="modal-footer">
        <!-- begin: check user is member of class -->
        {{$accepted = -1}}
        @foreach ($members as $key => $value)
          @if (!Auth::guest() and ($value -> student_id == Auth::user()->id))
            {{ $accepted = $value -> accepted }}
          @endif
        @endforeach
        <!-- end -->
          @if (!Auth::guest() and in_array(Auth::user()->id, array_column($members, 'student_id')) and $accepted === 1 )
          <form method="post" action="{{ route('cl4ss.submithw') }}" enctype="multipart/form-data" style="float:left" onchange="$(this).submit();">
              <label id="uploadLabel" for="filehw{{$key}}" class="button btn btn-primary btn-sm rounded" >Submit homework</label>
              <input id="filehw{{$key}}" type="file" name="filehw" style="display:none;">
              <input type="hidden" name="homeworkid" value="{{ $h->id }}">
              <input type="hidden" name="classid" value="{{ $classes->id }}">
              {{csrf_field()}}
          </form>
          @endif
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  @endif
  @endforeach
<!--end models -->
<!-- modals 2 -->
  @foreach ($homeworks as $key => $h)
  @if ($h->flag === 2)
  <div class="modal fade" id="Modal2-{{$key}}" tabindex="-1" role="dialog" aria-labelledby="Modal2-label-{{$key}}">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
          <p>{{ json_decode($h -> homework)->title }}</p>
        </div>
        <div class="modal-body">  
          <p id="content_chall">{{ json_decode($h -> homework)->hint }}</p>
          <p></p>
        </div>

        // submit
        <div class="modal-footer">
          @if (!Auth::guest() and (in_array(Auth::user()->id, array_column($members, 'student_id'))) and $accepted == 1)
          <form method="post" action="{{ route('cl4ss.submitAns') }}"  enctype="multipart/form-data" style="float:left" id='answer{{$key}}'>
                <input type="submit" name="Submit" value="Submit Answer" class="button btn btn-primary btn-sm rounded" onclick='submitAns("answer{{$key}}", event);'>
                <input type="text" name="answer" id='ipanswer' placeholder="Your answer" style="color:black; width: 350px;">
               <input type="hidden" name="classid" value="{{ $classes->id }}">
               <input type="hidden" name="homeworkid" value="{{ $h->id }}">
               {{ csrf_field() }}
          </form>
          @endif
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  @endif
  @endforeach
<!--end models -->

</div>



@endsection

@section('js')
<script src="{{url('/js/class/vendor.js')}}"></script>
<script src="{{url('/js/class/app.js')}}"></script>
<script>
  function status(){
    let stt = ['Register', 'Registered'];
    if ($('#lbregis').html() == 'Register'){
      $('#lbregis').html(stt[1]);
    }else{
      $('#lbregis').html(stt[0]);
    };
  }

  function getdata(a, b){
    let task = a || "";
    let value = b || "";

    if (task == 'suggest'){
      return {
        'task': task,
        'class_id': "{{ $classes->id }}",
        '_token': "{{ csrf_token() }}"
      }
    }

    if (task == 'unregis'){
      return {
        'task': task,
        'class_id': "{{ $classes->id }}",
        '_token': "{{ csrf_token() }}"
      }
    }

    if (task == 'accept'){
      return {
        'task': task,
        'student_id': value,
        'class_id': "{{ $classes->id }}",
        '_token': "{{ csrf_token() }}"
      }
    }
  }

  function accept(value, flag){
    $.ajax({
      type: "POST",
      url: "{{route('cl4ss.store')}}",
      data: getdata('accept', value),
      success: function(data){
        console.log(data);
      },
      error: function(requests, status, err){
        console.log(err);
      }
    });
  }

  function upload(id){
    hint = prompt('Hint');
    while (! Boolean(hint)){
      hint = prompt('Hint');
    }

    $('<input type="hidden" name="hint"></input').val(hint).appendTo($('#formChall2'));
    $('#formChall2').submit();
  }

  function submitAns(id, event){
    $.ajax({
      type: 'POST',
      url: "{{ route('cl4ss.submitAns') }}",
      data: $('#'+id).serialize(),
      success: function(data){
        $('#ipanswer').val("");
        $('#content_chall').html(data);
      },
      error: function(xhr, status, err){
        console.log(err);
      }
    });

    event.preventDefault(); 
  }

  function uploadHw(classid, homeworkid){
    alert (homeworkid);
  }

  $('#register').click(function(event) {
    event.preventDefault();        
    $.ajax({
      type: "POST",
      url: "{{route('cl4ss.store')}}",
      data: getdata('suggest'),
      success: function(data){
        status();
        $('#register').attr('id', 'registered');
      },
      error: function(requests, status, err){
        console.log(err);
      }
    });
  });

  $('#registered').click(function(event) {
    event.preventDefault();        
    confirm = confirm('Are you sure?', 'yes', 'no');
    if (confirm){
      $.ajax({
      type: "POST",
      url: "{{route('cl4ss.store')}}",
      data: getdata('unregis'),
      success: function(data){
        status();
        $('#registered').attr('id', 'register');
      },
      error: function(requests, status, err){
        console.log(err);
      }
    });
    }
  });
</script>
@endsection('js')
