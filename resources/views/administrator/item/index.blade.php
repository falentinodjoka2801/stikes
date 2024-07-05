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
                    <h5 class='mb-3'><b>Filter</b></h5>
                    <div class="table-responsive">
                        <div class="form-group">
                            <label for="jenisItem">Jenis Item</label>
                            <select name="jenisItem" id="jenisItem" class="form-control">
                                <option value="">-- Jenis Item --</option>
                                @foreach($listJenis as $jenis)
                                    <option value="{{$jenis->id}}">{{$jenis->nama}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button class="btn btn-success" id='buttonFilter' name='buttonFilter'
                            onClick='_filter(this)'>Filter</button>
                    </div>
                    <hr />
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id='tabelItem'>
                            <thead>
                                <tr>
                                    <th rowspan='2' class='vam text-center' style='width: 75px;'>No.</th>
                                    <th rowspan='2' class='vam'>Item</th>
                                    <th colspan='2' class='vam text-center'>Quantity</th>
                                    <th rowspan='2' class='vam text-center' style='width: 100px;'>Action</th>
                                </tr>
                                <tr>
                                    <th class='text-center vam' style='width: 150px;'>Stok</th>
                                    <th class='text-center vam' style='width: 150px;'>Pinjam</th>
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
<script src='{{asset("admin-lte/plugins/numeral/numeral.js")}}'></script>

<script language='Javascript'>
    let _jenisItem      =   $('#jenisItem');
    let _tabelItemEl    =   $('#tabelItem');
    let _token          =   `{{csrf_token()}}`;
    let _url            =   `{{route('admin.item.data')}}`;

    let _options    =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   _url,
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
                    let _satuan         =   data.satuan;
                    let _quantityStok   =   data.quantityStok;

                    let _satuanHTML     =   ``;
                    if(_satuan != null){
                        _satuanHTML =   `<b>${_satuan}</b>`;
                    }

                    return `<div class='text-center'>${numeral(_quantityStok).format('0,0')} ${_satuanHTML}</div>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _satuan             =   data.satuan;
                    let _quantityPinjam     =   data.quantityPinjam;
                    
                    let _satuanHTML     =   ``;
                    if(_satuan != null){
                        _satuanHTML =   `<b>${_satuan}</b>`;
                    }
                    
                    return `<div class='text-center'>${numeral(_quantityPinjam).format('0,0')} ${_satuanHTML}</div>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _id             =   data.id;
                    let _encryptedId    =   data.encryptedId;
                    let _nama           =   data.nama;
                    let _hasDetail      =   data.hasDetail;

                    let _buttonEdit     =   `<a href='{{url('admin/item/edit/${_encryptedId}')}}'>
                                                <span class='cp fa fa-pen text-warning mr-1'></span>
                                            </a>`;

                    let _buttonDetail   =   (_hasDetail)? `<a href='{{url('admin/item/detail/${_encryptedId}')}}'>
                                                <span class='cp fa fa-list text-primary mx-1'></span>
                                            </a>` : '';


                    let _buttonDelete   =   `<span class='cp fa fa-trash text-danger ml-1' onClick='_delete(this)'
                                                data-id='${_id}' data-nama='${_nama}'></span>`;

                    let _actionHTML     =   `<div class='text-center'>
                                                ${_buttonEdit} ${_buttonDetail} ${_buttonDelete}
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

    async function _filter(thisContext){
        let _el     =   $(thisContext);
        let _selectedJenisItem      =   _jenisItem.val();
        let _newAjaxURL             =   `${_url}?jenis=${_selectedJenisItem}`;

        _tabelItem.ajax.url(_newAjaxURL).load();
    }
</script>
@endsection