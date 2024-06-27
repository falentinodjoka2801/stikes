<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Page Not Found</title>

    <link rel="stylesheet" href="{{asset('admin-lte/dist/css/adminlte.min.css')}}" />
</head>
<body class='vh-100 d-flex justify-content-center align-items-center'>
    <div class="w-100 text-center">
        <img src="{{asset('img/404.png')}}" alt="Page Not Found" class='not-found-image d-block m-auto' />
        <h5 class='mt-4 mb-2'>Page Not Found</h5>
        <p class="text-sm text-muted">Looks like the page you're looking for does not exist, please check the url or contact administrator for help</p>
    </div>
</body>
</html>
<style type='text/css'>
    .not-found-image{
        width: 100px;
        height: 100px;
    }
    body{
        background-image: url("{{asset('img/white-texture-background.jpg')}}");
        background-size: cover;
    }
</style>