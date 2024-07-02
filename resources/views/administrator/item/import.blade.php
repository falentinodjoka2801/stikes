@extends('administrator.index')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Import Item</h6>
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.item')}}">
                                <button class="btn btn-link">List Item</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5>Form Import Item</h5>
                    <form action="{{route('admin.item.import')}}" method='post' id='formImportItem' onSubmit='_submit(this, event)'
                        enctype="multipart/form-data">
                        @csrf
                        <input type="file" name='file' class="form-control" id="file">
                        <hr />
                        <button class="btn btn-success" id="buttonSubmit" type='submit'>Proses</button>
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