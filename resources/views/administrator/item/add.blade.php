@extends('administrator.index')

@section('content')
@php
    $doesUpdate     =   !empty($item);
@endphp
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-1">{{($doesUpdate)? 'Update Item' : 'Item Baru'}}</h6>
                            @if($doesUpdate)
                                <p class='text-sm text-muted mb-0'>{{$item->nama}}</p>
                            @endif
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.item')}}">
                                <button class="btn btn-link">List Item</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5>Form {{($doesUpdate)? 'Update' : 'Add'}} Item</h5>
                    <form action="{{route('admin.item.save')}}" method='post' id='formAddItem' onSubmit='_submit(this, event)'>
                        @csrf
                        @if($doesUpdate)
                            <input type="hidden" name="id" value='{{$item->id}}' />
                        @endif
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label for="nama">Nama</label>
                                <input type="text" class="form-control" name='nama' id="nama" placeholder='Nama Item' required
                                    value='{{($doesUpdate)? $item->nama : ""}}' />
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="jenis">Jenis</label>
                                <select name="jenis" id="jenis" class="form-control" required>
                                    @foreach($listJenis as $jenis)
                                        @php
                                            $jenisId    =   $jenis->id;
                                            $jenisNama  =   $jenis->nama;

                                            $isSelected =   false;
                                            if($doesUpdate){
                                                $isSelected =   $jenisId == $item->jenis;
                                            }
                                            $selected   =   ($isSelected)? 'selected' : '';
                                        @endphp
                                        <option {{$selected}} value="{{$jenisId}}">{{$jenisNama}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="quantityStok">Quantity Stok & Satuan</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" name='quantityStok' id="quantityStok" 
                                        placeholder='Quantity Stok'
                                        value='{{($doesUpdate)? $item->quantityStok : ""}}' required {{($doesUpdate)? ((!empty($item->quantityStok) && !$hasStock)? 'disabled' : '')  : ''}} />
                                    <input type="text" name="satuan" id="satuan" class='form-control'
                                        placeholder='Satuan' value='{{($doesUpdate)? $item->satuan : ""}}' />
                                </div>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="kelompok">Kelompok</label>
                                <input type="text" class="form-control" name='kelompok' id="kelompok" 
                                    placeholder='Kelompok Item'
                                    value='{{($doesUpdate)? $item->kelompok : ""}}' />                                
                            </div>
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