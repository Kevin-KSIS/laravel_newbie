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
    $('#formSendMsg').submit(function(){
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
                console.log(data);
            },
            error: function(request, status, error){
                console.log('404 ERR');
            }
        });

        event.preventDefault();        
    });

    // load message
    $('#openInbox').click(function(){
        $.ajax({
            type: 'GET',
            url: "{{ route('chat.fetch') }}",
            data:{
                'userid': {{$user->id}}
            },
            success: function(data){
                fillMsg(data);
            },
            error: function(){
                console('404 ERR');
            }
        });

        
    })

    function fillMsg(data){
        $('#bodyMsg').html("");
        for (index in data){
            msg = data[index].message;
            sender = data[index].sender;
            time = data[index].updated_at;

            div = $('<div class="row"></div');
            div1 = $('<div class="col-lg-12"></div>');
            div2 = $('<div class="media"></div>');
            a = $('<a class="pull-left" href="#"></a');
            img = $('<img class="media-object img-circle avatar-chat" src={{url("images/home/face-2.jpg")}} alt="">');
            div3 = $('<div class="media-body"></div>');
            h4 = $('<h4 class="media-heading"></h4>');
            span = $('<span class="small pull-right"></span>');
            p = $('<p></p>');
            hr = $('<hr>');            

            p.html(msg);
            span.html(time);
            h4.html(sender);

            a.append(img);
            h4.append(span);
            div3.append(h4);
            div3.append(p);
            div2.append(a);
            div2.append(div3);
            div1.append(div2);
            div.append(div1);
            div.appendTo($('#bodyMsg'));
            hr.appendTo($('#bodyMsg'));
        }

    }
