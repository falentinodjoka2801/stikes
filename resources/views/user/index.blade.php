<!DOCTYPE html>
<html lang="en">
    @include('components/layout/user/head')
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
            @include('components/layout/user/navbar')

            @include('components/layout/user/sidebar')

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                @include('components/layout/user/content-header')

                <!-- Main content -->
                <section class="content">
                    @yield('content')
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            @include('components/layout/user/footer')
        </div>
        <!-- ./wrapper -->
    </body>
</html>