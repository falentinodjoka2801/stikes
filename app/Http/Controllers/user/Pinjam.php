<?php

namespace App\Http\Controllers\user;

use Illuminate\Http\Request;
use Illuminate\View\View;

use App\Http\Controllers\Controller;
use App\Libraries\APIRespondFormat;

#Model
use App\Models\Pinjam as PinjamModel;
use App\Models\PinjamItem;
use App\Models\Items;
use App\Models\ItemStok;
use App\Models\Jenis;

use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class Pinjam extends Controller
{
    public function index(): View{
        $pageTitle  =   'Peminjaman';
        $pageDesc   =   'Riwayat Peminjaman';
        
        return view('user.pinjam.index', compact(['pageTitle', 'pageDesc']));
    }
    public function add(){
        $pageTitle  =   'Peminjaman';
        $pageDesc   =   'Halaman Peminjaman Alat dan Ruangan';

        $listJenis  =   Jenis::query()->select(['id', 'nama'])->get();

        $additionalData =   [
            'listJenis' =>  $listJenis
        ];

        return view('user.pinjam.add', compact(['pageTitle', 'pageDesc']))->with($additionalData);
    }
    public function save(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal melakukan pengajuan peminjaman!';
        $data       =   null;

        try{
            DB::beginTransaction();

            $items              =   $request->item;
            $quantityRequests   =   $request->quantityRequest;
            
            if(empty($items)){
                throw new Exception('Minimal harus ada 1 Item yang dipilih untuk pengajuan peminjaman!');
            }

            $jumlahItem =   count($items);

            if(!($jumlahItem >= 1)){
                throw new Exception('Minimal harus ada 1 Item yang dipilih untuk pengajuan peminjaman!');
            }

            #User
            $user       =   session()->get('user');
            $userId     =   $user->npm;

            $dateToday      =   date('Y-m-d');
            $dateTimeToday  =   date('Y-m-d H:i:s');
            
            $jumlahPeminjamanToday  =   PinjamModel::query()->where(function (Builder $builder) use ($dateToday) {
                $builder->where('createdAt', '>=', $dateToday . ' 00:00:00');
                $builder->where('createdAt', '<=', $dateToday . ' 23:59:59');
            })->count();
            if ($jumlahPeminjamanToday == 0) {
                $urutanPeminjamanToday  =   1;
            } else {
                $jumlahPeminjamanToday  =   PinjamModel::query()->where(function (Builder $builder) use ($dateToday) {
                    $builder->where('createdAt', '>=', $dateToday . ' 00:00:00');
                    $builder->where('createdAt', '<=', $dateToday . ' 23:59:59');
                })->count();
                $urutanPeminjamanToday  =   $jumlahPeminjamanToday + 1;
            }
            
            $nomorPeminjaman    =   date('Ymd').str_pad($urutanPeminjamanToday, 3, 0, STR_PAD_LEFT);

            #Master Peminjaman
            $pinjam             =   new PinjamModel();
            $pinjam->nomor      =   $nomorPeminjaman;
            $pinjam->createdBy  =   $userId;
            $pinjam->createdAt  =   $dateTimeToday;
            $pinjam->save();

            $idPeminjaman   =   $pinjam->id;

            for($i = 0; $i < $jumlahItem; $i++){
                $item               =   $items[$i];
                $quantityRequest    =   $quantityRequests[$i];

                #Detail Item
                $detailItem     =   Items::query()->select(['id', 'kode', 'nama', 'jenis', 'quantityStok', 'quantityPinjam', 'satuan'])->find($item);
                if(empty($detailItem)){
                    throw new Exception('Item #'.$item.' tidak terdefinisi!');
                }

                $itemId                 =   $detailItem->id;
                $itemKode               =   $detailItem->kode;
                $itemNama               =   $detailItem->nama;
                $itemJenis              =   $detailItem->jenis;
                $itemQuantityStok       =   $detailItem->quantityStok;
                $itemQuantityPinjam     =   $detailItem->quantityPinjam;
                $itemSatuan             =   $detailItem->satuan;

                if($itemQuantityPinjam == $itemQuantityStok){
                    throw new Exception('Item #'.$itemKode.' '.$itemNama.' sudah dipinjam semua!');
                }

                $quantityTersisa    =   $itemQuantityStok - $itemQuantityPinjam;
                if($quantityTersisa < $quantityRequest){
                    throw new Exception('Item #'.$itemKode.' '.$itemNama.' hanya tersisa '.number_format($quantityTersisa).' '.$itemSatuan.'!');
                }

                $itemHasStock   =   in_array($itemJenis, Items::$itemsHaveStock);

                $pinjamItem     =   new PinjamItem();
                $pinjamItem->pinjam             =   $idPeminjaman;
                $pinjamItem->item               =   $item;
                $pinjamItem->quantityRequest    =   $quantityRequest;
                
                if($itemHasStock){
                    $getStokItem    =   ItemStok::query()->select([DB::raw('SUM(quantity) as stok')])->where('item', $itemId)->first();
                    $stokItem       =   !empty($getStokItem)? $getStokItem->stok : 0;

                    if($stokItem <= 0){
                        throw new Exception('Maaf, stok '.$itemNama.' habis!');
                    }

                    $pinjamItem->stokPinjam =   $stokItem;
                }

                $pinjamItem->save();
            }

            $status     =   true;
            $message    =   'Berhasil mengajukan peminjaman!';
            $data       =   ['pinjam' => $idPeminjaman];

            if($status){
                DB::commit();
            }
        }catch(Exception $e){
            DB::rollBack();
            $message    =   $e->getMessage();
        }catch(QueryException $e){
            DB::rollBack();
            $message    =   $e->getMessage();
        }

        $apiRespondFormat   =   new APIRespondFormat($status, $message, $data);
        $respond            =   $apiRespondFormat->getRespond();

        return response()->json($respond);
    }
    public function data(Request $request): JsonResponse{
        $user       =   session()->get('user');
        $userId     =   $user->npm;

        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search         =   $request->search;
        
        $recordsTotal   =   PinjamModel::where('createdBy', $userId)->count(['id']);   

        $listRiwayatPeminjaman  =   PinjamModel::query()
                                    ->where('createdBy', $userId)
                                    ->when(!empty($search), function(Builder $builder) use ($search){
                                        if(is_array($search)){
                                            if(array_key_exists('value', $search)){
                                                $searchValue    =   $search['value'];
                                                if(!empty($searchValue)){
                                                    $builder->where('nomor', 'like', '%'.$searchValue.'%');
                                                }
                                            }
                                        }

                                        return $builder;
                                    })
                                    ->limit($length)
                                    ->offset($start)
                                    ->get();

        $nomorUrut  =   1;
        foreach($listRiwayatPeminjaman as $index => $riwayatPeminjaman){
            $listRiwayatPeminjaman[$index]['nomorUrut'] =   $nomorUrut;
            $nomorUrut++;
        }

        $respond   =   [
            'listRiwayatPeminjaman' =>  $listRiwayatPeminjaman,
            'draw'                  =>  $draw,
            'recordsFiltered'       =>  $recordsTotal,
            'recordsTotal'          =>  $recordsTotal
        ];

        return response()->json($respond);
    }
    public function dataItem(Request $request): JsonResponse{
        $jenis          =   $request->jenis;

        $detailJenis    =   Jenis::query()->select(['nama'])->find($jenis);
        $jenisNama      =   $detailJenis->nama;
        
        $listItems  =   Items::query()
                        ->select(['id', 'kode', 'nama', 'kelompok', 'quantityStok', 'satuan'])
                        ->where('jenis', $jenis)
                        ->where('quantityStok', '>=', 1)
                        ->get();

        foreach($listItems as $index => $item){
            $listItems[$index]['jenis'] =   $jenisNama;
        }

        $arf        =   new APIRespondFormat(true, null, ['listItem' => $listItems]);
        $respond    =   $arf->getRespond();
        return response()->json($respond);
    }
}
