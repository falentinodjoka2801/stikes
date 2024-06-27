/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : SQL Server
 Source Server Version : 16001000 (16.00.1000)
 Source Host           : DESKTOP-SIAKMAR\SQLEXPRESS:1433
 Source Catalog        : stikes
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001000 (16.00.1000)
 File Encoding         : 65001

 Date: 27/06/2024 16:34:50
*/


-- ----------------------------
-- Table structure for administrator
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[administrator]') AND type IN ('U'))
	DROP TABLE [dbo].[administrator]
GO

CREATE TABLE [dbo].[administrator] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [foto] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
  [nama] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [alamat] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [email] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [telepon] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [username] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [password] varchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdBy] int  NULL,
  [createdAt] datetime  NOT NULL,
  [updatedBy] int  NULL,
  [updatedAt] datetime  NULL
)
GO

ALTER TABLE [dbo].[administrator] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of administrator
-- ----------------------------
SET IDENTITY_INSERT [dbo].[administrator] ON
GO

INSERT INTO [dbo].[administrator] ([id], [foto], [nama], [alamat], [email], [telepon], [username], [password], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'2', NULL, N'Falentino Djoka', N'Jl. Stasiun', N'falentinodjoka2801@gmail.com', N'085762424044', N'tino', N'55131f0ffa8c6ddfc0101afc7400f576', NULL, N'2024-06-27 14:12:50.000', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[administrator] OFF
GO


-- ----------------------------
-- Table structure for agama
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[agama]') AND type IN ('U'))
	DROP TABLE [dbo].[agama]
GO

CREATE TABLE [dbo].[agama] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nama] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [keterangan] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[agama] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of agama
-- ----------------------------
SET IDENTITY_INSERT [dbo].[agama] ON
GO

INSERT INTO [dbo].[agama] ([id], [nama], [keterangan]) VALUES (N'1', N'Islam', NULL)
GO

INSERT INTO [dbo].[agama] ([id], [nama], [keterangan]) VALUES (N'2', N'Kristen', NULL)
GO

INSERT INTO [dbo].[agama] ([id], [nama], [keterangan]) VALUES (N'3', N'Katholik', NULL)
GO

INSERT INTO [dbo].[agama] ([id], [nama], [keterangan]) VALUES (N'4', N'Hindu', NULL)
GO

INSERT INTO [dbo].[agama] ([id], [nama], [keterangan]) VALUES (N'5', N'Buddha', NULL)
GO

INSERT INTO [dbo].[agama] ([id], [nama], [keterangan]) VALUES (N'6', N'Konghucu', NULL)
GO

SET IDENTITY_INSERT [dbo].[agama] OFF
GO


-- ----------------------------
-- Table structure for item
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[item]') AND type IN ('U'))
	DROP TABLE [dbo].[item]
GO

CREATE TABLE [dbo].[item] (
  [kode] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [nama] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [jenis] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [kelompok] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [kondisi] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [peminjam] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[item] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'Alat atau Ruangan',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'jenis'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Misal, ada item Buku, kan buku ada banyak, jadi untuk mengelompokkannya maka dibuatlah entitas kelompok',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'kelompok'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Baik, Rusak',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'kondisi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Dipinjam, Ready',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Siapa yang sedang meminjam saat itu',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'peminjam'
GO


-- ----------------------------
-- Records of item
-- ----------------------------
SET IDENTITY_INSERT [dbo].[item] ON
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id]) VALUES (N'', N'Tensimeter', N'tool', N'A', N'good', N'ready', NULL, N'4')
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id]) VALUES (N'', N'Tensimeter', N'tool', N'A', N'good', N'ready', NULL, N'5')
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id]) VALUES (N'20240627092146', N'Tensimeter', N'tool', N'A', N'good', N'ready', NULL, N'6')
GO

SET IDENTITY_INSERT [dbo].[item] OFF
GO


-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[mahasiswa]') AND type IN ('U'))
	DROP TABLE [dbo].[mahasiswa]
GO

