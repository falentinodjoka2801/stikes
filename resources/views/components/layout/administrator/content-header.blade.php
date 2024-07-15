@php
    if(!isset($pagePath)){
        $pagePath   =   [];
    }
@endphp
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                @if(!empty($pageTitle))
                    <h1 class="m-0">{{$pageTitle}}</h1>
                @endif
                @if(!empty($pageDesc))
                    <p class="text-sm text-muted mb-0">{{$pageDesc}}</p>
                @endif
            </div><!-- /.col -->
            <div class="col-sm-6">
                @if(count($pagePath))
                    <ol class="breadcrumb float-sm-right">
                        @foreach($pagePath as $path)
                            @php
                                $active     =   ($loop->last)? 'active' : '';
                            @endphp
                            @if($loop->first)
                                <li class="breadcrumb-item {{$active}}"><a href=''>{{$path}}</a></li>
                            @else
                                <li class="breadcrumb-item {{$active}}">{{$path}}</li>
                            @endif
                        @endforeach
                    </ol>
                @endif
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->
