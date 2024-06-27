@php
    if(!isset($pageTitle)){
        $pageTitle  =   'Welcome';
    }
@endphp
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{$pageTitle}} | {{config('app.name')}}</title>

    @include('components/layout/administrator/javascript')
    
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('admin-lte/plugins/fontawesome-free/css/all.min.css')}}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{asset('admin-lte/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('admin-lte/dist/css/adminlte.min.css')}}">

    <link rel="shortcut icon" href="{{asset('img/icon.png')}}" />

    <style type='text/css'>
        .cp{
            cursor: pointer;
        }
        .vam{
            vertical-align: middle !important;
        }
        .img-50-50{
            width: 50px;
            height: 50px;
        }
        .img-100-100{
            width: 100px;
            height: 100px;
        }
        .img-150-150{
            width: 150px;
            height: 150px;
        }
        .of-cover{
            object-fit: cover;
        }
    </style>
</head>