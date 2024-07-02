@extends('administrator.index')

@section('content')
@php
    $itemId     =   $item->id;
    $itemNama   =   $item->nama;

    $listItemDetail =   $item->items;
@endphp
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">{{$itemNama}}</h6>
                        </div>
                        <div class="col text-right">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4 pr-3 border-right">
                            <h5 class='mb-1'>Form Add Detail Item</h5>
                            <span class="text-sm text-muted">{{$itemNama}}</span>
                            <br />
                            <br />
                            <form action="{{route('admin.item.save-item')}}" id="formAddDetail" method='post' onSubmit='_submit(this, event)'>
                                @csrf
                                <input type="hidden" name="item" value='{{$itemId}}' />
                                <div class="form-group">
                                    <label for="detail">Barang/Item</label>
                                    <input type="text" class="form-control" id="detail" name='detail' placeholder="Barang" />
                                </div>
                                <div class="form-group">
                                    <label for="jumlah">Jumlah</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="jumlah" name='jumlah' placeholder="Jumlah" />
                                        <input type="text" class="form-control" id='satuan' name='satuan' placeholder="Satuan" value='pcs' />
                                    </div>
                                </div>
                                <hr />
                                <button class="btn btn-success" id="buttonSubmit" type='submit'>Simpan</button>
                            </form>
                        </div>
                        <div class="col-lg-8 pl-3">
                            <h5 class='mb-1'>List Detail Item</h5>
                            <span class="text-sm text-muted">{{$itemNama}}</span>
                            <br />
                            <br />
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered" id='tabelDetailItem'>
                                    <thead>
                                        <tr>
                                            <th class='text-center' style='width: 75px;'>No.</th>
                                            <th>Detail</th>
                                            <th style='width: 200px;' class='text-right'>Jumlah</th>
                                            <th style='width: 300px;'>Lainnya</th>
                                            <th class='text-center' style='width: 50px;'>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($listItemDetail as $itemDetail)
                                        @php
                                            $itemDetailId           =   $itemDetail->id;
                                            $itemDetailDetail       =   $itemDetail->detail;
                                            $itemDetailJumlah       =   $itemDetail->jumlah;
                                            $itemDetailSatuan       =   $itemDetail->satuan;
                                            $itemDetailCreatedAt    =   $itemDetail->createdAt;

                                            $creator        =   $itemDetail->creator()->select(['nama'])->first();
                                            $creatorNama    =   (!empty($creator))? $creator->nama : '-';
                                        @endphp
                                        <tr>
                                            <td class='text-center' style='width: 75px;'><b>{{$loop->iteration}}</b></td>
                                            <td>{{$itemDetail->detail}}</td>
                                            <td class='text-right'>{{$itemDetailJumlah}} {{$itemDetailSatuan}}</td>
                                            <td>
                                                <h6>Dibuat oleh <b>{{$creatorNama}}</b></h6>
                                                <p class='text-sm text-muted mb-0'>Pada {{formattedDateTime($itemDetailCreatedAt)}}</p>
                                            </td>
                                            <td class='text-center' style='width: 50px;'>
                                                <span class='cp fa fa-trash text-danger ml-1' onClick='_delete(this)'
                                                    data-id='{{$itemDetailId}}' data-nama='{{$itemDetailDetail}}'></span>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script language='Javascript'>
    let _tabelDetailItem    =   $('#tabelDetailItem');
    let _token              =   `{{csrf_token()}}`;

    _tabelDetailItem.DataTable();
    
    async function _submit(thisContext, event){
        event.preventDefault();
        await submitForm(thisContext, async (decodedRFS) => {
            let _status     =   decodedRFS.status;
            let _message    =   decodedRFS.message;

            let _swalTitle      =   `Detail Item`;
            let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
            let _swalType       =   (_status)? 'success' : 'error';
            
            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                location.reload();
            }
        });
    }
    
    async function _delete(thisContext){
        let _el             =   $(thisContext);

        let _swalTitle          =   `Detail Item`;
        let _detailItemId       =   _el.data('id');
        let _detailItemNama     =   _el.data('nama');

        let _konfirmasi     =   await konfirmasi(_swalTitle, `Apakah anda yakin akan menghapus <b>${_detailItemNama}</b>?`);
        if(_konfirmasi){
            $.ajax({
                url     :   `{{route('admin.item.delete-item')}}`,
                type    :   'POST',
                data    :   {
                    _token,
                    id: _detailItemId
                },
                success :   async (decodedRFS) => {
                    let _status     =   decodedRFS.status;
                    let _message    =   decodedRFS.message;

                    let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
                    let _swalType       =   (_status)? 'success' : 'error';

                    await notifikasi(_swalTitle, _swalMessage, _swalType);
                    if(_status){
                        location.reload();
                    }
                }
            })
        }
    }
</script>
@endsection