CREATE TABLE [dbo].[mahasiswa] (
  [npm] int  NOT NULL,
  [nisn] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nama] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [angkatan] char(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [tempatLahir] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [tanggalLahir] date  NULL,
  [jenisKelamin] nvarchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [namaIbu] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [agama] tinyint  NOT NULL,
  [ktp] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [penerimaKPS] nvarchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [asalSekolah] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [alamat] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [hp] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [rekomendasi] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [password] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[mahasiswa] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021001', NULL, N'AGUSDIN TRIADE MIRANATA', N'2021', NULL, NULL, N'L', N'SINARIA HAREFA', N'2', N'1401112403030002', N'', N'SMA NEGERI 1 TAPUNG HILIR', N'PT. BINA FITRI JAYA', N'082285396261', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021003', NULL, N'CHANI LYA ERVINATA SIANIPAR', N'2021', NULL, NULL, N'P', N'NAOMI SIHOMBING', N'2', N'1202096703990003', N'', N'SMK SWASTA DHARMA BHAKTI SIBORONGBORONG', N'SOSOR HOMBANG', N'082238360068', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021005', NULL, N'DWI ARGITA BR TARIGAN', N'2021', NULL, NULL, N'P', N'ELSY VERONICA BR SINURAYA', N'2', N'1206114308010003', N'', N'SMK NEGERI 3 MEDAN', N'DESA BATU KARANG', N'081370427472', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021006', NULL, N'JUNITA PUTRI MALEM BR BARUS', N'2021', NULL, NULL, N'P', N'IYN BR HASIBUAN', N'3', N'1271096506990003', N'', N'SMA NEGERI 14 MEDAN', N'JL PERTAHANAN NO  14-G MEDAN', N'083185952662', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021008', NULL, N'BRIAN SINAGA', N'2021', NULL, NULL, N'L', N'LASMARIA SITOMPUL', N'3', N'1217031410990000', N'', N'', N'RANGSANG BOSI', N'', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021009', NULL, N'DUMA MEGA YELISABET', N'2021', NULL, NULL, N'P', N'VERONIKA SINAGA', N'2', N'1271185811980001', N'', N'', N'JL TUNGGAL N0 64', N'082279461887', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021010', NULL, N'FITRI SUNTRI HANTI WARUWU', N'2021', NULL, NULL, N'P', N'WARNI ADI TELAUMBANUA', N'2', N'1201054511020002', N'', N'', N'DUSUN IV SIRAKOT-RAKOT', N'081959306990', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021011', NULL, N'NUR AINI', N'2021', NULL, NULL, N'P', N'SUKARNAWATI', N'1', N'1271135111010006', N'', N'', N'LINGK III BLOK AA N0 56 KNI', N'082277999765', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021012', NULL, N'NURHAYATI', N'2021', NULL, NULL, N'P', N'SITI HAWA', N'1', N'1271104110770007', N'', N'', N'JLN DENAI GG DUA NO 6', N'085206665899', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021013', NULL, N'SLAMET SYAHRIZAL', N'2021', NULL, NULL, N'L', N'SUJANA', N'1', N'1205092612970006', N'', N'', N'DUSUN KEPALA SUNGAI II', N'', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021014', NULL, N'HAIDHARDUS DESMANTO SARUMAHA', N'2021', NULL, NULL, N'L', N'SARIFA''AMI DUHA', N'3', N'1214052312970001', N'', N'', N'DESA BAWODOBARA', N'', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023001', N'10210860', N'Aisyah', N'2023', NULL, NULL, N'P', N'Rismarini', N'1', N'1271205506050000-1', N'', N'SMA N 7', N'Jln Bilal', N'085171223788', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023002', N'58381323', N'Canrika Delisia Putri Gultom', N'2023', NULL, NULL, N'P', N'Yulia', N'1', N'317204690105000-2', N'', N'SMK Kesehatan Ganda Husad', N'Riau', N'082288054097', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023003', N'10210927', N'Elisabeh Br Nababan', N'2023', NULL, NULL, N'P', N'Josenta Tambunan', N'2', N'127101661202000-7', N'', N'SMA Parulian 2', N'Jln Jermal III Gg Merdeka Kanan No 16', N'082289082506', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023004', N'69725742', N'Ester Waruwu', N'2023', NULL, NULL, N'P', N'Idaria Hulu', N'2', N'120414010803000-1', N'', N'SMT Kristen', N'Dusun V Hilisoromi', N'081266568688', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023005', N'69932002', N'Ian Rahamat Jaya Mendrofa', N'2023', NULL, NULL, N'L', N'Fitamin Mendrofa', N'2', N'120429271103000-1', N'', N'SMK Swasta Pemda Nias', N'Lalai I/II, Dusun II', N'085289245090', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023006', N'10259032', N'Maria Magdalena Sinaga', N'2023', NULL, NULL, N'P', N'Deli Sinurat', N'2', N'121102600502000-5', N'', N'SMAS Bukit Cahaya', N'Medan', N'082181383545', N'RS Stella Maris', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023007', N'10203516', N'Mawarni Waruwu', N'2023', NULL, NULL, N'P', N'Riani Gulo', N'2', N'120422100803000-1', N'', N'SMA Swasta Nupela', N'Desa Lasari Siwalubanua', N'082177580884', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023008', N'69900420', N'Mita Sihartina Pandiangan', N'2023', NULL, NULL, N'P', N'Lumba Mariana Siregar', N'2', N'120702430997000-2', N'', N'SMA Santa Lusia', N'Jln Medan Batang Kuis', N'082274646356', N'Junita', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023009', N'9961301662', N'Monica Titin P. Mendrofa', N'2023', NULL, NULL, N'P', N'Erina Zai', N'3', N'120429490405000-3', N'', N'SMK N1 Gunung Sitoli', N'Medan', N'081264249798', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023010', N'52244483', N'Natalia Nababan', N'2023', NULL, NULL, N'P', N'Novita Herawati Saragih', N'2', N'127101661202000-7', N'', N'SMK Yapim Indonesia', N'Jl Jermal II GG Bangun Sari IV', N'082378380710', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023011', N'1801062369', N'Rohani Mendrofa', N'2023', NULL, NULL, N'P', N'Nurmawati Zega', N'2', N'120429570305000-1', N'', N'SMK N1 Hiliserangkai', N'Dusun II Lalai', N'081281720923', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023012', N'54791405', N'Selvi Agusti Ningsih Waruwu', N'2023', NULL, NULL, N'P', N'Yunima Halawa', N'3', N'120429420504000-1', N'', N'SMK N1 Hiliserangkai', N'Fadoro Hunogoa', N'082210219987', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023013', N'10258334', N'Syaiful Bahri', N'2023', NULL, NULL, N'L', N'Masni', N'1', N'127107030388000-1', N'', N'Yayasan Emphaty', N'Jalan Nylur', N'082286476370', N'RS Stella Maris', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023014', N'0036660527', N'Widia Andriyani', N'2023', NULL, NULL, N'P', N'Ramawati', N'1', N'121813560103000-2', N'', N'SMK N ! Rokan Rulu', N'Namorambe', N'085836131263', N'RS Stella Maris', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023015', N'69877339', N'Alismawati Telaumbanua', N'2023', NULL, NULL, N'P', N'Filitina Laia', N'2', N'121403610101000-2', N'', N'SMA N1 Somamabawa', N'Sitolubanua', N'081276461127', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023016', N'9983048165', N'Andre Eriansyah ', N'2023', NULL, NULL, N'L', N'Satiani', N'1', N'127501071098000-5', N'', N'SMK Negeri 2 Binjai', N'Jl Gaharu LK IV', N'082373752189', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023017', N'0021869822', N'Fachri Ariza Rasyid', N'2023', NULL, NULL, N'L', N'Tetty Reynilda', N'1', N'127109131102000-1', N'', N'', N'Jln Pelita No 24 Medan', N'087869045178', N'RS Regina Maris', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023018', N'0033049244', N'Meldiana Fransiska Siburian', N'2023', NULL, NULL, N'P', N'Heldinar Romauli Siahaan', N'2', N'120819590403000-1', N'', N'Sma SW Tamansiswa Cabang Bah Jambi ', N'Medan ', N'082273282028', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023019', N'0042317087', N'Muhammad Azriel Azhari', N'2023', NULL, NULL, N'L', N'T. Midra Ilfa', N'1', N'127105130504000-3', N'', N'SMA Bridjen Katamso', N'BTN Sukamaju', N'', N'RS Regina Maris', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023020', N'0000200474', N'Namira Asya Adzani', N'2023', NULL, NULL, N'P', N'Suriyani', N'1', N'1271096907000000', N'', N'SMKN 1 Medan', N'Jln STM gg Aman no 26', N'', N'RS Regina Maris', NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023021', N'00436622984', N'Nia Rahmazani', N'2023', NULL, NULL, N'P', N'Rahmati', N'1', N'110316551004000-1', N'', N'SMK Negeri 1 Peureulak', N'Alue Batee', N'082312456803', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023022', N'10260464', N'Rani Hati Buulolo', N'2023', NULL, NULL, N'P', N'Riahati Telaumbanua', N'2', N'121403460101001-0', N'', N'SMA N1 Somambawa', N'Bawonuru', N'085371174180', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023023', N'12753393', N'Tia Safitri ', N'2023', NULL, NULL, N'P', N'Supini', N'1', N'120509440901000-4', N'', N'SMA Bintang Langka', N'Dusun Kepala Sungai II', N'082276888581', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023024', N'0042428750', N'Vinesia Ndruru', N'2023', NULL, NULL, N'P', N'Meliana Halawa', N'3', N'121401460504000-1', N'', N'SMA Negeri 1 Lolomatua', N'Hiliotalua', N'082370377489', NULL, NULL)
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023025', N'0005078308', N'Wahyudi Pratama Ramadhan', N'2023', NULL, NULL, N'L', N'Indra Wati', N'1', N'120726291100000-0', N'', N'SMK Kesehatan Assyfa School Banda Aceh', N'Dusun XIV Psr V No 20', N'082294944232', N'RS Regina Maris', NULL)
GO


-- ----------------------------
-- Table structure for migrations
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[migrations]') AND type IN ('U'))
	DROP TABLE [dbo].[migrations]
GO

CREATE TABLE [dbo].[migrations] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [migration] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [batch] int  NOT NULL
)
GO

