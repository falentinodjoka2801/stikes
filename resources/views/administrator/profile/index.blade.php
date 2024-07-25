@extends('administrator.index')

@section('content')
@php
    $administratorNama  =   $administrator->nama;
    $administratorUserName = $administrator->username;
    $administratorAlamat    =   $administrator->alamat;
    $administratorEmail = $administrator->email;
    $administratorTelepon = $administrator->telepon;
    $administratorCreatedAt = $administrator->createdAt;
    $administratorFoto = $administrator->foto;
@endphp
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="card card-primary card-outline">
                <div class="card-body box-profile">
                    <div class="text-center">
                        <label for="uploadFile" data-toggle='tooltip' title='Klik gambar untuk mengupload Foto Profile baru'>
                            <img class="img-fluid img-circle img-100-100" src="{{(!empty($administratorFoto))? asset('admin_profile_pict/'.$administratorFoto) : ''}}" alt="{{$administratorNama}}"
                                onError='this.src="{{asset('img/icon.png')}}"' id='fotoProfile'>
                            <input type="file" id="uploadFile" name='uploadFile' onChange='_imgChanged(this)'
                                data-preview='#fotoProfile' style='display:none;' />
                        </label>
                    </div>
                    <h3 class="profile-username text-center mt-3">{{$administratorNama}}</h3>
                    <p class="text-muted text-center">{{$administratorUserName}}</p>
                    <br />
                    <strong><i class="fas fa-phone mr-1"></i> Telepon</strong>
                    <p class="text-muted">{{$administratorTelepon}}</p>
                    <strong><i class="fas fa-envelope mr-1"></i> Email</strong>
                    <p class="text-muted">{{$administratorEmail}}</p>
                    <strong><i class="fas fa-map-marker-alt mr-1"></i> Alamat</strong>
                    <p class="text-muted">{{$administratorAlamat}}</p>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <div class="card">
                <div class="card-header p-2">
                    <ul class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link active" href="#profile" data-toggle="tab">Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="#gantiPassword" data-toggle="tab">Ganti Password</a></li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="active tab-pane" id="profile">
                            <form action="{{route('admin.profile.save')}}" id="formProfile" method="post" onSubmit='_onFormProfilSubmit(this, event)'>
                                @csrf
                                <div class="form-group">
                                    <label for="nama">Nama</label>
                                    <input type="text" class="form-control" id="nama"
                                        placeholder='Nama Lengkap' name='nama'
                                        value='{{$administratorNama}}'
                                        required />
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-4">
                                        <label for="telepon">Telepon</label>
                                        <input type="text" class="form-control" id="telepon"
                                            placeholder='Nomor Telepon' name='telepon'
                                            value='{{$administratorTelepon}}'
                                            required />
                                    </div>
                                    <div class="form-group col-lg-8">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" id="email"
                                            placeholder='Alamat Email' name='email'
                                            value='{{$administratorEmail}}'
                                            required />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="alamat">Alamat</label>
                                    <textarea name="alamat" id="alamat" placeholder='Alamat Lengkap'
                                        class='form-control' required name='alamat'>{{$administratorAlamat}}</textarea>
                                </div>
                                <button class="btn btn-success" id="buttonSubmit" type='submit'>Update Profile</button>
                            </form>
                        </div>
                        <div class="tab-pane" id="gantiPassword">
                            <form action="{{route('admin.profile.save-ganti-password')}}" id="formGantiPassword" method="post" onSubmit='_onFormGantiPasswordSubmit(this, event)'>
                                @csrf
                                <div class="form-group" id='passwordSaatIniContainer'>
                                    <label for="passwordSaatIni">Password Saat Ini</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control password" id="passwordSaatIni" 
                                            placeholder='Password Saat Ini' name='passwordSaatIni' required />
                                        <div class="input-group-prepend">
                                            <div class="input-group-text cp" onClick='togglePassword(this, "#passwordSaatIniContainer")'>
                                                <span class="password-icon fa fa-eye"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id='passwordBaruContainer'>
                                    <label for="passwordBaru">Password Baru</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control password" id="passwordBaru" 
                                            placeholder='Password Baru' name='passwordBaru' required />
                                        <div class="input-group-prepend">
                                            <div class="input-group-text cp" onClick='togglePassword(this, "#passwordBaruContainer")'>
                                                <span class="password-icon fa fa-eye"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id='konfirmasiPasswordBaruContainer'>
                                    <label for="konfirmasiPasswordBaru">Konfirmasi Password Baru</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control password" id="konfirmasiPasswordBaru" 
                                            placeholder='Konfirmasi Password Baru' name='konfirmasiPasswordBaru' required />
                                        <div class="input-group-prepend">
                                            <div class="input-group-text cp" onClick='togglePassword(this, "#konfirmasiPasswordBaruContainer")'>
                                                <span class="password-icon fa fa-eye"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-success" id="buttonSubmitGantiPassword" type='submit'>Proses Ganti Password</button>
                            </form>
                        </div>
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

<script src='{{asset("custom/js/form-submission.js")}}'></script>
<script src='{{asset("custom/js/custom-alert.js")}}'></script>
<script src='{{asset("admin-lte/plugins/numeral/numeral.js")}}'></script>
<script src='{{asset("custom/js/toggle-password.js")}}'></script>

<script language='Javascript'>
    $('[data-toggle=tooltip]').tooltip();

    let _fotoProfile    =   $('#fotoProfile');
    
    async function _imgChanged(thisContext){
        await fileHandler(thisContext);
    }

    async function _onFormProfilSubmit(thisContext, eventContext){
        eventContext.preventDefault();
        
        let _el     =   $(thisContext);
        await submitForm(thisContext, async (responseFromServer) => {
            let _status     =   responseFromServer.status;
            let _message    =   responseFromServer.message;

            let _swalTitle      =   `Update Profile`;
            let _swalMessage    =   _message ?? ((_status)? 'Berhasil!' : 'Gagal');
            let _swalType       =   (_status)? 'success' : 'error';

            await notifikasi(_swalTitle, _swalMessage, _swalType);
        });
    }
    
    async function _onFormGantiPasswordSubmit(thisContext, eventContext){
        eventContext.preventDefault();
        
        let _el     =   $(thisContext);
        await submitForm(thisContext, async (responseFromServer) => {
            let _status     =   responseFromServer.status;
            let _message    =   responseFromServer.message;

            let _swalTitle      =   `Ganti Password`;
            let _swalMessage    =   _message ?? ((_status)? 'Berhasil!' : 'Gagal');
            let _swalType       =   (_status)? 'success' : 'error';

            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                _el.trigger('reset');
            }
        });
    }
</script>
@endsection