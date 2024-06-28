<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login | {{config('app.name')}}</title>

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
                <a href="{{route('admin.login')}}" class="h1">STIKES <b>Columbia Asia</b></a>
            </div>
            <div class="card-body">
                <p class="login-box-msg text-sm text-muted">Silahkan masuk untuk mengakses fitur Sistem Informasi</p>

                <form action="{{route('admin.login-process')}}" method="post" id='formLogin'>
                    @csrf
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fas fa-at"></span>
                            </div>
                        </div>
                        <input type="text" class="form-control" placeholder="Username"
                            name='username' required />
                    </div>
                    <div class="input-group mb-3" id='passwordInputGroup'>
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fas fa-key"></span>
                            </div>
                        </div>
                        <input type="password" name='password' class="form-control password"
                            placeholder="Password" required />
                        <div class="input-group-append">
                            <div class="input-group-text cp" onClick='togglePassword(this, "#passwordInputGroup")'>
                                <span class="fas fa-eye"></span>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block"><span class="fa fa-paper-plane mr-2"></span> Login</button>
                </form>
                <!-- /.social-auth-links -->
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.login-box -->

    @include('components/layout/administrator/javascript')
</body>
</html>
<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' rel='stylesheet' />

<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script src='{{asset("custom/js/toggle-password.js")}}'></script>
<script src='{{asset("custom/js/custom-alert.js")}}'></script>
<style type='text/css'>
    body {
        background-image: url({{asset('img/background.jpg')}});
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
<script language='Javascript'>
    let _formLogin  =   $('#formLogin');

    _formLogin.on('submit', async function(e) {
        e.preventDefault();
        await submitForm(this, async function(decodedRFS) {
            let _status     =   decodedRFS.status;
            let _message    =   decodedRFS.message;

            if(!_status){
                await notifikasi('Autentikasi', _message ?? 'Gagal!', 'error');
            }else{
                location.href   =   `{{route('admin.dashboard')}}`;
            }
        });
    });
</script>