ALTER TABLE [dbo].[migrations] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of migrations
-- ----------------------------
SET IDENTITY_INSERT [dbo].[migrations] ON
GO

INSERT INTO [dbo].[migrations] ([id], [migration], [batch]) VALUES (N'1', N'2019_12_14_000001_create_personal_access_tokens_table', N'1')
GO

INSERT INTO [dbo].[migrations] ([id], [migration], [batch]) VALUES (N'2', N'2024_06_27_032140_create_mahasiswas_table', N'1')
GO

INSERT INTO [dbo].[migrations] ([id], [migration], [batch]) VALUES (N'3', N'2024_06_27_033855_create_agamas_table', N'1')
GO

SET IDENTITY_INSERT [dbo].[migrations] OFF
GO


-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[personal_access_tokens]') AND type IN ('U'))
	DROP TABLE [dbo].[personal_access_tokens]
GO

CREATE TABLE [dbo].[personal_access_tokens] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [tokenable_type] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [tokenable_id] bigint  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [token] nvarchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [abilities] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [last_used_at] datetime  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL
)
GO

ALTER TABLE [dbo].[personal_access_tokens] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
SET IDENTITY_INSERT [dbo].[personal_access_tokens] ON
GO

SET IDENTITY_INSERT [dbo].[personal_access_tokens] OFF
GO


