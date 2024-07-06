<?php

namespace App\Http\Controllers\administrator;

use Illuminate\Http\Request;
use Illuminate\View\View;

use App\Http\Controllers\Controller;
use App\Libraries\APIRespondFormat;

#Model
use App\Models\Pinjam as PinjamModel;
use App\Models\PinjamItem;
use App\Models\Items;
use App\Models\ItemStok;

use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class Pinjam extends Controller
{
    public function peminjaman(): View{
        $pageTitle  =   'Peminjaman';
        $pageDesc   =   'Daftar Peminjaman Alat dan Ruangan';

        $listStatusPeminjaman   =   PinjamModel::$statusPeminjaman;
        $additionalData         =   [
            'listStatusPeminjaman'  =>  $listStatusPeminjaman
        ];
        
        return view('administrator.pinjam.peminjaman', compact(['pageTitle', 'pageDesc']))->with($additionalData);
    }
    public function pengembalian(Request $request, ?string $encryptedIdPeminjaman = null): View{
        try{
            $pageTitle  =   'Pengembalian';
            $pageDesc   =   'Pengembalian Peminjaman Alat dan Ruangan';

            if(empty($encryptedIdPeminjaman)){
                return view('administrator.pinjam.input-peminjaman', compact(['pageTitle', 'pageDesc']));
            }

            $idPeminjaman   =   decrypt($encryptedIdPeminjaman);
            $pinjam         =   PinjamModel::query()->find($idPeminjaman);
            if(empty($pinjam)){
                throw new Exception('Data peminjaman tidak ditemukan!');
            }
            
            $additionalData =   [
                'pinjam'        =>  $pinjam,
                'itemHaveStock' =>  Items::$itemsHaveStock
            ];

            return view('administrator.pinjam.pengembalian', compact(['pageTitle', 'pageDesc']))->with($additionalData);
        }catch(Exception $e){
            abort(500, $e->getMessage());
        }
    }
    public function peminjamanData(Request $request): JsonResponse{
        #Defaultnya ambil 10 data peminjaman terbaru, jika filter dijalankan maka akan ambil data sesuai filter

        $draw       =   $request->draw;

        $start      =   $request->start;
        $start      =   (!is_null($start))? $start : 0;

        $length     =   $request->length;
        $length     =   (!is_null($length))? $length : 10;
        
        $search         =   $request->search;

        #Filter
        $statusPeminjaman   =   $request->statusPeminjaman;
        
        $recordsTotal   =   PinjamModel::count(['id']);   

        $listRiwayatPeminjaman  =   PinjamModel::query()
                                    ->with(['peminjam'])
                                    ->when(!empty($statusPeminjaman), function(Builder $builder) use ($statusPeminjaman){
                                        if($statusPeminjaman == PinjamModel::$statusPeminjaman_dipinjam){
                                            return $builder->where('returnedAt', '=', null);
                                        }else{
                                            return $builder->where('returnedAt', '!=', null);
                                        }
                                    })
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
            $riwayatPeminjamanId    =   $riwayatPeminjaman->id;
            $encryptedIdPeminjaman  =   encrypt($riwayatPeminjamanId);
            $peminjam               =   $riwayatPeminjaman->peminjam;

            $listRiwayatPeminjaman[$index]['nomorUrut']             =   $nomorUrut;
            $listRiwayatPeminjaman[$index]['encryptedIdPeminjaman'] =   $encryptedIdPeminjaman;
            $listRiwayatPeminjaman[$index]['peminjam']              =   $peminjam;
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
    
    public function prosesPengembalian(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memperoses pengembalian peminjaman!';
        $data       =   null;

        try{
            DB::beginTransaction();

            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;

            $idPeminjaman       =   $request->idPeminjaman;
            $items              =   $request->item;

            $stokKembalis       =   $request->stokKembali;
            $jumlahRusaks       =   $request->jumlahRusak;
            $keterangans        =   $request->keterangan;

            $pinjam     =   PinjamModel::find($idPeminjaman);
            if(empty($pinjam)){
                throw new Exception('Peminjaman tidak terdefinisi!');
            }

            #Detail Peminjaman
            $pinjamNomor    =   $pinjam->nomor;

            $dateTimeToday      =   date('Y-m-d H:i:s');
            $jumlahItem         =   (!empty($items))? count($items) : 0;
            $jumlahItemDatabase =   $pinjam->items()->count('id');
            if($jumlahItemDatabase != $jumlahItem){
                throw new Exception('Jumlah item yang diproses tidak sama dengan jumlah item yang tercatat dalam database!');
            }

            for($i = 0; $i < $jumlahItem; $i++){
                $item           =   $items[$i];

                $detailItem         =   Items::query()->select(['id', 'nama', 'jenis', 'quantityPinjam', 'quantityStok'])->find($item);
                $itemNama           =   $detailItem->nama;
                $itemJenis          =   $detailItem->jenis;
                $itemQuantityPinjam =   $detailItem->quantityPinjam;
                $itemQuantityStok   =   $detailItem->quantityStok;
                

                $pinjamItem     =   PinjamItem::query()
                                    ->where('pinjam', $idPeminjaman)
                                    ->where('item', $item)
                                    ->first();
                if(empty($pinjamItem)){
                    throw new Exception('Item '.$itemNama.' tidak ada dalam peminjaman #'.$pinjamNomor.'!');
                }

                $itemHasStok                    =   in_array($itemJenis, Items::$itemsHaveStock);
                $pinjamItemQuantityDistribusi   =   $pinjamItem->quantityDistribusi;

                $keterangan     =   $keterangans[$i];

                if($itemHasStok){
                    $stokKembali            =   $stokKembalis[$i];
                    $stokSaatPengembalian   =   abs($stokKembali);

                    $jumlahPemakaian        =   $pinjamItemQuantityDistribusi - $stokSaatPengembalian;

                    #Pengurangan Stok Item
                    $itemStok               =   new ItemStok();
                    $itemStok->item         =   $item;
                    $itemStok->quantity     =   -$jumlahPemakaian;
                    $itemStok->createdBy    =   $administratorId;
                    $itemStok->createdFrom  =   ItemStok::$createdFrom_pengembalian;
                    $itemStok->createdAt    =   $dateTimeToday;
                    $itemStok->save();

                    #Update Pinjam Item
                    $pinjamItem->quantityKembali    =   $stokKembali;
                    $pinjamItem->keterangan         =   $keterangan;
                    $pinjamItem->save();

                    #Update Item
                    $detailItem->quantityPinjam =   $itemQuantityPinjam - $jumlahPemakaian;
                    $detailItem->quantityStok   =   $itemQuantityStok + $jumlahPemakaian;
                    $detailItem->save();
                }else{
                    $kembaliRusak   =   $jumlahRusaks[$i];
                    $kembaliBagus   =   $pinjamItemQuantityDistribusi - $kembaliRusak;

                    #Update Item
                    #Jika ada item yang rusak akan mengurangi quantityStok
                    $detailItem->quantityPinjam =   $itemQuantityPinjam - $pinjamItemQuantityDistribusi;
                    $detailItem->quantityStok   =   $itemQuantityStok + $pinjamItemQuantityDistribusi - $kembaliRusak;
                    $detailItem->save();

                    #Update Pinjam Item
                    $pinjamItem->quantityKembaliBagus   =   $kembaliBagus;
                    $pinjamItem->quantityKembaliRusak   =   $kembaliRusak;
                    $pinjamItem->keterangan             =   $keterangan;
                    $pinjamItem->save();
                }
            }

            $pinjam->returnedBy =   $administratorId;
            $pinjam->returnedAt =   $dateTimeToday;
            $pinjam->save();

            $status     =   true;
            $message    =   'Berhasil memproses pengembalian #'.$pinjamNomor.'!';
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
    public function prosesNomorPengembalian(Request $request){
        $nomorPeminjaman    =   $request->nomorPeminjaman;

        try{
            if(empty($nomorPeminjaman)){
                throw new Exception('Nomor Peminjaman wajib diisi!');
            }
            
            $pinjam     =   PinjamModel::query()->select(['id'])->where('nomor', $nomorPeminjaman)->first();
            $pinjamId   =   $pinjam->id;

            $encryptedIdPeminjaman  =   encrypt($pinjamId);

            return redirect('admin/pinjam/pengembalian/'.$encryptedIdPeminjaman);
        }catch(QueryException $e){
            abort(500);
        }catch(Exception $e){
            abort(404);
        }
    }
    public function distribusi(Request $request, string $encryptedIdPeminjaman): View{
        try{
            $pageTitle  =   'Distribusi';
            $pageDesc   =   'Distribusi Peminjaman Alat dan Ruangan';

            // if(empty($encryptedIdPeminjaman)){
            //     return view('administrator.pinjam.input-peminjaman', compact(['pageTitle', 'pageDesc']));
            // }

            $idPeminjaman   =   decrypt($encryptedIdPeminjaman);
            $pinjam         =   PinjamModel::query()->find($idPeminjaman);
            if(empty($pinjam)){
                throw new Exception('Data peminjaman tidak ditemukan!');
            }
            
            $additionalData =   [
                'pinjam'        =>  $pinjam,
                'itemHaveStock' =>  Items::$itemsHaveStock
            ];

            return view('administrator.pinjam.distribusi', compact(['pageTitle', 'pageDesc']))->with($additionalData);
        }catch(Exception $e){
            abort(500, $e->getMessage());
        }
    }    
    public function prosesDistribusi(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal memperoses distribusi peminjaman!';
        $data       =   null;

        try{
            DB::beginTransaction();

            $administrator      =   session()->get('administrator');
            $administratorId    =   $administrator->id;
            
            $idPeminjaman           =   $request->idPeminjaman;
            $items                  =   $request->item;
            $quantityDistribusis    =   $request->quantityDistribusi;

            $pinjam     =   PinjamModel::find($idPeminjaman);
            if(empty($pinjam)){
                throw new Exception('Peminjaman tidak terdefinisi!');
            }

            #Detail Peminjaman
            $pinjamNomor    =   $pinjam->nomor;

            $dateTimeToday      =   date('Y-m-d H:i:s');
            $jumlahItem         =   (!empty($items))? count($items) : 0;
            $jumlahItemDatabase =   $pinjam->items()->count('id');
            if($jumlahItemDatabase != $jumlahItem){
                throw new Exception('Jumlah item yang diproses tidak sama dengan jumlah item yang tercatat dalam database!');
            }

            for($i = 0; $i < $jumlahItem; $i++){
                $item                   =   $items[$i];
                $quantityDistribusi     =   $quantityDistribusis[$i];

                #Reassignment
                $quantityDistribusi =   abs($quantityDistribusi);
                
                $detailItem         =   Items::query()->select(['id', 'kode', 'nama', 'quantityPinjam', 'quantityStok', 'satuan'])->find($item);
                $itemNama           =   $detailItem->nama;
                $itemKode           =   $detailItem->kode;
                $itemQuantityPinjam =   $detailItem->quantityPinjam;
                $itemQuantityStok   =   $detailItem->quantityStok;
                $itemSatuan         =   $detailItem->satuan;

                $pinjamItem     =   PinjamItem::query()
                                    ->where('pinjam', $idPeminjaman)
                                    ->where('item', $item)
                                    ->first();
                if(empty($pinjamItem)){
                    throw new Exception('Item '.$itemNama.' tidak ada dalam peminjaman #'.$pinjamNomor.'!');
                }

                if($itemQuantityStok < $quantityDistribusi){
                    throw new Exception('Item #'.$itemKode.' '.$itemNama.' hanya tersisa '.number_format($itemQuantityStok).' '.$itemSatuan.'!');
                }

                $pinjamItem->quantityDistribusi =   $quantityDistribusi;
                $pinjamItem->save();

                $pinjamItemQuantityDistribusi  =   $pinjamItem->quantityDistribusi;

                $detailItem->quantityPinjam =   $itemQuantityPinjam + $pinjamItemQuantityDistribusi;
                $detailItem->quantityStok   =   $itemQuantityStok - $pinjamItemQuantityDistribusi;
                $detailItem->save();
            }

            $pinjam->distributedBy =   $administratorId;
            $pinjam->distributedAt =   $dateTimeToday;
            $pinjam->save();

            $status     =   true;
            $message    =   'Berhasil memproses distribusi peminjaman #'.$pinjamNomor.'!';
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
}
