<?php

namespace App\Http\Controllers\user;

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
    public function index(): View{
        $user       =   session()->get('user');
        $userId     =   $user->npm;

        $pageTitle  =   'Peminjaman';
        $pageDesc   =   'Riwayat Peminjaman';
        
        $listRiwayatPeminjaman  =   PinjamModel::query()->where('createdBy', $userId)->get();

        $additionalData =   [
            'listRiwayatPeminjaman' =>  $listRiwayatPeminjaman
        ];
        
        return view('user.pinjam.index', compact(['pageTitle', 'pageDesc']))->with($additionalData);
    }
    public function add(): View{
        $pageTitle  =   'Peminjaman';
        $pageDesc   =   'Halaman Peminjaman Alat dan Ruangan';

        $listItems  =   Item::query()
                        ->select(['id', 'kode', 'nama', 'jenis', 'kelompok'])
                        ->where('status', 'ready')
                        ->get();

        $additionalData =   [
            'listItems' =>  $listItems
        ];

        return view('user.pinjam.add', compact(['pageTitle', 'pageDesc']))->with($additionalData);
    }
    public function save(Request $request): JsonResponse{
        $status     =   false;
        $message    =   'Gagal melakukan pengajuan peminjaman!';
        $data       =   null;

        try{
            DB::beginTransaction();

            $items      =   $request->item;
            
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
                $item           =   $items[$i];

                #Detail Item
                $detailItem     =   Item::query()->select(['id', 'kondisi'])->find($item);
                if(empty($detailItem)){
                    throw new Exception('Item #'.$item.' tidak terdefinisi!');
                }

                $itemKondisi    =   $detailItem->kondisi;

                $pinjamItem     =   new PinjamItem();
                $pinjamItem->pinjam         =   $idPeminjaman;
                $pinjamItem->item           =   $item;
                $pinjamItem->kondisiPinjam  =   $itemKondisi;
                $pinjamItem->save();

                #Update Status Item
                $detailItem->status     =   'dipinjam';
                $detailItem->peminjam   =   $userId;
                $detailItem->save();
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
        
        $recordsTotal   =   PinjamModel::count(['id']);   

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
}