-- ----------------------------
-- Table structure for pinjam
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[pinjam]') AND type IN ('U'))
	DROP TABLE [dbo].[pinjam]
GO

CREATE TABLE [dbo].[pinjam] (
  [id] int  NOT NULL,
  [nomor] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdBy] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdAt] datetime  NOT NULL,
  [returnedAt] datetime  NULL
)
GO

ALTER TABLE [dbo].[pinjam] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'Peminjam',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'createdBy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Dikembalikan pada',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'returnedAt'
GO


-- ----------------------------
-- Records of pinjam
-- ----------------------------

-- ----------------------------
-- Table structure for pinjam_item
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[pinjam_item]') AND type IN ('U'))
	DROP TABLE [dbo].[pinjam_item]
GO

CREATE TABLE [dbo].[pinjam_item] (
  [id] int  NOT NULL,
  [pinjam] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [item] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [kondisiPinjam] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [kondisiKembali] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[pinjam_item] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of pinjam_item
-- ----------------------------

-- ----------------------------
-- Auto increment value for administrator
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[administrator]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table administrator
-- ----------------------------
ALTER TABLE [dbo].[administrator] ADD CONSTRAINT [PK__administ__3213E83F4215A810] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for agama
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[agama]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table agama
-- ----------------------------
ALTER TABLE [dbo].[agama] ADD CONSTRAINT [PK__agama__3213E83FB92EB951] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for item
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[item]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table mahasiswa
-- ----------------------------
ALTER TABLE [dbo].[mahasiswa] ADD CONSTRAINT [mahasiswa_npm_primary] PRIMARY KEY CLUSTERED ([npm])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for migrations
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[migrations]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE [dbo].[migrations] ADD CONSTRAINT [PK__migratio__3213E83F81121693] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for personal_access_tokens
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[personal_access_tokens]', RESEED, 1)
GO


-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE NONCLUSTERED INDEX [personal_access_tokens_tokenable_type_tokenable_id_index]
ON [dbo].[personal_access_tokens] (
  [tokenable_type] ASC,
  [tokenable_id] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [personal_access_tokens_token_unique]
ON [dbo].[personal_access_tokens] (
  [token] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE [dbo].[personal_access_tokens] ADD CONSTRAINT [PK__personal__3213E83F44E92D05] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table pinjam
-- ----------------------------
ALTER TABLE [dbo].[pinjam] ADD CONSTRAINT [PK__peminjam__3213E83F3630B163] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table pinjam_item
-- ----------------------------
ALTER TABLE [dbo].[pinjam_item] ADD CONSTRAINT [PK__pinjam_b__3213E83F069E4876] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

