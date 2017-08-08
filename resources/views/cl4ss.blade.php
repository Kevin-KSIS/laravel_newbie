<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Challenge 08 - Framework Laravel</title>
        <meta name="description" content="Phần mềm quản lý quản lý sinh viên">
        <meta name="author" content="kevinlpd">
        <link rel="icon" href="favicon.ico">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
        <!-- Bootstrap core CSS -->
        <link href={{ url("css/bootstrap.min.css")}} rel="stylesheet">
        <link rel="stylesheet" href={{url("fonts/font-awesome.min.css")}}>
        <!-- Custom styles for this template -->
        <link href={{ url("css/home/style.css")}} rel="stylesheet">
        <link href={{ url("css/home/navbar.css") }} rel="stylesheet">
    </head>

    <body id="page-top">

        <!-- nav bar -->
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @if (Auth::check())
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ url('/login') }}">Login</a>
                        <a href="{{ url('/register') }}">Register</a>
                    @endif
                </div>
            @endif
        </div>

        <section id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="section-title">
                            <h2>List of Classes</h2>
                        </div>
                    </div>
                </div>

                <!-- contents's loop -->
                <div class="row row-0-gutter">
                @foreach ($classes as $cls)
                    @if (($cls -> id) % 2 != 0)
                    <!-- left -->
                    <div class="col-md-6 col-0-gutter">
                        <div class="ot-portfolio-item">
                            <figure class="effect-bubba">
                                <img src={{url("images/classes/class$cls->id.png")}} alt="img{{$cls->id}}" class="img-responsive" />
                                <figcaption>
                                    <h2>{{ $cls -> name }}</h2>
                                    <p>{{ $users[$cls->teacher_id]->username }}</p>
                                    <a href="#" data-toggle="modal" data-target="#Modal-{{$cls->id}}">View more</a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    @endif
                @endforeach

                @foreach ($classes as $cls)
                    @if (($cls -> id) % 2 == 0)
                    <!-- right -->
                    <div class="col-md-6 col-0-gutter">
                        <div class="ot-portfolio-item">
                            <figure class="effect-bubba">
                                <img src={{url("images/classes/class$cls->id.png")}} alt="img{{$cls->id}}" class="img-responsive" />
                                <figcaption>
                                    <h2>{{ $cls -> class_name }}</h2>
                                    <p>{{ $users[$cls->teacher_id]->username }}</p>
                                    <a href="#" data-toggle="modal" data-target="#Modal-{{$cls->id}}">View more</a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    @endif
                @endforeach
                </div>
            </div><!-- container -->
        </section>

        <p id="back-top">
            <a href="#top"><i class="fa fa-angle-up"></i></a>
        </p>

        <!-- footer -->
        <footer>
            <div class="container text-center">
                <p>Copyright &copy; by <a href="http://fb.com/k3vinlpd" target="_blank"><span>Kevinlpd</span></a></p>
            </div>
        </footer>

        <!-- Modal for portfolio item -->
        @foreach ($classes as $cls)
        <div class="modal fade" id="Modal-{{$cls->id}}" tabindex="-1" role="dialog" aria-labelledby="Modal-label-{{$cls->id}}">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="Modal-label-{{$cls->id}}">
                            {{ $cls -> name }}
                        </h4>
                    </div>
                    <div class="modal-body">
                        <img src={{url("images/classes/class$cls->id.png")}} alt="img{{$cls->id}}" class="img-responsive" />
                        <!-- tags -->
                        <div class="modal-works">
                            <span>{{ $users[$cls->teacher_id]->username }}</span>
                            <span>{{ $cls -> created_at }}</span>
                        </div>
                        
                        <!-- links -->
                        <!-- description -->
                        <p>{{ $cls->description }}</p>
                    </div>
                    <div class="modal-footer">
                        <a href="{{route('cl4ss.show',$cls->id)}}" style="float:left" target="_plank">Details </a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        @endforeach

        <!-- Bootstrap core JavaScript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src={{url("js/jquery.min.js")}}></script>
        <script src={{url("js/bootstrap.min.js")}}></script>
        <script src={{url("js/home/theme-scripts.js")}}></script>
    </body>
</html>