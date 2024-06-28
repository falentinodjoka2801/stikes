@extends('administrator.index')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Item Baru</h6>
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.item')}}">
                                <button class="btn btn-link">List Item</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5>Form Add Item</h5>
                    <form action="{{route('admin.item.save')}}" method='post' id='formAddItem' onSubmit='_submit(this, event)'>
                        @csrf
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label for="nama">Nama</label>
                                <input type="text" class="form-control" name='nama' id="nama" placeholder='Nama Item' required />
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="jenis">Jenis</label>
                                <select name="jenis" id="jenis" class="form-control" required>
                                    @foreach($listJenis as $jenis)
                                        <option value="{{$jenis['id']}}">{{$jenis['nama']}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="kelompok">Kelompok</label>
                                <input type="text" class="form-control" name='kelompok' id="kelompok" placeholder='Kelompok Item' required />
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="kondisi">Kondisi</label>
                                <select name="kondisi" id="kondisi" class="form-control" required>
                                    @foreach($listKondisi as $kondisi)
                                        <option value="{{$kondisi['id']}}">{{$kondisi['nama']}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="status">Status</label>
                                <select name="status" id="status" class="form-control" required>
                                    @foreach($listStatus as $status)
                                        <option value="{{$status['id']}}">{{$status['nama']}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <hr />
                        <button class="btn btn-success" id="buttonSubmit" type='submit'>Simpan</button>
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

            let _swalTitle      =   `Item`;
            let _swalMessage    =   (_message != null)? _message : ((_status)? 'Berhasil!' : 'Gagal!');
            let _swalType       =   (_status)? 'success' : 'error';
            
            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                location.href   =   `{{route('admin.item')}}`;
            }
        });
    }
</script>
@endsection