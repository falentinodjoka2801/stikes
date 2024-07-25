<!-- jQuery -->
<script src="{{asset('admin-lte/plugins/jquery/jquery.min.js')}}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{asset('admin-lte/plugins/jquery-ui/jquery-ui.min.js')}}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{asset('admin-lte/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('admin-lte/dist/js/adminlte.js')}}"></script>

<script language='Javascript'>
    async function copy(stringToCopy, callback = null){
        navigator.clipboard.writeText(stringToCopy);
        
        if(callback == null){
            alert('Coppied!');
        }else{
            callback.call();
        }
    }
    async function fileHandler(thisContext){
        try{
            let _el         =   $(thisContext);
            let imgData     =   _el.prop('files')[0];
            let _preview    =   _el.data('preview');

            let _previewEl  =   $(_preview);

            let fileReader  =   new FileReader();
            fileReader.readAsDataURL(imgData);
            fileReader.onload   =   (e) =>  {
                let imgResult   =   e.target.result;

                _previewEl.attr('src', imgResult);
            }
        }catch(error){
            console.log(`${error.name} : ${error.message}`);
        }
    }
</script>