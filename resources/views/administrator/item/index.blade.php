@extends('administrator.index')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h6 class="mb-0">Item</h6>
                        </div>
                        <div class="col text-right">
                            <a href="{{route('admin.item.add')}}">
                                <button class="btn btn-link">Item Baru</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    @if(count($listItem) >= 1)
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id='tabelItem'>
                            <thead>
                                <tr>
                                    <th class='text-center' style='width: 75px;'>No.</th>
                                    <th>Rencana Study</th>
                                    <th>Semester</th>
                                    <th class='text-center' style='width: 100px;'>Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    @else
                        @include('components.empty', ['title' => 'Item', 'description' => 'Item tidak ada'])
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
<script language='Javascript' src='{{asset("admin-lte/plugins/datatables/jquery.dataTables.min.js")}}'></script>
<script language='Javascript' src='{{asset("admin-lte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js")}}'></script>
<link href='stylesheet' src='{{asset("admin-lte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css")}}' />
<script language='Javascript'>
    let _tabelItem    =   $('#tabelItem');
    _tabelItem.DataTable();
</script>
@endsection