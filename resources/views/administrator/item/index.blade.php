@extends('administrator.index')

@section('content')

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalCetakQRCode" aria-hidden="true" id="modalCetakQRCode">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title">Cetak QR Code</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{route('admin.item.cetak-qrcode')}}" id="formCetakQRCode" type='post'>
                    <div class="form-group">
                        <label for="item">Item</label>
                        <select name="item[]" id="item" class="form-control"
                            multiple></select>
                    </div>
                    <button id="buttonSubmit" type="submit" class='btn btn-success'><span class="fa fa-print mr-1"></span> Print</button>
                </form>
            </div> 
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalAddStock" aria-hidden="true" id="modalAddStock">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title">Form Penambahan Stok</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                @include('administrator/item/form-add-stock', ['submitCallback' => '_loadDataItem'])
            </div> 
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-1">Item</h6>
                            <p class="text-sm mb-0 text-muted">List data master Item (Barang, Ruang, dsb)</p>
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.item.add')}}">
                                <button class="btn btn-success"><span class="fa fa-plus-circle mr-1"></span> Item Baru</button>
                            </a>
                            <button id="buttonCetakQRCode" class="btn btn-primary"
                                onClick='_cetakQRCode(this)'><span class="fa fa-qrcode mr-1"></span> Cetak QR Code</button>
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
                                    <th class='text-center vam' style='width: 175px;'>Stok/Tersedia</th>
                                    <th class='text-center vam' style='width: 175px;'>Pinjam/Terpakai</th>
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
<link rel='stylesheet' href='{{asset("admin-lte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css")}}' />

<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' />
<script src='{{asset("admin-lte/plugins/numeral/numeral.js")}}'></script>
<script src='{{asset("custom/js/custom-alert.js")}}'></script>
<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script src='{{asset("admin-lte/plugins/select2/js/select2.min.js")}}'></script>
<link rel="stylesheet" href="{{asset('admin-lte/plugins/select2/css/select2.min.css')}}" />
<link rel="stylesheet" href="{{asset('admin-lte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}" />

<script language='Javascript'>
    let _jenisItem      =   $('#jenisItem');
    let _tabelItemEl    =   $('#tabelItem');
    let _modalAddStock  =   $('#modalAddStock');
    let _token          =   `{{csrf_token()}}`;
    let _url            =   `{{route('admin.item.data')}}`;
    let _modalCetakQRCode   =   $('#modalCetakQRCode');
    let _item               =   $('#item');
    let _selectedItemsContainer     =   $('#selectedItemsContainer');

    _item.select2({
        dropdownParent: _modalCetakQRCode,
        placeholder: "Cari item di sini dengan nama item",
        theme: 'bootstrap4',
        language: {
            noResults: function() {
                return "Tidak ada data ditemukan";
            }
        },
        ajax: {
            url: "{{route('admin.item.data')}}",
            dataType: 'json',
            type: "GET",
            data: function (params) {
                return `search[value]=${params.term}`;
            },
            processResults: function (data, params) {
                params.current_page = params.current_page || 1;
                
                let _listItems  =   data.listItem;

                return {
                    results: $.map(_listItems, function (item) {
                        let _itemId     =   item.id;
                        let _itemNama   =   item.nama;

                        if(_itemNama == null){
                            _itemNama   =   `-`;
                        }

                        return {
                            text: `${_itemNama}`,
                            id: item.id
                        }
                        
                    })
                };
            },
            cache: true
        }
    });

    let _options    =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   _url,
            dataSrc :   'listItem'
        },
        createdRow: function(row, data, dataIndex){
            $(row).addClass('item');
            $(row).data('item', data);
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

                    return `<div class='item-detail-container' data-item='${JSON.stringify(data)}'>
                                <h6 class='mb-0'>${_nama} <span class='ml-1'><span class='badge badge-info'>${_jenis}</span></span></h6>
                                <p class='text-sm text-muted mb-0'><b>Kode</b> ${_kode}</p>
                            </div>`;
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

                    return `<div class='text-center'>
                                ${numeral(_quantityStok).format('0,0')} ${_satuanHTML}
                                <span class='ml-1 cp fa fa-plus-circle text-success' onClick='_addStock(this)'></span>
                            </div>`;
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

    async function _addStock(thisContext){
        let _el         =   $(thisContext);
        let _parent     =   _el.parents('.item');
        let _item       =   _parent.data('item');

        let _itemId     =   _item.id;
        let _itemName   =   _item.nama;
        let _itemSatuan =   _item.satuan;
    
        let _itemContainer  =   _modalAddStock.find('#itemContainer');
        let _itemSatuanEl   =   _modalAddStock.find('#itemSatuan');
        let _itemHTML       =   `<div class='form-group'>
                                    <label for='item'>Item</label>
                                    <h6>${_itemName}</h6>
                                    <input type='hidden' name='item' id='item' value='${_itemId}' />
                                </div>`;

        _itemSatuanEl.text(_itemSatuan);
        _itemContainer.html(_itemHTML);
        _modalAddStock.modal('show');
    }

    async function _loadDataItem(){
        _tabelItem.ajax.reload();
        _modalAddStock.find('form').trigger('reset');
    }
    async function _cetakQRCode(thisContext){
        _modalCetakQRCode.modal('show');
    }
    async function _printQRCode(thisContext, eventContext){
        eventContext.preventDefault();
        await submitForm(thisContext);
    }
</script>
@endsection