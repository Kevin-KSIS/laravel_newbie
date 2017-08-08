import Echo from "laravel-echo"

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: env('PUSHER_APP_KEY'),
    cluster: env('CLUSTER'),
    encrypted: true
});