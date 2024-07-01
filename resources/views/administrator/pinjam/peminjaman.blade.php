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
                    <div class="table-responsive">
                        <div class="form-group">
                            <label for="statusPeminjaman">Status Peminjaman</label>
                            <select name="statusPeminjaman" id="statusPeminjaman" class="form-control">
                                <option value="">-- Semua Status Peminjaman --</option>
                                @foreach($listStatusPeminjaman as $statusPeminjamanCode => $statusPeminjamanName)
                                    <option value="{{$statusPeminjamanCode}}">{{$statusPeminjamanName}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button class="btn btn-success" id='buttonFilter' name='buttonFilter'
                            onClick='_filter(this)'>Filter</button>
                    </div>
                    <hr />
                    <div class="table-responsive">
                        <table class="table table-striped table-sm table-bordered" id='tabelRiwayatPeminjaman'>
                            <thead>
                                <tr>
                                    <th class='text-center vam' rowspan='2' style='width: 75px;'>No.</th>
                                    <th rowspan='2' class='vam' style='width: 150px;'>Nomor</th>
                                    <th rowspan='2' class='vam' style='width: 250px;'>Peminjam</th>
                                    <th rowspan='2' class='vam' style='width: 100px;'>Status</th>
                                    <th colspan='2' class='text-center vam' style='width: 27.5%;'>Tanggal</th>
                                    <th rowspan='2' class='text-center vam' style='width: 50px;'>Act</th>
                                </tr>
                                <tr>
                                    <th>Peminjaman</th>
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
<link href='stylesheet' src='{{asset("admin-lte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css")}}' />

<script src='{{asset("custom/js/date-converter.js")}}'></script>

<script language='Javascript'>
    let _url    =   `{{route('admin.pinjam.peminjaman-data')}}`;

    let _tabelRiwayatPeminjamanEl    =   $('#tabelRiwayatPeminjaman');
    let _statusPeminjaman   =   $('#statusPeminjaman');
    let _buttonFilter   =   $('#buttonFilter');

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
                    let _returnedAt         =   data.returnedAt;
                    let _sudahPengembalian  =   _returnedAt != null;

                    let _statusHTML                 =   `<span class='badge badge-info'>Sedang Peminjaman</span>`;
                    let _tanggalPengambalianHTML    =   ``;
                    if(_sudahPengembalian){
                        _statusHTML                 =   `<span class='badge badge-success'>Sudah Pengembalian</span>`;
                        _tanggalPengambalianHTML    =   `<p class='text-sm text-muted mb-0'>Pengembalian pada <b>${convertDateTime(_returnedAt)}</b></p>`;
                    }
                    return `${_statusHTML} ${_tanggalPengambalianHTML}`;
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

                    let _sudahPengembalian      =   _returnedAt != null;

                    let _button     =  `<a href='{{route('admin.pinjam.pengembalian')}}/${_encryptedIdPeminjaman}'>
                                            <button class='btn btn-success btn-sm' title='Pengembalian'>
                                                Pengembalian
                                            </button>
                                        </a>`; 
                                                
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
        let _newAjaxURL                 =   `${_url}?statusPeminjaman=${_selectedStatusPeminjaman}`;

        _tabelRiwayatPeminjaman.ajax.url(_newAjaxURL).load();
    }
</script>
@endsection