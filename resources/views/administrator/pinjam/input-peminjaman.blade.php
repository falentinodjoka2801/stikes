@extends('administrator.index')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Pengembalian</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class='mb-1'><b>Pengembalian Peminjaman</b></h5>
                    <br />
                    <form action="{{route('admin.pinjam.proses-nomor-peminjaman')}}" method='post' id="formPilihPeminjaman">
                        @csrf
                        <div class="form-group">
                            <label for="nomorPeminjaman">Nomor Peminjaman</label>
                            <input type="text" class="form-control" name='nomorPeminjaman' id="nomorPeminjaman" placeholder="Nomor Peminjaman" />
                        </div>
                        <button class="btn btn-success" id="buttonSubmit" type='submit'>Pilih</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script language='Javascript' src='{{asset("admin-lte/plugins/datatables/jquery.dataTables.min.js")}}'></script>
<script language='Javascript' src='{{asset("admin-lte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js")}}'></script>
<link href='stylesheet' src='{{asset("admin-lte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css")}}' />

<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' />

<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script src='{{asset("custom/js/custom-alert.js")}}'></script>
@endsection