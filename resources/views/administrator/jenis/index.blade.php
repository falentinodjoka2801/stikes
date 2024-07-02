@extends('administrator.index')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Jenis</h6>
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.jenis.add')}}">
                                <button class="btn btn-link">Jenis Baru</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id='tabelJenis'>
                            <thead>
                                <tr>
                                    <th class='text-center' style='width: 75px;'>No.</th>
                                    <th>Jenis</th>
                                    <th class='text-center' style='width: 100px;'>Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
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

<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' />
<script src='{{asset("custom/js/custom-alert.js")}}'></script>

<script language='Javascript'>
    let _tabelJenisEl    =   $('#tabelJenis');
    let _token          =   `{{csrf_token()}}`;

    let _options    =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   `{{route('admin.jenis.data')}}`,
            dataSrc :   'listJenis'
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
                    let _nama       =   data.nama;
                    let _keterangan =   data.keterangan;

                    let _keteranganHTML     =   `<i class='text-sm text-muted'>Tanpa Keterangan</i>`;
                    if(_keterangan != null){
                        _keteranganHTML =   `<p class='text-sm text-muted mb-0'>${_keterangan}</p>`;
                    }

                    return `<h6 class='mb-0'>${_nama}</h6>
                            ${_keteranganHTML}`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _id             =   data.id;
                    let _encryptedId    =   data.encryptedId;
                    let _nama           =   data.nama;

                    let _buttonEdit     =   `<a href='{{url('admin/jenis/edit/${_encryptedId}')}}'>
                                                <span class='cp fa fa-pen text-warning mr-1'></span>
                                            </a>`;
                    let _buttonDelete   =   `<span class='cp fa fa-trash text-danger ml-1' onClick='_delete(this)'
                                                data-id='${_id}' data-nama='${_nama}'></span>`;

                    let _actionHTML     =   `<div class='text-center'>
                                                ${_buttonEdit} ${_buttonDelete}
                                            </div>`;
                    return `${_actionHTML}`;
                }
            }
        ]
    }
    let _tabelJenis =   _tabelJenisEl.DataTable(_options);

    async function _delete(thisContext){
        let _el             =   $(thisContext);
        let _swalTitle      =   `Jenis`;
        let _jenisId        =   _el.data('id');
        let _jenisNama      =   _el.data('nama');

        let _konfirmasi     =   await konfirmasi(_swalTitle, `Apakah anda yakin akan menghapus jenis <b>${_jenisNama}</b>?`);
        if(_konfirmasi){
            $.ajax({
                url     :   `{{route('admin.jenis.delete')}}`,
                type    :   'POST',
                data    :   {
                    _token,
                    jenis: _jenisId
                },
                success :   async (decodedRFS) => {
                    let _status     =   decodedRFS.status;
                    let _message    =   decodedRFS.message;

                    let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
                    let _swalType       =   (_status)? 'success' : 'error';

                    await notifikasi(_swalTitle, _swalMessage, _swalType);
                    if(_status){
                        _tabelJenis.ajax.reload();
                    }
                }
            })
        }
    }
</script>
@endsection