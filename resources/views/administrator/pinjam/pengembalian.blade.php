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
                                        <th class='vam text-right' style='width: 150px'>Jumlah Distribusi</th>
                                        <th class='vam text-left' style='width: 350px;'>Jumlah Pengembalian</th>
                                        <th class='vam text-left'>Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($pinjamItems as $pinjamItem)
                                        @php
                                            $pinjamItemItem                 =   $pinjamItem->item;
                                            $pinjamItemQuantityKembali      =   $pinjamItem->quantityKembali;
                                            $pinjamItemQuantityDistribusi   =   $pinjamItem->quantityDistribusi;
                                            $pinjamItemKeterangan           =   $pinjamItem->keterangan;
                                            $pinjamItemKembaliBagus         =   $pinjamItem->quantityKembaliBagus;
                                            $pinjamItemKembaliRusak         =   $pinjamItem->quantityKembaliRusak;

                                            $item                       =   $pinjamItem->item()->select(['nama', 'kode', 'jenis', 'satuan'])->first();
                                            $itemNama                   =   $item->nama;
                                            $itemKode                   =   $item->kode;
                                            $itemJenis                  =   $item->jenis;
                                            $itemSatuan                 =   $item->satuan;

                                            $itemHasStock   =   in_array($itemJenis, $itemHaveStock);
                                        @endphp
                                        <tr>
                                            <td class='vam text-center'><b>{{$loop->iteration}}</b></td>
                                            <td class='vam text-left'>
                                                @if(!empty($item))
                                                    <h6 class='mb-1'>{{$itemNama}}</h6>
                                                    <p class='text-sm mb-0 text-muted'><b>Kode</b> {{$itemKode}}</p>
                                                    <input type="hidden" name="item[]" value='{{$pinjamItemItem}}' />
                                                @else
                                                    <i class='text-sm text-muted'>Item tidak ditemukan!</i>
                                                @endif
                                            </td>
                                            <td class="vam text-right">
                                                <b>{{number_format($pinjamItemQuantityDistribusi)}} {{$itemSatuan}}</b>
                                            </td>
                                            <td class="vam text-left jumlah-rusak-td">
                                                @if($sudahPengembalian)
                                                    @if($itemHasStock)
                                                        @php
                                                            $jumlahTerpakai =   $pinjamItemQuantityDistribusi - $pinjamItemQuantityKembali;
                                                        @endphp
                                                        <h6 class="mb-1 text-success">{{number_format($pinjamItemQuantityKembali)}} {{$itemSatuan}}</h6>
                                                        <p class="text-sm text-muted mb-0">Stok saat pengembalian <b class='text-primary'>{{number_format($pinjamItemQuantityKembali)}} {{$itemSatuan}}</b></p>
                                                        <p class="text-sm text-muted mb-0">Terpakai <b class='text-danger'>{{number_format($jumlahTerpakai)}} {{$itemSatuan}}</b></p>
                                                    @else
                                                        @if($pinjamItemKembaliRusak >= 1)
                                                            <p class="text-sm text-muted mb-0">Bagus <b class='text-success'>{{number_format($pinjamItemKembaliBagus)}} {{$itemSatuan}}</b></p>
                                                            <p class="text-sm text-muted mb-0">Rusak <b class='text-danger'>{{number_format($pinjamItemKembaliRusak)}} {{$itemSatuan}}</b></p>
                                                        @else
                                                            <span class="text-sm text-muted">Semua kembali dalam keadaan <b class='text-success'>Bagus</b></span>
                                                        @endif
                                                    @endif
                                                @else
                                                    <div style='display: {{($itemHasStock)? "block" : "none"}}'>
                                                        <div class="input-group">
                                                            <input type="number" name='stokKembali[]' placeholder='Stok Kembali' class='form-control' value='0'
                                                                data-jumlah-distribusi='{{$pinjamItemQuantityDistribusi}}' />
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">{{$itemSatuan}}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style='display: {{(!$itemHasStock)? "block" : "none"}}'>
                                                        <div class="input-group jumlah-rusak-container">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">Jumlah Rusak</span>
                                                            </div>
                                                            <input type="number" name="jumlahRusak[]" placeholder='Jumlah Rusak' class='form-control' value='0'
                                                                onChange='_jumlahRusakChanged(this)' data-jumlah-distribusi='{{$pinjamItemQuantityDistribusi}}' />
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">{{$itemSatuan}}</span>
                                                            </div>
                                                        </div>
                                                        <p class="text-sm text-muted jumlah-bagus-container mb-0 mt-1">Jumlah Bagus <b class='text-success jumlah-bagus'>{{number_format($pinjamItemQuantityDistribusi)}}</b> <b class="text-success">{{$itemSatuan}}</b></p>
                                                    </div>    
                                                @endif
                                            </td>
                                            <td class='vam text-left'>
                                                @if(!$sudahPengembalian)
                                                    <textarea name="keterangan[]" class="form-control" placeholder='Keterangan (Opsional)'></textarea>
                                                @else
                                                    {{$pinjamItemKeterangan}}
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
<link rel='stylesheet' href='{{asset("admin-lte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css")}}' />

<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' />

<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script src='{{asset("custom/js/custom-alert.js")}}'></script>
<script src='{{asset("admin-lte/plugins/numeral/numeral.js")}}'></script>

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

    async function _jumlahRusakChanged(thisContext){
        let _el =   $(thisContext);
        let _parentTd           =   _el.parents('.jumlah-rusak-td');
        let _jumlahBagusEl      =   _parentTd.find('.jumlah-bagus');

        let _jumlahRusak        =   _el.val();
        let _jumlahDistribusi   =   _el.data('jumlahDistribusi');
        let _jumlahBagus        =   _jumlahDistribusi - _jumlahRusak;

        _jumlahBagusEl.text(numeral(_jumlahBagus).format('0,0'));
    }
</script>
@endsection