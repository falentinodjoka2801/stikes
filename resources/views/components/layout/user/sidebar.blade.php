@php
$session = request()->session();
$user = $session->get('user');

$userNama = $user->nama;
$userUsername = $user->npm;
@endphp
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('/')}}" class="brand-link">
        <img src="{{asset('img/laravel.svg')}}" alt="STIKES" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">STIKES</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{asset('admin-lte/dist/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info pt-0 pl-3">
                <h5 class="d-block text-white mb-1 mt-0">{{$userNama}}</h5>
                <p class="text-sm text-white mb-0"><span style='color: #f4f6f9 !important;'>{{$userUsername}}</span></p>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">Menu Utama</li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                        Peminjaman
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('user.pinjam')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Riwayat Peminjaman</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('user.pinjam.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Pengajuan Peminjaman</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>