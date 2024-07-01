@extends('user.index')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Pengajuan Peminjaman</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h6 class='mb-3'>Form Pengajuan Peminjaman</h6>
                    <form action="{{route('user.pinjam.save')}}" method='post' id='formAddPengajuan' onSubmit='_submit(this, event)'>
                        @csrf
                        <div class="table-responsive">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <select name="listItems" id="listItems" class="form-control" onChange='_addItem(this)'>
                                        <option value="">-- Pilih --</option>
                                        @foreach($listItems as $item)
                                            <option value="{{$item->id}}" data-detail='{{json_encode($item)}}'>{{$item->nama}}</option>
                                        @endforeach
                                    </select>
                                    <div class="input-group-append">
                                        <button class="btn btn-success" type="button" onClick='_addItem(this)'>
                                            <span class="fa fa-plus-circle"></span> Tambah Item
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-bordered mt-3" id='tableItem'>
                                <thead>
                                    <tr>
                                        <th class='text-center' style='width: 100px;'>Act</th>
                                        <th class='text-left'>Nama</th>
                                        <th class='text-left' style='width: 350px;'>Jenis</th>
                                        <th class='text-left' style='width: 350px;'>Kelompok</th>
                                    </tr>
                                </thead>
                                <tbody id='listItemPinjam'></tbody>
                            </table>
                        </div>
                        <hr />
                        <button class="btn btn-success" id="buttonSubmit" type='submit'><span class="fa fa-paper-plane mr-2"></span> Ajukan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' />

<script src='{{asset("admin-lte/plugins/select2/js/select2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/select2/css/select2.min.css")}}' />
<link rel="stylesheet" href='{{asset("admin-lte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css")}}' />

<script src='{{asset("custom/js/custom-alert.js")}}'></script>
<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script language='Javascript'>
    let _listItems          =   $('#listItems');
    let _listItemPinjam     =   $('#listItemPinjam');

    $('#listItems').select2({
        theme: 'bootstrap'
    });

    let _selectedItems     =   [];
    async function _addItem(thisContext) {
        let _selectedItem      =   _listItems.find(':selected');
        let _selectedItemId    =   _selectedItem.val();
        let _selectedItemName  =   _selectedItem.text();

        let _detailItem     =   _selectedItem.data('detail');

        if(_selectedItemId != ''){
            let _swalTitle  =   'Penambahan Item';

            if(!_selectedItems.includes(_selectedItemId)){
                let _itemNama       =   _detailItem.nama;
                let _itemKode       =   _detailItem.kode;
                let _itemJenis      =   _detailItem.jenis;
                let _itemKelompok   =   _detailItem.kelompok;

                let _listItemHTML  =   `<tr class='item' data-item-id='${_selectedItemId}'>
                                            <td class='text-center vam'>
                                                <span class='fa fa-trash text-danger cp'
                                                    onClick='_deleteItem(this)'></span>
                                            </td>
                                            <td class='vam'>
                                                <h6 class='mb-0'>${_itemNama}</h6>
                                                <span class='text-sm text-muted'><b>Kode</b> ${_itemKode}</span>
                                                <input type='hidden' name='item[]' value='${_selectedItemId}' />
                                            </td>
                                            <td class='vam text-left'>${_itemJenis}</th>
                                            <td class='vam text-left'>${_itemKelompok}</td>
                                        </tr>`;

                _listItemPinjam.append(_listItemHTML);
                _selectedItems.push(_selectedItemId);
            }else{
                await notifikasi(_swalTitle, `Item sudah dipilih!`, 'warning');
            }
        }
    }

    async function _deleteItem(thisContext){
        let _el         =   $(thisContext);
        let _parent     =   _el.parents('.item');

        let _deleteditemId    =   _parent.data('itemId');
        _selectedItems =   _selectedItems.filter((selecteditemId) => selecteditemId != _deleteditemId);

        _parent.remove();
    }
    async function _submit(thisContext, event){
        event.preventDefault();
        await submitForm(thisContext, async (decodedRFS) => {
            let _status     =   decodedRFS.status;
            let _message    =   decodedRFS.message;

            let _swalTitle      =   `Item`;
            let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
            let _swalType       =   (_status)? 'success' : 'error';
            
            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                location.href   =   `{{route('user.pinjam')}}`;
            }
        });
    }
</script>
@endsection