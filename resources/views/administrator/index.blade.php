<!DOCTYPE html>
<html lang="en">
    @include('components/layout/administrator/head')
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
            @include('components/layout/administrator/navbar')

            @include('components/layout/administrator/sidebar')

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                @include('components/layout/administrator/content-header')

                <!-- Main content -->
                <section class="content">
                    @yield('content')
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            @include('components/layout/administrator/footer')
        </div>
        <!-- ./wrapper -->
    </body>
</html>