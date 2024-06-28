@extends('administrator.index')

@section('content')
@php
    $pinjamId           =   $pinjam->id;
    $pinjamNomor        =   $pinjam->nomor;
    $pinjamCreatedAt    =   $pinjam->createdAt;
    $pinjamReturnedAt   =   $pinjam->returnedAt;

    $peminjam   =   $pinjam->peminjam()->select(['nama', 'npm'])->first();

    $pinjamItems    =   $pinjam->items;

    $sudahPengembalian  =   !empty($pinjamReturnedAt);
@endphp
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
                    @if($sudahPengembalian)
                        <div class="alert alert-success">Peminjaman ini <b>#{{$pinjamNomor}}</b> sudah dikembalikan!</div>
                    @endif
                    <h5 class='mb-1'><b>Detail Peminjaman</b></h5>
                    <div class="table-responsive">
                        <table class="table table-sm table-borderless">
                            <tr>
                                <td style='width: 150px;' class='text-left'>Nomor</td>
                                <td>{{$pinjamNomor}}</td>
                            </tr>
                            <tr>
                                <td style='width: 150px;' class='text-left'>Tanggal</td>
                                <td><b class='text-info'>{{formattedDateTime($pinjamCreatedAt)}}</b></td>
                            </tr>
                            <tr>
                                <td style='width: 150px;' class='text-left'>Diajukan Oleh</td>
                                <td>
                                    @if(!empty($peminjam))
                                        <h6 class='mb-1'>{{$peminjam->nama}}</h6>
                                        <p class='text-sm text-muted mb-0'><b>NPM</b> {{$peminjam->npm}}</p>
                                    @else
                                        <i class='text-sm text-muted'>Peminjam tidak ditemukan!</i>
                                    @endif
                                </td>
                            </tr>
                            @if($sudahPengembalian)
                                @php
                                    $dateDiff   =   date_diff(date_create($pinjamCreatedAt), date_create($pinjamReturnedAt));
                                @endphp
                                <tr>
                                    <td style='width: 150px;' class='text-left'>Pengembalian</td>
                                    <td>Dikembalikan pada <b class='text-primary'>{{formattedDateTime($pinjamReturnedAt)}}</b></td>
                                </tr>
                                <tr>
                                    <td style='width: 150px;' class='text-left'>Durasi Peminjaman</td>
                                    <td><b class='text-primary'>{{$dateDiff->d}} Hari</b> <small class='text-muted'>{{$dateDiff->h}} Jam {{$dateDiff->i}} Menit</small></td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    <br />
                    <form action="{{route('admin.pinjam.proses-pengembalian')}}" method='post' id="formPengembalian"
                        onSubmit='_onSubmit(this, event)'>
                        @csrf
                        <input type="hidden" name="idPeminjaman" value='{{$pinjamId}}' />
                        <h5 class='mb-3'><b>Item Peminjaman</b></h5>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class='vam text-center' style='width: 50px;'>No.</th>
                                        <th class='vam text-left'>Item</th>
                                        <th class='vam text-left' style='width: 250px;'>Kondisi Peminjaman</th>
                                        <th class='vam text-left' style='width: 250px;'>Kondisi Pengembalian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($pinjamItems as $pinjamItem)
                                        @php
                                            $pinjamItemItem             =   $pinjamItem->item;
                                            $pinjamItemKondisiPinjam    =   $pinjamItem->kondisiPinjam;
                                            $pinjamItemKondisiKembali   =   $pinjamItem->kondisiKembali;

                                            $item   =   $pinjamItem->item()->select(['nama', 'kode'])->first();
                                        @endphp
                                        <tr>
                                            <td class='vam text-center'><b>{{$loop->iteration}}</b></td>
                                            <td class='vam text-left'>
                                                @if(!empty($item))
                                                    <h6 class='mb-1'>{{$item->nama}}</h6>
                                                    <p class='text-sm mb-0 text-muted'><b>Kode</b> {{$item->kode}}</p>
                                                    <input type="hidden" name="item[]" value='{{$pinjamItemItem}}' />
                                                @else
                                                    <i class='text-sm text-muted'>Item tidak ditemukan!</i>
                                                @endif
                                            </td>
                                            <td class='vam text-left'>{{$pinjamItemKondisiPinjam}}</td>
                                            <td class='vam text-left'>
                                                @if(!$sudahPengembalian)
                                                <select name="kondisiKembali[]" class="form-control kondisi-kembali" required>
                                                    @foreach($listKondisi as $kondisi)
                                                        @php
                                                            $kondisiId    =   $kondisi['id'];
                                                            $kondisiNama  =   $kondisi['nama'];
                                                        @endphp
                                                        <option value="{{$kondisiId}}">{{$kondisiNama}}</option>
                                                    @endforeach
                                                </select>
                                                @else
                                                    <span class="badge badge-{{($pinjamItemKondisiKembali == 'bagus')? 'success' : 'danger'}}">
                                                        {{$pinjamItemKondisiKembali}}
                                                    </span>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            @if(!$sudahPengembalian)
                            <hr />
                            <button class="btn btn-success" id="buttonSubmit" type='submit'>Proses Pengembalian</button>
                            @endif
                        </div>
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

<script language='Javascript'>
    async function _onSubmit(thisContext, event){
        event.preventDefault();

        await submitForm(thisContext, async (decodedRFS) => {
            let _status     =   decodedRFS.status;
            let _message    =   decodedRFS.message;

            let _swalTitle      =   `Pengembalian`;
            let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
            let _swalType       =   (_status)? 'success' : 'error';
            
            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                location.reload();
            }
        });
    }
</script>
@endsection