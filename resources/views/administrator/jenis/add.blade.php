@extends('administrator.index')

@section('content')
@php
    $doesUpdate     =   !empty($jenis);
@endphp
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-1">{{($doesUpdate)? 'Update Jenis' : 'Jenis Baru'}}</h6>
                            @if($doesUpdate)
                                <p class='text-sm text-muted mb-0'>{{$jenis->nama}}</p>
                            @endif
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.jenis')}}">
                                <button class="btn btn-link">List Jenis</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5>Form {{($doesUpdate)? 'Update' : 'Add'}} Jenis</h5>
                    <form action="{{route('admin.jenis.save')}}" method='post' id='formAddJenis' onSubmit='_submit(this, event)'>
                        @csrf
                        @if($doesUpdate)
                            <input type="hidden" name="id" value='{{$jenis->id}}' />
                        @endif
                        <div class="form-group">
                            <label for="nama">Nama</label>
                            <input type="text" class="form-control" name='nama' id="nama" placeholder='Nama Jenis' required
                                value='{{($doesUpdate)? $jenis->nama : ""}}' />
                        </div>
                        <div class="form-group">
                            <label for="keterangan">Keterangan (Opsional)</label>
                            <textarea class="form-control" name='keterangan' id="keterangan" 
                                placeholder='Keterangan Jenis (Opsional)'>{{($doesUpdate)? $jenis->keterangan : ""}}</textarea>
                        </div>
                        <hr />
                        <button class="btn btn-success" id="buttonSubmit" type='submit'>Simpan {{($doesUpdate)? 'Perubahan' : ''}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}'></script>
<link rel="stylesheet" href='{{asset("admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}' />

<script src='{{asset("custom/js/custom-alert.js")}}'></script>
<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script language='Javascript'>
    async function _submit(thisContext, event){
        event.preventDefault();
        await submitForm(thisContext, async (decodedRFS) => {
            let _status     =   decodedRFS.status;
            let _message    =   decodedRFS.message;

            let _swalTitle      =   `Jenis`;
            let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
            let _swalType       =   (_status)? 'success' : 'error';
            
            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                location.href   =   `{{route('admin.jenis')}}`;
            }
        });
    }
</script>
@endsection