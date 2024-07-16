@extends('administrator.index')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Riwayat Peminjaman</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class='mb-3'><b>Filter</b></h5>
                    <form class="row" id='formFilter'>
                        <div class="form-group col-lg-3">
                            <label for="peminjam">Peminjam</label>
                            <select name="peminjam" id="peminjam" class="form-control">
                                <option value="">-- Semua Peminjam --</option>
                                @foreach($listPeminjam as $peminjam)
                                    <option value="{{$peminjam->npm}}">{{$peminjam->npm}} | {{$peminjam->nama}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="statusPeminjaman">Status & Rentang Waktu Peminjaman</label>
                            <select name="statusPeminjaman" id="statusPeminjaman" class="form-control">
                                <option value="">-- Semua Status Peminjaman --</option>
                                @foreach($listStatusPeminjaman as $statusPeminjamanCode => $statusPeminjamanName)
                                    <option value="{{$statusPeminjamanCode}}">{{$statusPeminjamanName}}</option>
                                @endforeach
                            </select>
                        </div>
                    </form>
                    <button class="btn btn-success" id='buttonFilter' name='buttonFilter'
                        onClick='_filter(this)'>Filter</button>
                    <hr />
                    <div class="table-responsive">
                        <table class="table table-striped table-sm table-bordered" id='tabelRiwayatPeminjaman'>
                            <thead>
                                <tr>
                                    <th class='text-center vam' rowspan='2' style='width: 35px;'>No.</th>
                                    <th rowspan='2' class='vam' style='width: 100px;'>Nomor</th>
                                    <th rowspan='2' class='vam' style='width: 250px;'>Peminjam</th>
                                    <th rowspan='2' class='vam' style='width: 100px;'>Status</th>
                                    <th colspan='3' class='text-center vam' style='width: 32.5%;'>Tanggal</th>
                                    <th rowspan='2' class='text-center vam' style='width: 50px;'>Act</th>
                                </tr>
                                <tr>
                                    <th>Peminjaman</th>
                                    <th>Distribusi</th>
                                    <th>Pengembalian</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script language='Javascript' src='{{asset("admin-lte/plugins/datatables/jquery.dataTables.min.js")}}'></script>
<script language='Javascript' src='{{asset("admin-lte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js")}}'></script>
<link rel='stylesheet' href='{{asset("admin-lte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css")}}' />

<script src='{{asset("admin-lte/plugins/select2/js/select2.min.js")}}'></script>
<link rel="stylesheet" href="{{asset('admin-lte/plugins/select2/css/select2.min.css')}}" />
<link rel="stylesheet" href="{{asset('admin-lte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}" />

<script src='{{asset("custom/js/date-converter.js")}}'></script>

<script language='Javascript'>
    let _url    =   `{{route('admin.pinjam.peminjaman-data')}}`;

    let _tabelRiwayatPeminjamanEl   =   $('#tabelRiwayatPeminjaman');
    let _peminjam                   =   $('#peminjam');
    let _statusPeminjaman           =   $('#statusPeminjaman');
    let _formFilter                 =   $('#formFilter');
    let _buttonFilter               =   $('#buttonFilter');

    let _options    =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   _url,
            dataSrc :   'listRiwayatPeminjaman'
        },
        columns: [
            {
                data: null,
                render: function(data, type, row, meta) {
                    return `<p class='mb-0 text-center'><b>${data.nomorUrut}.</b></p>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _nomor      =   data.nomor;

                    return `<h6 class='mb-0'>${_nomor}</h6>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _peminjam           =   data.peminjam;
                    let _peminjamNama       =   _peminjam.nama;
                    let _peminjamUsername   =   _peminjam.npm;

                    return `<h6 class='mb-1'>${_peminjamNama}</h6>
                            <p class='text-sm text-muted mb-0'><b>NPM</b> ${_peminjamUsername}</p>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _distributedAt      =   data.distributedAt;
                    let _returnedAt         =   data.returnedAt;
                    let _sudahDistribusi    =   _distributedAt != null;
                    let _sudahPengembalian  =   _returnedAt != null;

                    let _statusHTML                 =   `<span class='badge badge-info'>Menunggu Proses Distribusi</span>`;
                    if(_sudahDistribusi){
                        _statusHTML                 =   `<span class='badge badge-info'>Sedang Peminjaman</span>`;
                    }

                    if(_sudahPengembalian){
                        _statusHTML                 =   `<span class='badge badge-success'>Sudah Pengembalian</span>`;
                    }
                    return `${_statusHTML}`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _createdAt      =   data.createdAt;

                    return `${convertDateTime(_createdAt)}`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _distributedAt      =   data.distributedAt;
                    let _sudahDistribusi  =   _distributedAt != null;

                    let _distributedAtHTML =   `<i class='text-sm'>-</i>`;
                    if(_sudahDistribusi){
                        _distributedAtHTML =   `${convertDateTime(_distributedAt)}`;
                    }

                    return `${_distributedAtHTML}`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _returnedAt         =   data.returnedAt;
                    let _sudahPengembalian  =   _returnedAt != null;

                    let _returnedAtHTML =   `<i class='text-sm'>-</i>`;
                    if(_sudahPengembalian){
                        _returnedAtHTML =   `${convertDateTime(_returnedAt)}`;
                    }

                    return `${_returnedAtHTML}`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _id                     =   data.id;
                    let _encryptedIdPeminjaman  =   data.encryptedIdPeminjaman;
                    let _returnedAt             =   data.returnedAt;
                    let _distributedBy          =   data.distributedBy;

                    let _sudahPengembalian      =   _returnedAt != null;
                    let _sudahDidistribusikan   =   _distributedBy != null;

                    let _button     =   `<a href='{{url('admin/pinjam/distribusi')}}/${_encryptedIdPeminjaman}'>
                                            <button class='btn btn-primary btn-sm' title='Distribusi'>
                                                Distribusi
                                            </button>
                                        </a>`;
                    if(_sudahDidistribusikan){
                        _button     =  `<a href='{{route('admin.pinjam.pengembalian')}}/${_encryptedIdPeminjaman}'>
                                            <button class='btn btn-success btn-sm' title='Pengembalian'>
                                                Pengembalian
                                            </button>
                                        </a>`; 
                    }
                                                
                    if(_sudahPengembalian){
                        _button     =   `<a href='{{route('admin.pinjam.pengembalian')}}/${_encryptedIdPeminjaman}'>
                                            <button class='btn btn-primary btn-sm' title='Detail Peminjaman'>
                                                Detail
                                            </button>
                                        </a>`;
                    }

                    let _actionHTML         =   `<div class='text-center'>
                                                    ${_button}
                                                </div>`;

                    return _actionHTML;
                }
            }
        ]
    }
    let _tabelRiwayatPeminjaman =   _tabelRiwayatPeminjamanEl.DataTable(_options);

    async function _filter(thisContext){
        let _el     =   $(thisContext);
        let _selectedStatusPeminjaman   =   _statusPeminjaman.val();
        let _selectedPeminjam           =   _peminjam.val();
        let _filterParameter            =   _formFilter.serialize();
        let _newAjaxURL                 =   `${_url}?${_filterParameter}`;

        _tabelRiwayatPeminjaman.ajax.url(_newAjaxURL).load();
    }

    $('#peminjam').select2({
        theme: 'bootstrap4'
    });
</script>
@endsection