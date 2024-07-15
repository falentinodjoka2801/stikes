<form action="{{route('admin.item.proses-add-stock')}}" id="formAddStock"
    method='post' onSubmit='_onSubmit(this, event)'>
    <div id="itemContainer"></div>
    @csrf
    <input type="hidden" name="createdFrom" id='createdFrom' value='{{\App\Models\ItemStok::$createdFrom_stockMinimum}}' />
    <div class="row">
        <div class="col-lg-5">
            <div class="form-group">
                <label for="kategoriTransaksi">Kategori Penambahan</label>
                <select name="kategoriTransaksi" id="kategoriTransaksi" class="form-control" required>
                    <option value="">-- Pilih Kategori Penambahan Stok --</option>
                    @foreach($listKategoriTransaksi as $kategoriTransaksi)
                        <option value="{{$kategoriTransaksi->id}}">{{$kategoriTransaksi->nama}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <div class="input-group">
                    <input type="number" class="form-control" id="quantity" placeholder='Quantity'
                        name='quantity' />
                    <div class="input-group-append">
                        <span class="input-group-text" id='itemSatuan'></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="keterangan">Keterangan (opsional)</label>
        <textarea class="form-control" id="keterangan" placeholder='Keterangan'
            name='keterangan'></textarea>
    </div>
    <hr />
    <button class="btn btn-success" type='submit' id='buttonSubmit'>Proses Penambahan Stok</button>
</form>
<script language='Javascript'>
    let _submitCallback     =   `{{(!isset($submitCallback)? '' : $submitCallback)}}`;
    async function _onSubmit(thisContext, event){
        event.preventDefault();
        
        await submitForm(thisContext, async (decodedResponseFromServer) => {
            let _status     =   decodedResponseFromServer.status;
            let _message    =   decodedResponseFromServer.message;

            let _swalTitle      =   `Penambahan Stok`;
            let _swalMessage    =   (_message != null)? _message : ((_status)? `Berhasil!` : `Gagal!`);
            let _swalType       =   (_status)? 'success' : 'error';    

            await notifikasi(_swalTitle, _swalMessage, _swalType);
            if(_status){
                if(_submitCallback != ''){
                    eval(`${_submitCallback}()`);
                }else{
                    location.reload();
                }
            }
        });
    }
</script>