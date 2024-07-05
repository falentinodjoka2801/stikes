@php
    $session = request()->session();
    $administrator = $session->get('administrator');

    $administratorNama = $administrator->nama;
    $administratorUsername = $administrator->username;

    $page   =   request()->segment(2);
@endphp
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('admin.dashboard')}}" class="brand-link">
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
                <h5 class="d-block text-white mb-1 mt-0">{{$administratorNama}}</h5>
                <p class="text-sm text-white mb-0"><span style='color: #f4f6f9 !important;'>{{$administratorUsername}}</span></p>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">Menu Utama</li>
                <li class="nav-item {{($page == 'jenis')? 'menu-is-opening menu-open' : ''}}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-ellipsis-v"></i>
                        <p>Jenis <i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview text-sm pl-3">
                        <li class="nav-item">
                            <a href="{{route('admin.jenis')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List Jenis</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('admin.jenis.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Jenis Baru</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item {{($page == 'item')? 'menu-is-opening menu-open' : ''}}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-ellipsis-v"></i>
                        <p>Item <i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview text-sm pl-3">
                        <li class="nav-item">
                            <a href="{{route('admin.item')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List Item</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('admin.item.add')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Item Baru</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('admin.item.stok')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Laporan Stok</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item {{($page == 'pinjam')? 'menu-is-opening menu-open' : ''}}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fa fa-random"></i>
                        <p>Pinjam & Kembali<i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview text-sm pl-3">
                        <li class="nav-item">
                            <a href="{{route('admin.pinjam.peminjaman')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Peminjaman</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('admin.pinjam.pengembalian')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Pengembalian</p>
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