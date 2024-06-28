@extends('administrator.index')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Item</h6>
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.item.add')}}">
                                <button class="btn btn-link">Item Baru</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id='tabelItem'>
                            <thead>
                                <tr>
                                    <th class='text-center' style='width: 75px;'>No.</th>
                                    <th>Item</th>
                                    <th>Kelompok</th>
                                    <th>Kondisi</th>
                                    <th>Status</th>
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
    let _tabelItemEl    =   $('#tabelItem');
    let _token          =   `{{csrf_token()}}`;

    let _options    =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   `{{route('admin.item.data')}}`,
            dataSrc :   'listItem'
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
                    let _kode       =   data.kode;
                    let _jenis      =   data.jenis;

                    return `<h6 class='mb-0'>${_nama} <span class='ml-1'><span class='badge badge-info'>${_jenis}</span></span></h6>
                            <p class='text-sm text-muted mb-0'><b>Kode</b> ${_kode}</p>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _kelompok   =   data.kelompok;
                    return _kelompok;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _kondisi   =   data.kondisi;
                    return _kondisi;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _status   =   data.status;
                    return _status;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _id             =   data.id;
                    let _encryptedId    =   data.encryptedId;
                    let _nama           =   data.nama;

                    let _buttonEdit     =   `<a href='{{url('admin/item/edit/${_encryptedId}')}}'>
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
    let _tabelItem =   _tabelItemEl.DataTable(_options);

    async function _delete(thisContext){
        let _el             =   $(thisContext);
        let _swalTitle      =   `Item`;
        let _itemId         =   _el.data('id');
        let _itemNama       =   _el.data('nama');

        let _konfirmasi     =   await konfirmasi(_swalTitle, `Apakah anda yakin akan menghapus item <b>${_itemNama}</b>?`);
        if(_konfirmasi){
            $.ajax({
                url     :   `{{route('admin.item.delete')}}`,
                type    :   'POST',
                data    :   {
                    _token,
                    item: _itemId
                },
                success :   async (decodedRFS) => {
                    let _status     =   decodedRFS.status;
                    let _message    =   decodedRFS.message;

                    let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
                    let _swalType       =   (_status)? 'success' : 'error';

                    await notifikasi(_swalTitle, _swalMessage, _swalType);
                    if(_status){
                        _tabelItem.ajax.reload();
                    }
                }
            })
        }
    }
</script>
@endsection