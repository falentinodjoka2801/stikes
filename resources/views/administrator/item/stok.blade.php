@extends('administrator.index')

@section('content')
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
                @include('administrator/item/form-add-stock')
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-5">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Laporan Stok Menipis</h6>
                        </div>
                        <div class="col text-right">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class='mb-3'><b>Item dengan Stok Menipis</b></h5>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id='tabelStokMenipis'>
                            <thead>
                                <tr>
                                    <th class='vam text-center' style='width: 75px;'>No.</th>
                                    <th class='vam'>Item</th>
                                    <th class='vam text-right'>Stok Minimum</th>
                                    <th class='vam text-right'>Stok Saat Ini</th>
                                    <th class='vam text-center'>Act</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(count($listStokMenipis) >= 1)
                                    @foreach($listStokMenipis as $stokMenipis)
                                        @php
                                            $item               =   $stokMenipis['item'];
                                            $itemStokSaatIni    =   $stokMenipis['stokSaatIni'];

                                            $itemNama           =   $item->nama;
                                            $itemKode           =   $item->kode;
                                            $itemSatuan         =   $item->satuan;
                                            $itemStokMinimum    =   $item->stokMinimum;

                                        @endphp
                                        <tr class='stok-minimum' data-item='{{json_encode($item)}}'>
                                            <td class='vam text-center'><b>{{$loop->iteration}}</b></td>
                                            <td class='vam'>
                                                <h6 class='mb-1'>{{$itemNama}}</h6>
                                                <p class='text-sm text-muted mb-0'><b>Kode</b> {{$itemKode}}</p>
                                            </td>
                                            <td class='vam text-right'><b class='text-info'>{{number_format($itemStokMinimum)}} {{$itemSatuan}}</b></td>
                                            <td class='vam text-right'><b class='text-danger'>{{number_format($itemStokSaatIni)}} {{$itemSatuan}}</b></td>
                                            <td class='vam text-center'>
                                                <button class="btn btn-sm btn-success" onClick='_addStock(this)'>
                                                    <span class="fa fa-plus-circle mr-1"></span> Stok
                                                </button>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Laporan Stok</h6>
                        </div>
                        <div class="col text-right">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class='mb-3'><b>Filter</b></h5>
                    <form id="formFilter">
                        <div class="row">
                            <div class="form-group col-lg-7">
                                <label for="item">Item</label>
                                <select name="item" id="item" class="form-control">
                                    <option value="">-- Item --</option>
                                    @foreach($listItems as $item)
                                        <option value="{{$item->id}}">{{$item->kode}} | {{$item->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-lg-5">
                                <label for="rentangWaktu">Rentang Waktu</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" name='rentangAwal' />
                                    <div class="input-group-text">s/d</div>
                                    <input type="date" class="form-control" name='rentangAkhir' />
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-success" id='buttonFilter' name='buttonFilter' type='button'
                            onClick='_filter(this, event)'>Filter</button>
                    </form>
                    <hr />
                    <div class="row">
                        <div class="col-lg-8">
                            <h5 class='mb-3'><b>Rekapan</b></h5>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered" id='tabelRekapanStok'>
                                    <thead>
                                        <tr>
                                            <th class='vam text-center' style='width: 75px;'>No.</th>
                                            <th class='vam'>Item</th>
                                            <th class='vam'>Stok Terakhir</th>
                                            <th class='vam text-right'>In</th>
                                            <th class='vam text-right'>Out</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <br />
                    <h5 class='mb-3'><b>Rincian</b></h5>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id='tabelHistoryStok'>
                            <thead>
                                <tr>
                                    <th class='vam text-center' style='width: 75px;'>No.</th>
                                    <th class='vam'>Item</th>
                                    <th class='vam' style='width: 250px;'>Tanggal</th>
                                    <th class='vam text-right' style='width: 150px;'>Quantity</th>
                                    <th class='vam text-left'>Keterangan</th>
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
<script src='{{asset("admin-lte/plugins/select2/js/select2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/select2/css/select2.min.css")}}' />
<link rel="stylesheet" href='{{asset("admin-lte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css")}}' />

<script src='{{asset("custom/js/date-converter.js")}}'></script>
<script src='{{asset("admin-lte/plugins/numeral/numeral.js")}}'></script>
<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script src='{{asset("custom/js/custom-alert.js")}}'></script>

<script language='Javascript'>
    let _tabelHistoryStokEl     =   $('#tabelHistoryStok');
    let _tabelRekapanStokEl     =   $('#tabelRekapanStok');
    let _tabelStokMenipisEl     =   $('#tabelStokMenipis');
    let _item                   =   $('#item');
    let _formFilter             =   $('#formFilter');
    let _modalAddStock          =   $('#modalAddStock');

    let _token                  =   `{{csrf_token()}}`;
    let _urlRincian             =   `{{route('admin.item.stok-data')}}`;
    let _urlRekapan             =   `{{route('admin.item.rekap-stok-data')}}`;


    $('#item').select2({
        theme: 'bootstrap4'
    });

    let _tabelStokMenipisOptions    =   {
        language: {
            emptyTable: `Belum ada barang dengan stok menipis!`
        }
    };   
    let _tabelStokMenipis           =   _tabelStokMenipisEl.DataTable(_tabelStokMenipisOptions);

    let _rekapanOptions     =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   _urlRekapan,
            dataSrc :   'listRekapanStok'
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
                    let _item       =   data.item;
                    let _nama       =   _item.nama;
                    let _kode       =   _item.kode;
                    let _satuan     =   _item.satuan;

                    return `<h6 class='mb-0'>${_nama}</h6>
                            <p class='text-sm text-muted mb-0'><b>Kode</b> ${_kode}</p>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _item       =   data.item;
                    let _satuan     =   _item.satuan;
                    let _stok       =   data.stok;

                    return `<b class='text-success'>${numeral(_stok).format('0,0')} ${_satuan}</b>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _item           =   data.item;
                    let _satuan         =   _item.satuan;
                    let _stokIn         =   data.stokIn;

                    return `<div class='text-success text-right'>${numeral(_stokIn).format('0,0')} ${_satuan}</div>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _item           =   data.item;
                    let _satuan         =   _item.satuan;
                    let _stokOut        =   data.stokOut;

                    return `<div class='text-danger text-right'>${numeral(_stokOut).format('0,0')} ${_satuan}</div>`;
                }
            }
        ]
    }
    let _tabelRekapanStok   =   _tabelRekapanStokEl.DataTable(_rekapanOptions);
    
    let _historyOptions    =   {
        processing: true,
        serverSide: true,
        ajax: {
            url     :   _urlRincian,
            dataSrc :   'listHistoryStok'
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
                    let _item       =   data.item;
                    let _nama       =   _item.nama;
                    let _kode       =   _item.kode;

                    return `<h6 class='mb-0'>${_nama}</h6>
                            <p class='text-sm text-muted mb-0'><b>Kode</b> ${_kode}</p>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _createdAt       =   data.createdAt;

                    return `${convertDateTime(_createdAt)}`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _item               =   data.item;
                    let _satuan             =   _item.satuan;
                    let _quantity           =   data.quantity;
                    let _kategoriTransaksi  =   data.kategori;

                    let _satuanHTML             =   ``;
                    let _className              =   `text-success`;
                    let _kategoriTransaksiHTML  =   ``;

                    if(_satuan != null){
                        _satuanHTML =   `<b>${_satuan}</b>`;
                    }

                    if(_quantity <= 0){
                        _className      =   `text-danger`;
                    }

                    if(_kategoriTransaksi != null){
                        let _kategoriTransaksiNama  =   _kategoriTransaksi.nama;
                        let _kategoriTransaksiInOut =   _kategoriTransaksi.inOut;

                        let _in     =   `{{\App\Models\KategoriTransaksi::$in}}`;
                        let _out    =   `{{\App\Models\KategoriTransaksi::$out}}`;

                        _kategoriTransaksiHTML      =   `<span class='badge badge-${((_kategoriTransaksiInOut == _in)? 'success' : 'danger')}'>${_kategoriTransaksiNama}</span>`;
                    }

                    return `<div class='text-right'>
                                <p class='mb-1'>
                                    <b class='${_className}'>${numeral(_quantity).format('0,0')} ${_satuanHTML}</b>
                                </p>
                                ${_kategoriTransaksiHTML}
                            </div>`;
                }
            },
            {
                data: null,
                render: function(data, type, row, meta) {
                    let _keterangan         =   data.keterangan;
                    
                    let _keteranganHTML     =   `<i class='text-sm text-muted'>Tanpa Keterangan</i>`;
                    if(_keterangan != null){
                        _keteranganHTML =   `${_keterangan}`;
                    }
                    
                    return `<div class='text-left'>${_keteranganHTML}</div>`;
                }
            }
        ]
    }
    let _tabelHistoryStok =   _tabelHistoryStokEl.DataTable(_historyOptions);

    async function _filter(thisContext, event){
        event.preventDefault();

        let _el     =   $(thisContext);
        let _serialize              =   _formFilter.serialize();
        let _newAjaxRekapanURL      =   `${_urlRekapan}?${_serialize}`;
        let _newAjaxRincianURL      =   `${_urlRincian}?${_serialize}`;

        _tabelHistoryStok.ajax.url(_newAjaxRincianURL).load();
        _tabelRekapanStok.ajax.url(_newAjaxRekapanURL).load();
    }

    async function _addStock(thisContext){
        let _el         =   $(thisContext);
        let _parent     =   _el.parents('.stok-minimum');
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
</script>
@endsection