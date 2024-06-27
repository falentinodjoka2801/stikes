<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lupa Password | {{config('app.name')}}</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('admin-lte/plugins/fontawesome-free/css/all.min.css')}}">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="{{asset('admin-lte/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('admin-lte/dist/css/adminlte.min.css')}}">
</head>

<body class="hold-transition login-page">
    <div class="body-overlay"></div>
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <a href="{{route('/')}}" class="h1">STIKES <b>Columbia Asia</b></a>
            </div>
            <div class="card-body">
                <p class="login-box-msg text-sm text-muted">Password baru akan dikirim ke email anda jika email atau NPM yang anda inputkan valid</p>

                <form action="{{route('/')}}" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fas fa-at"></span>
                            </div>
                        </div>
                        <input type="text" class="form-control" placeholder="Email atau NPM">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Proses</button>    
                </form>

                <p class="text-center mt-3 mb-0">
                    <a href="{{route('admin.login')}}">Login</a>
                </p>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.login-box -->

    @include('components/javascript')
</body>
</html>
<script src='{{asset("custom/js/toggle-password.js")}}'></script>
<style type='text/css'>
    body {
        background-image: url('img/background.jpg');
        background-position: center center;
        background-size: cover;
    }

    .body-overlay {
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, .4);
    }
</style>