<?php

namespace App\Http\Controllers\administrator;

use Illuminate\Http\Request;
use Illuminate\View\View;

use App\Http\Controllers\Controller;
use App\Libraries\APIRespondFormat;

#Model
use App\Models\Pinjam as PinjamModel;
use App\Models\PinjamItem;
use App\Models\Item;

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
        
        return view('administrator.pinjam.peminjaman', compact(['pageTitle', 'pageDesc']));
    }
    public function pengembalian(Request $request, ?string $encryptedIdPeminjaman = null): View{
        try{
            $idPeminjaman   =   decrypt($encryptedIdPeminjaman);
            $pinjam         =   PinjamModel::query()->find($idPeminjaman);
            if(empty($pinjam)){
                throw new Exception('Data peminjaman tidak ditemukan!');
            }

            $pageTitle  =   'Pengembalian';
            $pageDesc   =   'Pengembalian Peminjaman Alat dan Ruangan';
            
            $additionalData =   [
                'pinjam'        =>  $pinjam,
                'listKondisi'   =>  Item::listKondisi()  
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
        
        $recordsTotal   =   PinjamModel::count(['id']);   

        $listRiwayatPeminjaman  =   PinjamModel::query()
                                    ->with(['peminjam'])
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

            $idPeminjaman       =   $request->idPeminjaman;
            $items              =   $request->item;
            $kondisiKembalis    =   $request->kondisiKembali;

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
                $kondisiKembali =   $kondisiKembalis[$i];

                $detailItem     =   Item::query()->select(['id', 'nama'])->find($item);
                $itemNama       =   $detailItem->nama;

                $pinjamItem     =   PinjamItem::query()
                                    ->where('pinjam', $idPeminjaman)
                                    ->where('item', $item)
                                    ->first();
                if(empty($pinjamItem)){
                    throw new Exception('Item '.$itemNama.' tidak ada dalam peminjaman #'.$pinjamNomor.'!');
                }

                $pinjamItem->kondisiKembali     =   $kondisiKembali;
                $pinjamItem->save();

                if($kondisiKembali == 'bagus'){
                    $detailItem->peminjam   =   null;
                    $detailItem->status     =   'ready';
                }
                $detailItem->kondisi    =   $kondisiKembali;
                $detailItem->save();
            }

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
}
