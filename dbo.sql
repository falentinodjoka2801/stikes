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

 Date: 03/07/2024 17:01:17
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

INSERT INTO [dbo].[administrator] ([id], [foto], [nama], [alamat], [email], [telepon], [username], [password], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'5', NULL, N'Huwaina', N'Jl.', N'huwaina@gmail.com', N'081265390424', N'huwaina', N'5f4dcc3b5aa765d61d8327deb882cf99', N'2', N'2024-07-02 10:04:10.000', NULL, NULL)
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
  [id] int  IDENTITY(1,1) NOT NULL,
  [createdBy] int  NULL,
  [createdAt] datetime  NULL,
  [updatedBy] int  NULL,
  [updatedAt] datetime  NULL,
  [quantityStok] int  NULL,
  [quantityPinjam] int  NULL
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

EXEC sp_addextendedproperty
'MS_Description', N'Quantity yang tersedia',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'quantityStok'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Quantity yang dipinjam',
'SCHEMA', N'dbo',
'TABLE', N'item',
'COLUMN', N'quantityPinjam'
GO


-- ----------------------------
-- Records of item
-- ----------------------------
SET IDENTITY_INSERT [dbo].[item] ON
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1000', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1001', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1002', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1003', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702110', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1004', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702120', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1005', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702130', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1006', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702140', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1007', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702150', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1008', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702160', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1009', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702170', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1010', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702180', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1011', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702190', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1012', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1013', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702210', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1014', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702220', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1015', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702230', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1016', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702240', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1017', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702250', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1018', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702260', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1019', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702270', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1020', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702280', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1021', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702290', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1022', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1023', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702310', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1024', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702320', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1025', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702330', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1026', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702340', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1027', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702350', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1028', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702360', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1029', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Nierbeken Besar', N'3', N'-', N'bagus', N'ready', NULL, N'1030', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Nierbeken Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1031', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Nierbeken Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1032', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1033', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1034', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1035', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1036', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1037', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1038', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Kom Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1039', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1040', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kom Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1041', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Kom Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1042', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Kom Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1043', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom Besar', N'3', N'-', N'bagus', N'ready', NULL, N'1044', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1045', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1046', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1047', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1048', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1049', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1050', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Korentang set', N'3', N'-', N'bagus', N'ready', NULL, N'1051', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Wadah Korentang', N'3', N'-', N'bagus', N'ready', NULL, N'1052', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Pinset Anatomis ', N'3', N'-', N'bagus', N'ready', NULL, N'1053', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Pinset Anatomis ', N'3', N'-', N'bagus', N'ready', NULL, N'1054', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Pinset Anatomis ', N'3', N'-', N'bagus', N'ready', NULL, N'1055', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Pinset Anatomis ', N'3', N'-', N'bagus', N'ready', NULL, N'1056', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Pinset Anatomis ', N'3', N'-', N'bagus', N'ready', NULL, N'1057', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Pinset Chirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1058', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Pinset Chirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1059', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Pinset Chirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1060', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Pinset Chirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1061', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Pinset Chirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1062', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Pinset Chirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1063', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Refleks Hammer', N'3', N'-', N'bagus', N'ready', NULL, N'1064', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Refleks Hammer', N'3', N'-', N'bagus', N'ready', NULL, N'1065', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Refleks Hammer', N'3', N'-', N'bagus', N'ready', NULL, N'1066', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Refleks Hammer', N'3', N'-', N'bagus', N'ready', NULL, N'1067', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Refleks Hammer', N'3', N'-', N'bagus', N'ready', NULL, N'1068', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Refleks Hammer', N'3', N'-', N'bagus', N'ready', NULL, N'1069', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gunting Tali Pusar', N'3', N'-', N'bagus', N'ready', NULL, N'1070', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702100', N'Laboratorium Anak', N'5', N'-', N'bagus', N'dipinjam', N'2023001', N'1574', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702200', N'Laboratorium Keluarga Berencana', N'5', N'-', N'bagus', N'dipinjam', N'2023001', N'1575', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702300', N'Laboratorium Antenatal Care', N'5', N'-', N'bagus', N'ready', NULL, N'1576', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702400', N'Laboratorium Post Natal Care', N'5', N'-', N'bagus', N'ready', NULL, N'1577', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702500', N'Laboratorium Komunitas', N'5', N'-', N'bagus', N'ready', NULL, N'1578', N'2', N'2024-07-02 15:54:17.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702112', N'Laboratorium EPIDEMIOLOGI', N'5', N'-', N'bagus', N'ready', NULL, N'1585', N'2', N'2024-07-02 16:05:16.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702600', N'Laboratorium Bayi Baru Lahir', N'5', N'-', N'bagus', N'ready', NULL, N'1579', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702700', N'Laboratorium Internatal Care', N'5', N'-', N'bagus', N'ready', NULL, N'1580', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702800', N'Laboratorium Konseling Care', N'5', N'-', N'bagus', N'ready', NULL, N'1581', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702900', N'Laboratorium Keterampilan Dasar', N'5', N'-', N'bagus', N'ready', NULL, N'1582', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702010', N'Laboratorium Gerontik', N'5', N'-', N'bagus', N'ready', NULL, N'1583', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702011', N'Laboratorium Medikal Bedah', N'5', N'-', N'bagus', N'ready', NULL, N'1584', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702012', N'Laboratorium AUDIVISUAL', N'5', N'-', N'bagus', N'ready', NULL, N'1586', N'2', N'2024-07-02 16:06:33.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702013', N'Laboratorium Komputer 1', N'5', N'-', N'bagus', N'ready', NULL, N'1587', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702014', N'Laboratorium Komputer 2', N'5', N'-', N'bagus', N'ready', NULL, N'1588', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702015', N'Laboratorium Keselamatan dan Kesehatan Kerja', N'5', N'-', N'bagus', N'ready', NULL, N'1589', N'2', N'2024-07-02 16:09:36.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702016', N'Laboratorium Kesehatan Lingkungan', N'5', N'-', N'bagus', N'ready', NULL, N'1590', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702017', N'Laboratorium Gizi dan Diet', N'5', N'-', N'bagus', N'ready', NULL, N'1591', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702018', N'Laboratorium Farmakologi', N'5', N'-', N'bagus', N'ready', NULL, N'1592', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702019', N'Laboratorium Jiwa', N'5', N'-', N'bagus', N'ready', NULL, N'1593', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'R20240702020', N'Laboratorium Biomedik', N'5', N'-', N'bagus', N'ready', NULL, N'1594', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Ambubag', N'3', N'-', N'bagus', N'ready', NULL, N'927', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Ambubag', N'3', N'-', N'bagus', N'ready', NULL, N'928', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'ETT 3,5', N'11', N'-', N'bagus', N'dipinjam', N'2023001', N'929', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'ETT 3,5', N'11', N'-', N'bagus', N'dipinjam', N'2023001', N'930', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'ETT 3,5', N'11', N'-', N'bagus', N'dipinjam', N'2023001', N'931', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'ETT 3,5', N'11', N'-', N'bagus', N'ready', NULL, N'932', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'ETT 3,5', N'11', N'-', N'bagus', N'dipinjam', N'2023001', N'933', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'ETT 6,5', N'11', N'-', N'bagus', N'dipinjam', N'2023001', N'934', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'ETT 6,5', N'11', N'-', N'bagus', N'ready', NULL, N'935', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'ETT 6,5', N'11', N'-', N'bagus', N'ready', NULL, N'936', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'ETT 2,5', N'11', N'-', N'bagus', N'ready', NULL, N'937', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'LMA', N'11', N'-', N'bagus', N'ready', NULL, N'938', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'NRM Dewasa', N'11', N'-', N'bagus', N'ready', NULL, N'939', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'NRM Dewasa', N'11', N'-', N'bagus', N'ready', NULL, N'940', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'NRM Dewasa', N'11', N'-', N'bagus', N'ready', NULL, N'941', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'NRM Anak', N'11', N'-', N'bagus', N'ready', NULL, N'942', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'NRM Anak', N'11', N'-', N'bagus', N'ready', NULL, N'943', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'NRM Anak', N'11', N'-', N'bagus', N'ready', NULL, N'944', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Sungkup Dewasa', N'11', N'-', N'bagus', N'ready', NULL, N'945', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Selang Nebulizer', N'11', N'-', N'bagus', N'ready', NULL, N'946', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Guedel 0', N'3', N'-', N'bagus', N'ready', NULL, N'947', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Guedel 0', N'3', N'-', N'bagus', N'ready', NULL, N'948', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Guedel 0', N'3', N'-', N'bagus', N'ready', NULL, N'949', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Guedel 1', N'3', N'-', N'bagus', N'ready', NULL, N'950', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Guedel 1', N'3', N'-', N'bagus', N'ready', NULL, N'951', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Guedel 1', N'3', N'-', N'bagus', N'ready', NULL, N'952', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Guedel 1', N'3', N'-', N'bagus', N'ready', NULL, N'953', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Guedel 2', N'3', N'-', N'bagus', N'ready', NULL, N'954', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Guedel 2', N'3', N'-', N'bagus', N'ready', NULL, N'955', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Guedel 2', N'3', N'-', N'bagus', N'ready', NULL, N'956', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Guedel 3', N'3', N'-', N'bagus', N'ready', NULL, N'957', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Guedel 4', N'3', N'-', N'bagus', N'ready', NULL, N'958', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Guedel 5', N'3', N'-', N'bagus', N'ready', NULL, N'959', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Guedel 5', N'3', N'-', N'bagus', N'ready', NULL, N'960', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Suction Catheter No.14', N'11', N'-', N'bagus', N'ready', NULL, N'961', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'NGT No.16', N'11', N'-', N'bagus', N'ready', NULL, N'962', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'NGT No.16', N'11', N'-', N'bagus', N'ready', NULL, N'963', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'NGT No.16', N'11', N'-', N'bagus', N'ready', NULL, N'964', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'NGT No.14', N'11', N'-', N'bagus', N'ready', NULL, N'965', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Handscoen Steril No.7,5 ', N'11', N'-', N'bagus', N'dipinjam', N'2023001', N'966', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Handscoen Steril No.7,5 ', N'11', N'-', N'bagus', N'ready', NULL, N'967', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Handscoen Steril No.7,5 ', N'11', N'-', N'bagus', N'ready', NULL, N'968', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Handscoen Steril No.7', N'11', N'-', N'bagus', N'ready', NULL, N'969', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Nassal Oksigen Anak', N'11', N'-', N'bagus', N'ready', NULL, N'970', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Nassal Oksigen Anak', N'11', N'-', N'bagus', N'ready', NULL, N'971', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Nassal Oksigen Anak', N'11', N'-', N'bagus', N'ready', NULL, N'972', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Nassal Oksigen Anak', N'11', N'-', N'bagus', N'ready', NULL, N'973', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Nassal Oksigen Anak', N'11', N'-', N'bagus', N'ready', NULL, N'974', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Nassal Oksigen Bayi', N'11', N'-', N'bagus', N'ready', NULL, N'975', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Nassal Oksigen Bayi', N'11', N'-', N'bagus', N'ready', NULL, N'976', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Nassal Oksigen Dewasa', N'11', N'-', N'bagus', N'ready', NULL, N'977', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Nassal Oksigen Dewasa', N'11', N'-', N'bagus', N'ready', NULL, N'978', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Infus Set Mikro', N'11', N'-', N'bagus', N'ready', NULL, N'979', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Infus Set Mikro', N'11', N'-', N'bagus', N'ready', NULL, N'980', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Infus Set Mikro', N'11', N'-', N'bagus', N'ready', NULL, N'981', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Infus Set Mikro', N'11', N'-', N'bagus', N'ready', NULL, N'982', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Infus Set Mikro', N'11', N'-', N'bagus', N'ready', NULL, N'983', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Infus Set Mikro', N'11', N'-', N'bagus', N'ready', NULL, N'984', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Infus Set Makro', N'11', N'-', N'bagus', N'ready', NULL, N'985', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Infus Set Makro', N'11', N'-', N'bagus', N'ready', NULL, N'986', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Bak Instrumen Besar', N'3', N'-', N'bagus', N'ready', NULL, N'987', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Bak Instrumen Besar', N'3', N'-', N'bagus', N'ready', NULL, N'988', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Bak Instrumen Besar', N'3', N'-', N'bagus', N'ready', NULL, N'989', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Bak Instrumen Besar', N'3', N'-', N'bagus', N'ready', NULL, N'990', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Bak Injeksi', N'3', N'-', N'bagus', N'ready', NULL, N'991', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Bak Injeksi', N'3', N'-', N'bagus', N'ready', NULL, N'992', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Bak Injeksi', N'3', N'-', N'bagus', N'ready', NULL, N'993', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'994', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'995', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'996', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'997', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'998', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Nierbeken Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'999', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gunting Epsiotomi', N'3', N'-', N'bagus', N'ready', NULL, N'1071', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1072', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1073', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1074', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1075', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1076', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1077', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Gunting Jaringan', N'3', N'-', N'bagus', N'ready', NULL, N'1078', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1079', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1080', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1081', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1082', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1083', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1084', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1085', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1086', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1087', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1088', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702110', N'Nalt Holder', N'3', N'-', N'bagus', N'ready', NULL, N'1089', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Arteri Klem Bengkok', N'3', N'-', N'bagus', N'ready', NULL, N'1090', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Arteri Klem Bengkok', N'3', N'-', N'bagus', N'ready', NULL, N'1091', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Arteri Klem Bengkok', N'3', N'-', N'bagus', N'ready', NULL, N'1092', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Arteri Klem Bengkok', N'3', N'-', N'bagus', N'ready', NULL, N'1093', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Arteri Klem Bengkok', N'3', N'-', N'bagus', N'ready', NULL, N'1094', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Arteri Klem Bengkok', N'3', N'-', N'bagus', N'ready', NULL, N'1095', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1096', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1097', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1098', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1099', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1100', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1101', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1102', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Arteri Klem Lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1103', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1104', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1105', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1106', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1107', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1108', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1109', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Tongue Spatel', N'3', N'-', N'bagus', N'ready', NULL, N'1110', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Stick Sprayer Mata Kecil', N'3', N'-', N'bagus', N'ready', NULL, N'1111', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Stick Sprayer Mata Sedang', N'3', N'-', N'bagus', N'ready', NULL, N'1112', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Stick Sprayer Mata Besar', N'3', N'-', N'bagus', N'ready', NULL, N'1113', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Klem Implan', N'3', N'-', N'bagus', N'ready', NULL, N'1114', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Corong Kaca', N'3', N'-', N'bagus', N'ready', NULL, N'1115', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Corong Kaca', N'3', N'-', N'bagus', N'ready', NULL, N'1116', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Corong Kaca', N'3', N'-', N'bagus', N'ready', NULL, N'1117', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Corong Kaca', N'3', N'-', N'bagus', N'ready', NULL, N'1118', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Corong Kaca', N'3', N'-', N'bagus', N'ready', NULL, N'1119', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Corong Kaca', N'3', N'-', N'bagus', N'ready', NULL, N'1120', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Tetes Telinga', N'11', N'-', N'bagus', N'ready', NULL, N'1121', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Tetes Telinga', N'11', N'-', N'bagus', N'ready', NULL, N'1122', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Tetes Telinga', N'11', N'-', N'bagus', N'ready', NULL, N'1123', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1124', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1125', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1126', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1127', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1128', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1129', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1130', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Tempat Sampel Urin', N'3', N'-', N'bagus', N'ready', NULL, N'1131', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1132', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1133', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1134', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1135', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1136', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1137', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1138', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1139', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1140', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tabung Reaksi', N'3', N'-', N'bagus', N'ready', NULL, N'1141', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Spuit Gliserin', N'3', N'-', N'bagus', N'ready', NULL, N'1142', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Spuit Gliserin', N'3', N'-', N'bagus', N'ready', NULL, N'1143', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Ompreng', N'3', N'-', N'bagus', N'ready', NULL, N'1144', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Ompreng', N'3', N'-', N'bagus', N'ready', NULL, N'1145', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Stetoskop ', N'3', N'-', N'bagus', N'ready', NULL, N'1146', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Baki', N'3', N'-', N'bagus', N'ready', NULL, N'1147', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Baki', N'3', N'-', N'bagus', N'ready', NULL, N'1148', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Baki', N'3', N'-', N'bagus', N'ready', NULL, N'1149', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1150', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1151', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1152', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1153', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1154', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1155', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Extension Tube', N'11', N'-', N'bagus', N'ready', NULL, N'1156', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1157', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1158', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1159', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1160', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1161', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1162', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1163', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1164', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1165', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1166', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Abocath No.26', N'11', N'-', N'bagus', N'ready', NULL, N'1167', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Abocath No.24', N'11', N'-', N'bagus', N'ready', NULL, N'1168', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Abocath No.20', N'11', N'-', N'bagus', N'ready', NULL, N'1169', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Abocath No.20', N'11', N'-', N'bagus', N'ready', NULL, N'1170', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Abocath No.20', N'11', N'-', N'bagus', N'ready', NULL, N'1171', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Abocath No.20', N'11', N'-', N'bagus', N'ready', NULL, N'1172', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Abocath No.20', N'11', N'-', N'bagus', N'ready', NULL, N'1173', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Abocath No.20', N'11', N'-', N'bagus', N'ready', NULL, N'1174', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1175', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1176', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1177', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1178', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1179', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1180', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Abocath No.18', N'11', N'-', N'bagus', N'ready', NULL, N'1181', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1182', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1183', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1184', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1185', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1186', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1187', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1188', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1189', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1190', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1191', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1192', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702120', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1193', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702130', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1194', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702140', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1195', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702150', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1196', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1197', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1198', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1199', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1200', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1201', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1202', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1203', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1204', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1205', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1206', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1207', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1208', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1209', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1210', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1211', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1212', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1213', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1214', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702120', N'Spuit 5cc', N'11', N'-', N'bagus', N'ready', NULL, N'1215', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1216', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1217', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1218', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1219', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1220', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1221', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1222', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1223', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1224', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1225', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1226', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702120', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1227', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702130', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1228', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702140', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1229', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702150', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1230', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702160', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1231', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702170', N'Spuit 10cc', N'11', N'-', N'bagus', N'ready', NULL, N'1232', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 30cc', N'11', N'-', N'bagus', N'ready', NULL, N'1233', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Spuit 30cc', N'11', N'-', N'bagus', N'ready', NULL, N'1234', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Spuit 30cc', N'11', N'-', N'bagus', N'ready', NULL, N'1235', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 50cc', N'11', N'-', N'bagus', N'ready', NULL, N'1236', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Spuit 50cc', N'11', N'-', N'bagus', N'ready', NULL, N'1237', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Spuit 50cc', N'11', N'-', N'bagus', N'ready', NULL, N'1238', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1239', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1240', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1241', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1242', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1243', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1244', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1245', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Wingidel', N'11', N'-', N'bagus', N'ready', NULL, N'1246', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1247', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1248', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1249', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1250', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1251', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1252', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1253', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1254', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1255', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1256', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Threeway', N'11', N'-', N'bagus', N'ready', NULL, N'1257', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1258', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1259', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1260', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1261', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1262', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1263', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1264', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1265', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1266', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1267', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1268', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702120', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1269', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702130', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1270', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702140', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1271', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702150', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1272', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702160', N'Kapas Lidi', N'11', N'-', N'bagus', N'ready', NULL, N'1273', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 1cc', N'11', N'-', N'bagus', N'ready', NULL, N'1274', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Spuit 3cc', N'11', N'-', N'bagus', N'ready', NULL, N'1275', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Foley Catheter No.12', N'11', N'-', N'bagus', N'ready', NULL, N'1276', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Foley Catheter No.14', N'11', N'-', N'bagus', N'ready', NULL, N'1277', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Foley Catheter No.14', N'11', N'-', N'bagus', N'ready', NULL, N'1278', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Foley Catheter No.16', N'11', N'-', N'bagus', N'ready', NULL, N'1279', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Foley Catheter No.16', N'11', N'-', N'bagus', N'ready', NULL, N'1280', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Foley Catheter No. 18', N'11', N'-', N'bagus', N'ready', NULL, N'1281', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Foley Catheter No. 18', N'11', N'-', N'bagus', N'ready', NULL, N'1282', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Foley Catheter No. 18', N'11', N'-', N'bagus', N'ready', NULL, N'1283', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Foley Catheter No. 18', N'11', N'-', N'bagus', N'ready', NULL, N'1284', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Foley Catheter No. 18', N'11', N'-', N'bagus', N'ready', NULL, N'1285', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Ners Cap', N'11', N'-', N'bagus', N'ready', NULL, N'1286', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Urin Bag', N'11', N'-', N'bagus', N'ready', NULL, N'1287', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1288', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1289', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1290', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1291', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1292', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702600', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1293', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702700', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1294', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702800', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1295', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702900', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1296', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1297', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702110', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1298', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702120', N'Benang/Hecting', N'11', N'-', N'bagus', N'ready', NULL, N'1299', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Tegaderm', N'11', N'-', N'bagus', N'ready', NULL, N'1300', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Tegaderm', N'11', N'-', N'bagus', N'ready', NULL, N'1301', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tourniquet', N'3', N'-', N'bagus', N'ready', NULL, N'1302', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Tourniquet', N'3', N'-', N'bagus', N'ready', NULL, N'1303', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Tourniquet', N'3', N'-', N'bagus', N'ready', NULL, N'1304', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Tourniquet', N'3', N'-', N'bagus', N'ready', NULL, N'1305', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Baju bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1306', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Baju bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1307', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Baju bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1308', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Baju bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1309', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Baju bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1310', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tali dua', N'3', N'-', N'bagus', N'ready', NULL, N'1311', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Tali dua', N'3', N'-', N'bagus', N'ready', NULL, N'1312', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Tali dua', N'3', N'-', N'bagus', N'ready', NULL, N'1313', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Tali dua', N'3', N'-', N'bagus', N'ready', NULL, N'1314', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Tali dua', N'3', N'-', N'bagus', N'ready', NULL, N'1315', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Topi', N'3', N'-', N'bagus', N'ready', NULL, N'1316', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Topi', N'3', N'-', N'bagus', N'ready', NULL, N'1317', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Topi', N'3', N'-', N'bagus', N'ready', NULL, N'1318', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Topi', N'3', N'-', N'bagus', N'ready', NULL, N'1319', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Topi', N'3', N'-', N'bagus', N'ready', NULL, N'1320', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Bedong', N'3', N'-', N'bagus', N'ready', NULL, N'1321', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Bedong', N'3', N'-', N'bagus', N'ready', NULL, N'1322', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Bedong', N'3', N'-', N'bagus', N'ready', NULL, N'1323', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Bedong', N'3', N'-', N'bagus', N'ready', NULL, N'1324', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Bedong', N'3', N'-', N'bagus', N'ready', NULL, N'1325', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Sarung tangan + kaki', N'3', N'-', N'bagus', N'ready', NULL, N'1326', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Sarung tangan + kaki', N'3', N'-', N'bagus', N'ready', NULL, N'1327', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Sarung tangan + kaki', N'3', N'-', N'bagus', N'ready', NULL, N'1328', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Sarung tangan + kaki', N'3', N'-', N'bagus', N'ready', NULL, N'1329', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Sarung tangan + kaki', N'3', N'-', N'bagus', N'ready', NULL, N'1330', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Handuk bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1331', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Handuk bayi', N'3', N'-', N'bagus', N'ready', NULL, N'1332', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Sabun mandi bayi', N'11', N'-', N'bagus', N'ready', NULL, N'1333', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Shampoo bayi', N'11', N'-', N'bagus', N'ready', NULL, N'1334', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Dele/slim seher', N'11', N'-', N'bagus', N'ready', NULL, N'1335', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Vaksin BCG', N'11', N'-', N'bagus', N'ready', NULL, N'1336', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Vaksin BCG', N'11', N'-', N'bagus', N'ready', NULL, N'1337', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Vaksin BCG', N'11', N'-', N'bagus', N'ready', NULL, N'1338', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Vaksin Polio', N'11', N'-', N'bagus', N'ready', NULL, N'1339', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Vaksin Polio', N'11', N'-', N'bagus', N'ready', NULL, N'1340', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Vaksin Polio', N'11', N'-', N'bagus', N'ready', NULL, N'1341', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Vaksin Hepatitis', N'11', N'-', N'bagus', N'ready', NULL, N'1342', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Vaksin Hepatitis', N'11', N'-', N'bagus', N'ready', NULL, N'1343', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Vaksin Hepatitis', N'11', N'-', N'bagus', N'ready', NULL, N'1344', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Vaksin DPT', N'11', N'-', N'bagus', N'ready', NULL, N'1345', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Vaksin DPT', N'11', N'-', N'bagus', N'ready', NULL, N'1346', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Vaksin DPT', N'11', N'-', N'bagus', N'ready', NULL, N'1347', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Vaksin campak', N'11', N'-', N'bagus', N'ready', NULL, N'1348', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Vaksin campak', N'11', N'-', N'bagus', N'ready', NULL, N'1349', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Vaksin campak', N'11', N'-', N'bagus', N'ready', NULL, N'1350', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Salep mata', N'11', N'-', N'bagus', N'ready', NULL, N'1351', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Salep mata', N'11', N'-', N'bagus', N'ready', NULL, N'1352', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Salep mata', N'11', N'-', N'bagus', N'ready', NULL, N'1353', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Bak instrumen besar', N'3', N'-', N'bagus', N'ready', NULL, N'1354', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1355', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1356', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1357', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1358', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1359', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1360', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1361', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1362', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1363', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Arteri klem lurus', N'3', N'-', N'bagus', N'ready', NULL, N'1364', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gunting episiotomy', N'3', N'-', N'bagus', N'ready', NULL, N'1365', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gunting tali pusat', N'3', N'-', N'bagus', N'ready', NULL, N'1366', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'½ koher', N'3', N'-', N'bagus', N'ready', NULL, N'1367', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Piring plasenta', N'3', N'-', N'bagus', N'ready', NULL, N'1368', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1369', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1370', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1371', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1372', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1373', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1374', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1375', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1376', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1377', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom kecil (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1378', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Trolley 3 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1379', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Trolley 3 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1380', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Trolley 3 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1381', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1382', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1383', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1384', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1385', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1386', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1387', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1388', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1389', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1390', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kom sedang (bertutup)', N'3', N'-', N'bagus', N'ready', NULL, N'1391', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Sarung', N'3', N'-', N'bagus', N'ready', NULL, N'1392', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Sarung', N'3', N'-', N'bagus', N'ready', NULL, N'1393', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Umbilical cord', N'3', N'-', N'bagus', N'ready', NULL, N'1394', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Umbilical cord', N'3', N'-', N'bagus', N'ready', NULL, N'1395', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Umbilical cord', N'3', N'-', N'bagus', N'ready', NULL, N'1396', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Umbilical cord', N'3', N'-', N'bagus', N'ready', NULL, N'1397', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Umbilical cord', N'3', N'-', N'bagus', N'ready', NULL, N'1398', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Okitosin ', N'11', N'-', N'bagus', N'ready', NULL, N'1399', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Okitosin ', N'11', N'-', N'bagus', N'ready', NULL, N'1400', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Okitosin ', N'11', N'-', N'bagus', N'ready', NULL, N'1401', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Celana dalam dewasa', N'3', N'-', N'bagus', N'ready', NULL, N'1402', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Celana dalam dewasa', N'3', N'-', N'bagus', N'ready', NULL, N'1403', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Under pad/ perlak', N'3', N'-', N'bagus', N'ready', NULL, N'1404', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Under pad/ perlak', N'3', N'-', N'bagus', N'ready', NULL, N'1405', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Handscoon panjang', N'11', N'-', N'bagus', N'ready', NULL, N'1406', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Handscoon panjang', N'11', N'-', N'bagus', N'ready', NULL, N'1407', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Handscoon panjang', N'11', N'-', N'bagus', N'ready', NULL, N'1408', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702400', N'Handscoon panjang', N'11', N'-', N'bagus', N'ready', NULL, N'1409', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702500', N'Handscoon panjang', N'11', N'-', N'bagus', N'ready', NULL, N'1410', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Celemek', N'3', N'-', N'bagus', N'ready', NULL, N'1411', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Celemek', N'3', N'-', N'bagus', N'ready', NULL, N'1412', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Celemek', N'3', N'-', N'bagus', N'ready', NULL, N'1413', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Celemek', N'3', N'-', N'bagus', N'ready', NULL, N'1414', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Celemek', N'3', N'-', N'bagus', N'ready', NULL, N'1415', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Sepatu boot', N'3', N'-', N'bagus', N'ready', NULL, N'1416', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Sepatu boot', N'3', N'-', N'bagus', N'ready', NULL, N'1417', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kaca mata google', N'3', N'-', N'bagus', N'ready', NULL, N'1418', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kaca mata google', N'3', N'-', N'bagus', N'ready', NULL, N'1419', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1420', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1421', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1422', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1423', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1424', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1425', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1426', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1427', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1428', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Pinset anatomis', N'3', N'-', N'bagus', N'ready', NULL, N'1429', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1430', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1431', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1432', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1433', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1434', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1435', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1436', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1437', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1438', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Pinset sirurgis', N'3', N'-', N'bagus', N'ready', NULL, N'1439', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'korentang', N'3', N'-', N'bagus', N'ready', NULL, N'1440', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'korentang', N'3', N'-', N'bagus', N'ready', NULL, N'1441', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tromol besar', N'3', N'-', N'bagus', N'ready', NULL, N'1442', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Speculum vagina', N'3', N'-', N'bagus', N'ready', NULL, N'1443', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Speculum vagina', N'3', N'-', N'bagus', N'ready', NULL, N'1444', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Sonde uterus', N'3', N'-', N'bagus', N'ready', NULL, N'1445', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Sonde uterus', N'3', N'-', N'bagus', N'ready', NULL, N'1446', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Tenakulum ', N'3', N'-', N'bagus', N'ready', NULL, N'1447', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Tenakulum ', N'3', N'-', N'bagus', N'ready', NULL, N'1448', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Forceps ', N'3', N'-', N'bagus', N'ready', NULL, N'1449', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Forceps ', N'3', N'-', N'bagus', N'ready', NULL, N'1450', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Baju pasien + celana', N'3', N'-', N'bagus', N'ready', NULL, N'1451', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Baju pasien + celana', N'3', N'-', N'bagus', N'ready', NULL, N'1452', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gown pasien ', N'3', N'-', N'bagus', N'ready', NULL, N'1453', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Gown pasien ', N'3', N'-', N'bagus', N'ready', NULL, N'1454', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Gown pasien ', N'3', N'-', N'bagus', N'ready', NULL, N'1455', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Gown pasien ', N'3', N'-', N'bagus', N'ready', NULL, N'1456', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Gown pasien ', N'3', N'-', N'bagus', N'ready', NULL, N'1457', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Handuk dewasa', N'3', N'-', N'bagus', N'ready', NULL, N'1458', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Handuk dewasa', N'3', N'-', N'bagus', N'ready', NULL, N'1459', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Sikat gigi', N'11', N'-', N'bagus', N'ready', NULL, N'1460', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Sikat gigi', N'11', N'-', N'bagus', N'ready', NULL, N'1461', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Pasta gigi', N'11', N'-', N'bagus', N'ready', NULL, N'1462', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Gelas kumur', N'3', N'-', N'bagus', N'ready', NULL, N'1463', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Trolley tindakan 2 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1464', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Trolley tindakan 2 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1465', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Trolley tindakan 2 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1466', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Trolley tindakan 2 tingkat', N'3', N'-', N'bagus', N'ready', NULL, N'1467', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Trolley emergency +isi', N'3', N'-', N'bagus', N'ready', NULL, N'1468', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1469', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1470', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1471', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702400', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1472', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702500', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1473', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702600', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1474', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702700', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1475', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702800', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1476', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702900', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1477', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kasa steril', N'3', N'-', N'bagus', N'ready', NULL, N'1478', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Kapas cebok', N'11', N'-', N'bagus', N'ready', NULL, N'1479', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Pembalut wanita (camelux)', N'11', N'-', N'bagus', N'ready', NULL, N'1480', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Akkohol 76%', N'11', N'-', N'bagus', N'ready', NULL, N'1481', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Bethadine ', N'11', N'-', N'bagus', N'ready', NULL, N'1482', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702100', N'Pil KB', N'11', N'-', N'bagus', N'ready', NULL, N'1483', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702200', N'Pil KB', N'11', N'-', N'bagus', N'ready', NULL, N'1484', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'BHP20240702300', N'Pil KB', N'11', N'-', N'bagus', N'ready', NULL, N'1485', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Kondom', N'3', N'-', N'bagus', N'ready', NULL, N'1486', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Kondom', N'3', N'-', N'bagus', N'ready', NULL, N'1487', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Kondom', N'3', N'-', N'bagus', N'ready', NULL, N'1488', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'IUD', N'3', N'-', N'bagus', N'ready', NULL, N'1489', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'IUD', N'3', N'-', N'bagus', N'ready', NULL, N'1490', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'IUD', N'3', N'-', N'bagus', N'ready', NULL, N'1491', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702100', N'Implan ', N'3', N'-', N'bagus', N'ready', NULL, N'1492', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702200', N'Implan ', N'3', N'-', N'bagus', N'ready', NULL, N'1493', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'A20240702300', N'Implan ', N'3', N'-', N'bagus', N'ready', NULL, N'1494', N'2', N'2024-07-02 15:22:00.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1495', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Perkembangan Janin', N'10', N'-', N'bagus', N'dipinjam', N'2023001', N'1496', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702300', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1497', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702400', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1498', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702500', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1499', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702600', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1500', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702700', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1501', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702800', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1502', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702900', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1503', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Perkembangan Janin', N'10', N'-', N'bagus', N'ready', NULL, N'1504', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Bayi', N'10', N'-', N'bagus', N'ready', NULL, N'1505', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Bayi', N'10', N'-', N'bagus', N'ready', NULL, N'1506', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Bayi Baru Lahir', N'10', N'-', N'bagus', N'ready', NULL, N'1507', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Bayi Baru Lahir', N'10', N'-', N'bagus', N'ready', NULL, N'1508', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Bayi Leng. Plasenta', N'10', N'-', N'bagus', N'ready', NULL, N'1509', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Bayi Leng. Plasenta', N'10', N'-', N'bagus', N'ready', NULL, N'1510', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Dilatasi Vagina', N'10', N'-', N'bagus', N'ready', NULL, N'1511', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Dilatasi Vagina', N'10', N'-', N'bagus', N'ready', NULL, N'1512', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Payudara', N'10', N'-', N'bagus', N'ready', NULL, N'1513', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Vagina', N'10', N'-', N'bagus', N'ready', NULL, N'1514', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Vagina', N'10', N'-', N'bagus', N'ready', NULL, N'1515', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702300', N'Vagina', N'10', N'-', N'bagus', N'ready', NULL, N'1516', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702400', N'Vagina', N'10', N'-', N'bagus', N'ready', NULL, N'1517', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Penis', N'10', N'-', N'bagus', N'ready', NULL, N'1518', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Penis', N'10', N'-', N'bagus', N'ready', NULL, N'1519', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702300', N'Penis', N'10', N'-', N'bagus', N'ready', NULL, N'1520', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Karpal', N'10', N'-', N'bagus', N'ready', NULL, N'1521', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Karpal', N'10', N'-', N'bagus', N'ready', NULL, N'1522', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Kepala Bayi', N'10', N'-', N'bagus', N'ready', NULL, N'1523', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Dental', N'10', N'-', N'bagus', N'ready', NULL, N'1524', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Dental', N'10', N'-', N'bagus', N'ready', NULL, N'1525', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702300', N'Dental', N'10', N'-', N'bagus', N'ready', NULL, N'1526', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702400', N'Dental', N'10', N'-', N'bagus', N'ready', NULL, N'1527', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Dekubitus', N'10', N'-', N'bagus', N'ready', NULL, N'1528', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Perawatan Kolostomi', N'10', N'-', N'bagus', N'ready', NULL, N'1529', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Suture Pad ', N'10', N'-', N'bagus', N'ready', NULL, N'1530', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702200', N'Suture Pad ', N'10', N'-', N'bagus', N'ready', NULL, N'1531', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702300', N'Suture Pad ', N'10', N'-', N'bagus', N'ready', NULL, N'1532', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'RJP', N'10', N'-', N'bagus', N'ready', NULL, N'1533', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Lengan Infus', N'10', N'-', N'bagus', N'ready', NULL, N'1534', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Inkubasi Bayi', N'10', N'-', N'bagus', N'ready', NULL, N'1535', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Organ Tubuh Uk. Besar', N'10', N'-', N'bagus', N'ready', NULL, N'1536', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Organ Tubuh Uk. Kecil', N'10', N'-', N'bagus', N'ready', NULL, N'1537', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Sistem Kerangka Manusia', N'10', N'-', N'bagus', N'ready', NULL, N'1538', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Human Celebral Artery', N'10', N'-', N'bagus', N'ready', NULL, N'1539', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Bola Mata', N'10', N'-', N'bagus', N'ready', NULL, N'1540', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Kerangka Tulang Sendi Bahu', N'10', N'-', N'bagus', N'ready', NULL, N'1541', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Kerangka Tulang Panggul', N'10', N'-', N'bagus', N'ready', NULL, N'1542', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Kerangka Foot Joint with Ligamen', N'10', N'-', N'bagus', N'ready', NULL, N'1543', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Jantung', N'10', N'-', N'bagus', N'ready', NULL, N'1544', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Lambung', N'10', N'-', N'bagus', N'ready', NULL, N'1545', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Pankreas', N'10', N'-', N'bagus', N'ready', NULL, N'1546', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Ginjal', N'10', N'-', N'bagus', N'ready', NULL, N'1547', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Hati', N'10', N'-', N'bagus', N'ready', NULL, N'1548', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Kantong Empedu', N'10', N'-', N'bagus', N'ready', NULL, N'1549', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Sistem Perkemihan', N'10', N'-', N'bagus', N'ready', NULL, N'1550', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Sistem Perkemihan Laki-Laki', N'10', N'-', N'bagus', N'ready', NULL, N'1551', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Phantom payudara', N'10', N'-', N'bagus', N'ready', NULL, N'1552', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Phantom uterus', N'10', N'-', N'bagus', N'ready', NULL, N'1553', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Phantom pemasangan IUD', N'10', N'-', N'bagus', N'ready', NULL, N'1554', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Phantom pemasangan implan', N'10', N'-', N'bagus', N'ready', NULL, N'1555', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt], [quantityStok], [quantityPinjam]) VALUES (N'P20240702100', N'Phantom ANC', N'10', N'-', N'bagus', N'ready', NULL, N'1556', N'2', N'2024-07-02 15:24:44.000', NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[item] OFF
GO


-- ----------------------------
-- Table structure for item_detail
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[item_detail]') AND type IN ('U'))
	DROP TABLE [dbo].[item_detail]
GO

CREATE TABLE [dbo].[item_detail] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [item] int  NOT NULL,
  [detail] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [jumlah] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
  [createdBy] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdAt] datetime  NOT NULL,
  [updatedBy] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
  [updatedAt] datetime DEFAULT NULL NULL,
  [satuan] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[item_detail] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'2 Juli 2024 10:21 WIB
Tabel yang digunakan untuk menyimpan detail/anak dari tabel tabel item. Saat ini item master yang memiliki detail hanya item ruangan saja, item lain belum ada detailnya.',
'SCHEMA', N'dbo',
'TABLE', N'item_detail'
GO


-- ----------------------------
-- Records of item_detail
-- ----------------------------
SET IDENTITY_INSERT [dbo].[item_detail] ON
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'3', N'250', N'Lemari', N'1', N'2', N'2024-07-02 11:29:44.000', NULL, NULL, N'Buah')
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'5', N'250', N'Kursi', N'5', N'2', N'2024-07-02 11:35:00.000', NULL, NULL, N'pcs')
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'9', N'1574', N'Bed', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'10', N'1574', N'Tiang Infus', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'11', N'1574', N'Selimut', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'12', N'1574', N'Bantal', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'13', N'1574', N'TV', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'14', N'1574', N'AC', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'15', N'1574', N'Tempat Sampah', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'16', N'1574', N'Pengukur Tinggi Badan', N'3', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'17', N'1574', N'Meja Besar', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'18', N'1574', N'Kursi', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'19', N'1574', N'Jam Dinding', N'1', N'2', N'2024-07-02 15:47:05.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'20', N'1575', N'Bed Giklenologi', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'21', N'1575', N'Tiang Penutup Gorden', N'2', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'22', N'1575', N'Tiang Infus', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'23', N'1575', N'Timbangan Berat Badan', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'24', N'1575', N'Bantal', N'2', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'25', N'1575', N'Bed', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'26', N'1575', N'AC', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'27', N'1575', N'Kulkas', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'28', N'1575', N'Baskom', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'29', N'1575', N'Selimut', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'30', N'1575', N'Laken', N'1', N'2', N'2024-07-02 15:50:26.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'31', N'1576', N'Meja', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'32', N'1576', N'Kursi', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'33', N'1576', N'Bed', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'34', N'1576', N'Timbangan Berat Badan', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'35', N'1576', N'Tempat Sampah', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'36', N'1576', N'Lemari', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'37', N'1576', N'Tiang Infus', N'1', N'2', N'2024-07-02 15:52:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'38', N'1577', N'Meja', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'39', N'1577', N'Kursi', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'40', N'1577', N'Bed', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'41', N'1577', N'Tempat Sampah', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'42', N'1577', N'Lemari', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'43', N'1577', N'Tiang Infus', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'44', N'1577', N'Meja Makan Pasien', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'45', N'1577', N'Phantom Anak', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'46', N'1577', N'Infant Bed', N'1', N'2', N'2024-07-02 15:53:31.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'47', N'1578', N'Meja', N'1', N'2', N'2024-07-02 15:54:17.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'48', N'1578', N'Kursi', N'6', N'2', N'2024-07-02 15:54:17.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'49', N'1578', N'Lemari', N'1', N'2', N'2024-07-02 15:54:17.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'50', N'1579', N'Meja', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'51', N'1579', N'Kursi', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'52', N'1579', N'Lemari', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'53', N'1579', N'Bed', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'54', N'1579', N'Timbangan Anak', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'55', N'1579', N'Meja Makan Pasien', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'56', N'1579', N'Kulkas', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'57', N'1579', N'Inkubator', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'58', N'1579', N'Phantom Anak', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'59', N'1579', N'Tiang Infus', N'1', N'2', N'2024-07-02 15:56:07.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'60', N'1580', N'Bed', N'2', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'61', N'1580', N'Bantal', N'2', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'62', N'1580', N'Laken', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'63', N'1580', N'Selimut', N'2', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'64', N'1580', N'Kursi', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'65', N'1580', N'Jam Dinding', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'66', N'1580', N'Meja Besar', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'67', N'1580', N'Meja Kecil', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'68', N'1580', N'TV', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'69', N'1580', N'AC', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'70', N'1580', N'Tiang Infus', N'1', N'2', N'2024-07-02 15:58:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'71', N'1581', N'AC', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'72', N'1581', N'Meja Besar', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'73', N'1581', N'Meja Kecil', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'74', N'1581', N'Bed ', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'75', N'1581', N'Kursi', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'76', N'1581', N'Sofa', N'3', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'77', N'1581', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'78', N'1581', N'TV', N'1', N'2', N'2024-07-02 16:00:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'79', N'1582', N'Bed', N'2', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'80', N'1582', N'Meja ', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'81', N'1582', N'Kursi', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'82', N'1582', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'83', N'1582', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'84', N'1582', N'Meja Biasa', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'85', N'1582', N'Lemari Pakaian', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'86', N'1582', N'Lemari Bantal', N'2', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'87', N'1582', N'Selimut', N'2', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'88', N'1582', N'Laken', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'89', N'1582', N'Tiang Infus', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'90', N'1582', N'Bantal', N'2', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'91', N'1582', N'Tabung Oksigen', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'92', N'1582', N'Wadah Handsanitizer', N'1', N'2', N'2024-07-02 16:01:52.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'93', N'1583', N'Kipas Angin', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'94', N'1583', N'AC', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'95', N'1583', N'Lemari', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'96', N'1583', N'Meja', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'97', N'1583', N'Kursi', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'98', N'1583', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'99', N'1583', N'Bed', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'100', N'1583', N'TV', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'101', N'1583', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'102', N'1583', N'Bantal', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'103', N'1583', N'Telepon', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'104', N'1583', N'Meja Makan Pasien', N'1', N'2', N'2024-07-02 16:03:09.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'105', N'1584', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'106', N'1584', N'Bed', N'4', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'107', N'1584', N'TV', N'1', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'108', N'1584', N'AC', N'1', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'109', N'1584', N'Lemari', N'3', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'110', N'1584', N'Meja Makan Pasien', N'2', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'111', N'1584', N'Lemari Pakaian', N'1', N'2', N'2024-07-02 16:04:19.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'112', N'1585', N'Meja', N'3', N'2', N'2024-07-02 16:05:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'113', N'1585', N'Lemari', N'2', N'2', N'2024-07-02 16:05:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'114', N'1585', N'Kursi', N'6', N'2', N'2024-07-02 16:05:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'115', N'1586', N'Sofa', N'16', N'2', N'2024-07-02 16:06:33.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'116', N'1586', N'Laci', N'1', N'2', N'2024-07-02 16:06:33.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'117', N'1586', N'TV', N'2', N'2', N'2024-07-02 16:06:33.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'118', N'1586', N'AC', N'1', N'2', N'2024-07-02 16:06:33.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'119', N'1586', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:06:33.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'120', N'1587', N'Komputer', N'10', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'121', N'1587', N'Keyboard', N'15', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'122', N'1587', N'Kursi', N'10', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'123', N'1587', N'Meja', N'5', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'124', N'1587', N'AC', N'1', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'125', N'1587', N'TV', N'1', N'2', N'2024-07-02 16:07:41.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'126', N'1588', N'Komputer', N'10', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'127', N'1588', N'Keyboard', N'2', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'128', N'1588', N'AC', N'1', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'129', N'1588', N'TV', N'2', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'130', N'1588', N'Meja', N'6', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'131', N'1588', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:08:18.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'132', N'1589', N'Meja Panjang', N'2', N'2', N'2024-07-02 16:09:36.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'133', N'1589', N'Kursi', N'6', N'2', N'2024-07-02 16:09:36.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'134', N'1589', N'AC', N'1', N'2', N'2024-07-02 16:09:36.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'135', N'1589', N'TV', N'1', N'2', N'2024-07-02 16:09:36.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'136', N'1590', N'Meja', N'1', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'137', N'1590', N'Kursi', N'6', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'138', N'1590', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'139', N'1590', N'TV', N'1', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'140', N'1590', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'141', N'1590', N'Meja Kecil', N'1', N'2', N'2024-07-02 16:10:54.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'142', N'1591', N'Meja Besar', N'1', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'143', N'1591', N'Meja Panjang', N'2', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'144', N'1591', N'Meja Kecil', N'1', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'145', N'1591', N'Kursi ', N'8', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'146', N'1591', N'Tempat Sampah', N'1', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'147', N'1591', N'TV', N'1', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'148', N'1591', N'AC', N'1', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'149', N'1591', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:12:16.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'150', N'1592', N'Tempat Tidur', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'151', N'1592', N'Meja Dosen', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'152', N'1592', N'Meja Makan', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'153', N'1592', N'TV', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'154', N'1592', N'Bantal', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'155', N'1592', N'Tong sampah', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'156', N'1592', N'Lemari', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'157', N'1592', N'Nakas', N'1', N'2', N'2024-07-02 16:13:21.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'158', N'1593', N'Tempat Tidur', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'159', N'1593', N'Meja Dosen', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'160', N'1593', N'Kursi', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'161', N'1593', N'Nakas', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'162', N'1593', N'Tong Sampah', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'163', N'1593', N'Meja Makan  Pasien', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'164', N'1593', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'165', N'1593', N'Lemari', N'1', N'2', N'2024-07-02 16:14:24.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'166', N'1594', N'Meja Dosen', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'167', N'1594', N'Meja Panjang', N'2', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'168', N'1594', N'Kursi', N'6', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'169', N'1594', N'Lemari ', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'170', N'1594', N'Tong Sampah', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'171', N'1594', N'Tv', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'172', N'1594', N'Jam Dinding', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'173', N'1594', N'Mikroskop', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'174', N'1594', N'Multifunctional Mixer', N'2', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[item_detail] ([id], [item], [detail], [jumlah], [createdBy], [createdAt], [updatedBy], [updatedAt], [satuan]) VALUES (N'175', N'1594', N'Electrolyte Analyzer', N'1', N'2', N'2024-07-02 16:15:40.000', NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[item_detail] OFF
GO


-- ----------------------------
-- Table structure for item_stok
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[item_stok]') AND type IN ('U'))
	DROP TABLE [dbo].[item_stok]
GO

CREATE TABLE [dbo].[item_stok] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [item] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [quantity] int  NOT NULL,
  [keterangan] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
  [createdBy] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdFrom] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdAt] datetime  NOT NULL
)
GO

ALTER TABLE [dbo].[item_stok] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of item_stok
-- ----------------------------
SET IDENTITY_INSERT [dbo].[item_stok] ON
GO

SET IDENTITY_INSERT [dbo].[item_stok] OFF
GO


-- ----------------------------
-- Table structure for items
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[items]') AND type IN ('U'))
	DROP TABLE [dbo].[items]
GO

CREATE TABLE [dbo].[items] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [kode] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [nama] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [jenis] int  NOT NULL,
  [quantityStok] int DEFAULT 0 NULL,
  [quantityPinjam] int DEFAULT 0 NULL,
  [createdBy] int  NOT NULL,
  [createdAt] datetime  NOT NULL,
  [updatedBy] int DEFAULT NULL NULL,
  [updatedAt] datetime DEFAULT NULL NULL,
  [kelompok] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [satuan] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[items] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of items
-- ----------------------------
SET IDENTITY_INSERT [dbo].[items] ON
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'1', N'A20240703100', N'½ koher', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'2', N'BHP202407032001', N'Abocath No.18', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'3', N'BHP20240703300', N'Abocath No.20', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'4', N'BHP20240703400', N'Abocath No.24', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'5', N'BHP20240703500', N'Abocath No.26', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'6', N'BHP202407036001', N'Akkohol 76%', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'7', N'A20240703700', N'Ambubag', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'8', N'A202407038001', N'Arteri Klem Bengkok', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'9', N'A20240703900', N'Arteri Klem Lurus', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'10', N'A202407031001', N'Baju bayi', N'3', N'10', N'0', N'2', N'2024-07-03 12:03:03.000', N'5', N'2024-07-03 14:23:06.000', N'Baju', N'potong')
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'11', N'A20240703110', N'Baju pasien + celana', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'12', N'A20240703120', N'Bak Injeksi', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'13', N'A20240703130', N'Bak Instrumen Besar', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'14', N'A20240703140', N'Baki', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'15', N'P20240703150', N'Bayi', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'16', N'P20240703160', N'Bayi Baru Lahir', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'17', N'P20240703170', N'Bayi Leng. Plasenta', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'18', N'A202407031801', N'Bedong', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'19', N'BHP202407031901', N'Benang/Hecting', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'20', N'BHP20240703200', N'Bethadine ', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'21', N'P20240703210', N'Bola Mata', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'22', N'A20240703220', N'Celana dalam dewasa', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'23', N'A20240703230', N'Celemek', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'24', N'A20240703240', N'Corong Kaca', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'25', N'P20240703250', N'Dekubitus', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'26', N'BHP20240703260', N'Dele/slim seher', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'27', N'P20240703270', N'Dental', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'28', N'P20240703280', N'Dilatasi Vagina', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'29', N'BHP20240703290', N'ETT 2,5', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'30', N'BHP202407033001', N'ETT 3,5', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'31', N'BHP20240703310', N'ETT 6,5', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'32', N'BHP20240703320', N'Extension Tube', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'33', N'BHP20240703330', N'Foley Catheter No. 18', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'34', N'BHP20240703340', N'Foley Catheter No.12', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'35', N'BHP20240703350', N'Foley Catheter No.14', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'36', N'BHP20240703360', N'Foley Catheter No.16', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'37', N'A20240703370', N'Forceps ', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'38', N'A20240703380', N'Gelas kumur', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'39', N'P20240703390', N'Ginjal', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'40', N'A20240703400', N'Gown pasien ', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'41', N'A20240703410', N'Guedel 0', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'42', N'A20240703420', N'Guedel 1', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'43', N'A20240703430', N'Guedel 2', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'44', N'A20240703440', N'Guedel 3', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'45', N'A20240703450', N'Guedel 4', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'46', N'A20240703460', N'Guedel 5', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'47', N'A20240703470', N'Gunting episiotomy', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'48', N'A20240703480', N'Gunting Epsiotomi', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'49', N'A20240703490', N'Gunting Jaringan', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'50', N'A20240703500', N'Gunting Tali Pusar', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'51', N'A20240703510', N'Gunting tali pusat', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'52', N'BHP20240703520', N'Handscoen Steril No.7', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'53', N'BHP20240703530', N'Handscoen Steril No.7,5 ', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'54', N'BHP20240703540', N'Handscoon panjang', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'55', N'A20240703550', N'Handuk bayi', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'56', N'A20240703560', N'Handuk dewasa', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'57', N'P20240703570', N'Hati', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'58', N'P20240703580', N'Human Celebral Artery', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'59', N'A20240703590', N'Implan ', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'60', N'BHP20240703600', N'Infus Set Makro', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'61', N'BHP20240703610', N'Infus Set Mikro', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'62', N'P20240703620', N'Inkubasi Bayi', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'63', N'A20240703630', N'IUD', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'64', N'P20240703640', N'Jantung', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'65', N'A20240703650', N'Kaca mata google', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'66', N'P20240703660', N'Kantong Empedu', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'67', N'BHP20240703670', N'Kapas cebok', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'68', N'BHP20240703680', N'Kapas Lidi', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'69', N'P20240703690', N'Karpal', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'70', N'A202407037001', N'Kasa steril', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'71', N'P20240703710', N'Kepala Bayi', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'72', N'P20240703720', N'Kerangka Foot Joint with Ligamen', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'73', N'P20240703730', N'Kerangka Tulang Panggul', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'74', N'P20240703740', N'Kerangka Tulang Sendi Bahu', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'75', N'A20240703750', N'Klem Implan', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'76', N'A20240703760', N'Kom Besar', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'77', N'A20240703770', N'Kom Kecil', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'78', N'A20240703780', N'Kom kecil (bertutup)', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'79', N'A20240703790', N'Kom Sedang', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'80', N'A20240703800', N'Kom sedang (bertutup)', N'3', N'3', N'3', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'81', N'A20240703810', N'Kondom', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'82', N'A20240703820', N'korentang', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'83', N'A20240703830', N'Korentang set', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'84', N'R20240703840', N'Laboratorium Anak', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'85', N'R20240703850', N'Laboratorium Antenatal Care', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'86', N'R20240703860', N'Laboratorium AUDIVISUAL', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'87', N'R20240703870', N'Laboratorium Bayi Baru Lahir', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'88', N'R20240703880', N'Laboratorium Biomedik', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'89', N'R20240703890', N'Laboratorium EPIDEMIOLOGI', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'90', N'R20240703900', N'Laboratorium Farmakologi', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'91', N'R20240703910', N'Laboratorium Gerontik', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'92', N'R20240703920', N'Laboratorium Gizi dan Diet', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'93', N'R20240703930', N'Laboratorium Internatal Care', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'94', N'R20240703940', N'Laboratorium Jiwa', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'95', N'R20240703950', N'Laboratorium Keluarga Berencana', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'96', N'R20240703960', N'Laboratorium Kesehatan Lingkungan', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'97', N'R20240703970', N'Laboratorium Keselamatan dan Kesehatan Kerja', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'98', N'R20240703980', N'Laboratorium Keterampilan Dasar', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'99', N'R20240703990', N'Laboratorium Komputer 1', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'100', N'R20240703100', N'Laboratorium Komputer 2', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'101', N'R20240703101', N'Laboratorium Komunitas', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'102', N'R20240703102', N'Laboratorium Konseling Care', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'103', N'R20240703103', N'Laboratorium Medikal Bedah', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'104', N'R20240703104', N'Laboratorium Post Natal Care', N'5', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'105', N'P20240703105', N'Lambung', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'106', N'P20240703106', N'Lengan Infus', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'107', N'BHP20240703107', N'LMA', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'108', N'A20240703108', N'Nalt Holder', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'109', N'BHP20240703109', N'Nassal Oksigen Anak', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'110', N'BHP20240703110', N'Nassal Oksigen Bayi', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'111', N'BHP20240703111', N'Nassal Oksigen Dewasa', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'112', N'BHP20240703112', N'Ners Cap', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'113', N'BHP20240703113', N'NGT No.14', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'114', N'BHP20240703114', N'NGT No.16', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'115', N'A20240703115', N'Nierbeken Besar', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'116', N'A20240703116', N'Nierbeken Kecil', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'117', N'A20240703117', N'Nierbeken Sedang', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'118', N'BHP20240703118', N'NRM Anak', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'119', N'BHP20240703119', N'NRM Dewasa', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'120', N'BHP20240703120', N'Okitosin ', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'121', N'A20240703121', N'Ompreng', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'122', N'P20240703122', N'Organ Tubuh Uk. Besar', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'123', N'P20240703123', N'Organ Tubuh Uk. Kecil', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'124', N'P20240703124', N'Pankreas', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'125', N'BHP20240703125', N'Pasta gigi', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'126', N'P20240703126', N'Payudara', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'127', N'BHP20240703127', N'Pembalut wanita (camelux)', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'128', N'P20240703128', N'Penis', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'129', N'P20240703129', N'Perawatan Kolostomi', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'130', N'P20240703130', N'Perkembangan Janin', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'131', N'P20240703131', N'Phantom ANC', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'132', N'P20240703132', N'Phantom payudara', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'133', N'P20240703133', N'Phantom pemasangan implan', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'134', N'P20240703134', N'Phantom pemasangan IUD', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'135', N'P20240703135', N'Phantom uterus', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'136', N'BHP20240703136', N'Pil KB', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'137', N'A20240703137', N'Pinset anatomis', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'138', N'A20240703138', N'Pinset Chirurgis', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'139', N'A20240703139', N'Pinset sirurgis', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'140', N'A202407031401', N'Piring plasenta', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'141', N'A20240703141', N'Refleks Hammer', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'142', N'P20240703142', N'RJP', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'143', N'BHP20240703143', N'Sabun mandi bayi', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'144', N'BHP20240703144', N'Salep mata', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'145', N'A20240703145', N'Sarung', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'146', N'A20240703146', N'Sarung tangan + kaki', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'147', N'BHP20240703147', N'Selang Nebulizer', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'148', N'A20240703148', N'Sepatu boot', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'149', N'BHP20240703149', N'Shampoo bayi', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'150', N'BHP20240703150', N'Sikat gigi', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'151', N'P20240703151', N'Sistem Kerangka Manusia', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'152', N'P20240703152', N'Sistem Perkemihan', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'153', N'P20240703153', N'Sistem Perkemihan Laki-Laki', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'154', N'A20240703154', N'Sonde uterus', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'155', N'A20240703155', N'Speculum vagina', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'156', N'BHP20240703156', N'Spuit 10cc', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'157', N'BHP20240703157', N'Spuit 1cc', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'158', N'BHP20240703158', N'Spuit 30cc', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'159', N'BHP20240703159', N'Spuit 3cc', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'160', N'BHP20240703160', N'Spuit 50cc', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'161', N'BHP20240703161', N'Spuit 5cc', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'162', N'A20240703162', N'Spuit Gliserin', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'163', N'A20240703163', N'Stetoskop ', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'164', N'A20240703164', N'Stick Sprayer Mata Besar', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'165', N'A20240703165', N'Stick Sprayer Mata Kecil', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'166', N'A20240703166', N'Stick Sprayer Mata Sedang', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'167', N'BHP20240703167', N'Suction Catheter No.14', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'168', N'BHP20240703168', N'Sungkup Dewasa', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'169', N'P20240703169', N'Suture Pad ', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'170', N'A20240703170', N'Tabung Reaksi', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'171', N'A20240703171', N'Tali dua', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'172', N'BHP20240703172', N'Tegaderm', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'173', N'A20240703173', N'Tempat Sampel Urin', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'174', N'A20240703174', N'Tenakulum ', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'175', N'BHP20240703175', N'Tetes Telinga', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'176', N'BHP20240703176', N'Threeway', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'177', N'A20240703177', N'Tongue Spatel', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'178', N'A20240703178', N'Topi', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'179', N'A20240703179', N'Tourniquet', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'180', N'A20240703180', N'Trolley 3 tingkat', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'181', N'A20240703181', N'Trolley emergency +isi', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'182', N'A20240703182', N'Trolley tindakan 2 tingkat', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'183', N'A20240703183', N'Tromol besar', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'184', N'A20240703184', N'Umbilical cord', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'185', N'A20240703185', N'Under pad/ perlak', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'186', N'BHP20240703186', N'Urin Bag', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'187', N'P20240703187', N'Vagina', N'10', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'188', N'BHP20240703188', N'Vaksin BCG', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'189', N'BHP20240703189', N'Vaksin campak', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'190', N'BHP20240703190', N'Vaksin DPT', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'191', N'BHP20240703191', N'Vaksin Hepatitis', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'192', N'BHP20240703192', N'Vaksin Polio', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'193', N'A20240703193', N'Wadah Korentang', N'3', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[items] ([id], [kode], [nama], [jenis], [quantityStok], [quantityPinjam], [createdBy], [createdAt], [updatedBy], [updatedAt], [kelompok], [satuan]) VALUES (N'194', N'BHP20240703194', N'Wingidel', N'11', N'0', N'0', N'2', N'2024-07-03 12:03:03.000', NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[items] OFF
GO


-- ----------------------------
-- Table structure for jenis
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[jenis]') AND type IN ('U'))
	DROP TABLE [dbo].[jenis]
GO

CREATE TABLE [dbo].[jenis] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nama] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [keterangan] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [createdBy] int  NOT NULL,
  [createdAt] datetime  NOT NULL,
  [updatedBy] int DEFAULT NULL NULL,
  [updatedAt] datetime DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[jenis] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of jenis
-- ----------------------------
SET IDENTITY_INSERT [dbo].[jenis] ON
GO

INSERT INTO [dbo].[jenis] ([id], [nama], [keterangan], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'3', N'Alat/Instrumen', N'Alat untuk praktik, istilah lainnya adalah instrumen', N'1', N'2024-07-02 10:06:14.000', N'2', N'2024-07-02 11:59:36.000')
GO

INSERT INTO [dbo].[jenis] ([id], [nama], [keterangan], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'5', N'Ruangan', NULL, N'1', N'2024-07-02 10:06:36.000', NULL, NULL)
GO

INSERT INTO [dbo].[jenis] ([id], [nama], [keterangan], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'10', N'Phantom', NULL, N'1', N'2024-07-02 10:07:25.000', NULL, NULL)
GO

INSERT INTO [dbo].[jenis] ([id], [nama], [keterangan], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'11', N'BHP', N'Barang Habis Pakai', N'1', N'2024-07-02 10:07:43.000', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[jenis] OFF
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
  [password] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[mahasiswa] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021001', NULL, N'AGUSDIN TRIADE MIRANATA', N'2021', NULL, NULL, N'L', N'SINARIA HAREFA', N'2', N'1401112403030002', N'', N'SMA NEGERI 1 TAPUNG HILIR', N'PT. BINA FITRI JAYA', N'082285396261', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021003', NULL, N'CHANI LYA ERVINATA SIANIPAR', N'2021', NULL, NULL, N'P', N'NAOMI SIHOMBING', N'2', N'1202096703990003', N'', N'SMK SWASTA DHARMA BHAKTI SIBORONGBORONG', N'SOSOR HOMBANG', N'082238360068', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021005', NULL, N'DWI ARGITA BR TARIGAN', N'2021', NULL, NULL, N'P', N'ELSY VERONICA BR SINURAYA', N'2', N'1206114308010003', N'', N'SMK NEGERI 3 MEDAN', N'DESA BATU KARANG', N'081370427472', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021006', NULL, N'JUNITA PUTRI MALEM BR BARUS', N'2021', NULL, NULL, N'P', N'IYN BR HASIBUAN', N'3', N'1271096506990003', N'', N'SMA NEGERI 14 MEDAN', N'JL PERTAHANAN NO  14-G MEDAN', N'083185952662', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021008', NULL, N'BRIAN SINAGA', N'2021', NULL, NULL, N'L', N'LASMARIA SITOMPUL', N'3', N'1217031410990000', N'', N'', N'RANGSANG BOSI', N'', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021009', NULL, N'DUMA MEGA YELISABET', N'2021', NULL, NULL, N'P', N'VERONIKA SINAGA', N'2', N'1271185811980001', N'', N'', N'JL TUNGGAL N0 64', N'082279461887', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021010', NULL, N'FITRI SUNTRI HANTI WARUWU', N'2021', NULL, NULL, N'P', N'WARNI ADI TELAUMBANUA', N'2', N'1201054511020002', N'', N'', N'DUSUN IV SIRAKOT-RAKOT', N'081959306990', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021011', NULL, N'NUR AINI', N'2021', NULL, NULL, N'P', N'SUKARNAWATI', N'1', N'1271135111010006', N'', N'', N'LINGK III BLOK AA N0 56 KNI', N'082277999765', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021012', NULL, N'NURHAYATI', N'2021', NULL, NULL, N'P', N'SITI HAWA', N'1', N'1271104110770007', N'', N'', N'JLN DENAI GG DUA NO 6', N'085206665899', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021013', NULL, N'SLAMET SYAHRIZAL', N'2021', NULL, NULL, N'L', N'SUJANA', N'1', N'1205092612970006', N'', N'', N'DUSUN KEPALA SUNGAI II', N'', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2021014', NULL, N'HAIDHARDUS DESMANTO SARUMAHA', N'2021', NULL, NULL, N'L', N'SARIFA''AMI DUHA', N'3', N'1214052312970001', N'', N'', N'DESA BAWODOBARA', N'', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023001', N'10210860', N'Aisyah', N'2023', NULL, NULL, N'P', N'Rismarini', N'1', N'1271205506050000-1', N'', N'SMA N 7', N'Jln Bilal', N'085171223788', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023002', N'58381323', N'Canrika Delisia Putri Gultom', N'2023', NULL, NULL, N'P', N'Yulia', N'1', N'317204690105000-2', N'', N'SMK Kesehatan Ganda Husad', N'Riau', N'082288054097', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023003', N'10210927', N'Elisabeh Br Nababan', N'2023', NULL, NULL, N'P', N'Josenta Tambunan', N'2', N'127101661202000-7', N'', N'SMA Parulian 2', N'Jln Jermal III Gg Merdeka Kanan No 16', N'082289082506', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023004', N'69725742', N'Ester Waruwu', N'2023', NULL, NULL, N'P', N'Idaria Hulu', N'2', N'120414010803000-1', N'', N'SMT Kristen', N'Dusun V Hilisoromi', N'081266568688', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023005', N'69932002', N'Ian Rahamat Jaya Mendrofa', N'2023', NULL, NULL, N'L', N'Fitamin Mendrofa', N'2', N'120429271103000-1', N'', N'SMK Swasta Pemda Nias', N'Lalai I/II, Dusun II', N'085289245090', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023006', N'10259032', N'Maria Magdalena Sinaga', N'2023', NULL, NULL, N'P', N'Deli Sinurat', N'2', N'121102600502000-5', N'', N'SMAS Bukit Cahaya', N'Medan', N'082181383545', N'RS Stella Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023007', N'10203516', N'Mawarni Waruwu', N'2023', NULL, NULL, N'P', N'Riani Gulo', N'2', N'120422100803000-1', N'', N'SMA Swasta Nupela', N'Desa Lasari Siwalubanua', N'082177580884', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023008', N'69900420', N'Mita Sihartina Pandiangan', N'2023', NULL, NULL, N'P', N'Lumba Mariana Siregar', N'2', N'120702430997000-2', N'', N'SMA Santa Lusia', N'Jln Medan Batang Kuis', N'082274646356', N'Junita', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023009', N'9961301662', N'Monica Titin P. Mendrofa', N'2023', NULL, NULL, N'P', N'Erina Zai', N'3', N'120429490405000-3', N'', N'SMK N1 Gunung Sitoli', N'Medan', N'081264249798', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023010', N'52244483', N'Natalia Nababan', N'2023', NULL, NULL, N'P', N'Novita Herawati Saragih', N'2', N'127101661202000-7', N'', N'SMK Yapim Indonesia', N'Jl Jermal II GG Bangun Sari IV', N'082378380710', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023011', N'1801062369', N'Rohani Mendrofa', N'2023', NULL, NULL, N'P', N'Nurmawati Zega', N'2', N'120429570305000-1', N'', N'SMK N1 Hiliserangkai', N'Dusun II Lalai', N'081281720923', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023012', N'54791405', N'Selvi Agusti Ningsih Waruwu', N'2023', NULL, NULL, N'P', N'Yunima Halawa', N'3', N'120429420504000-1', N'', N'SMK N1 Hiliserangkai', N'Fadoro Hunogoa', N'082210219987', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023013', N'10258334', N'Syaiful Bahri', N'2023', NULL, NULL, N'L', N'Masni', N'1', N'127107030388000-1', N'', N'Yayasan Emphaty', N'Jalan Nylur', N'082286476370', N'RS Stella Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023014', N'0036660527', N'Widia Andriyani', N'2023', NULL, NULL, N'P', N'Ramawati', N'1', N'121813560103000-2', N'', N'SMK N ! Rokan Rulu', N'Namorambe', N'085836131263', N'RS Stella Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023015', N'69877339', N'Alismawati Telaumbanua', N'2023', NULL, NULL, N'P', N'Filitina Laia', N'2', N'121403610101000-2', N'', N'SMA N1 Somamabawa', N'Sitolubanua', N'081276461127', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023016', N'9983048165', N'Andre Eriansyah ', N'2023', NULL, NULL, N'L', N'Satiani', N'1', N'127501071098000-5', N'', N'SMK Negeri 2 Binjai', N'Jl Gaharu LK IV', N'082373752189', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023017', N'0021869822', N'Fachri Ariza Rasyid', N'2023', NULL, NULL, N'L', N'Tetty Reynilda', N'1', N'127109131102000-1', N'', N'', N'Jln Pelita No 24 Medan', N'087869045178', N'RS Regina Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023018', N'0033049244', N'Meldiana Fransiska Siburian', N'2023', NULL, NULL, N'P', N'Heldinar Romauli Siahaan', N'2', N'120819590403000-1', N'', N'Sma SW Tamansiswa Cabang Bah Jambi ', N'Medan ', N'082273282028', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023019', N'0042317087', N'Muhammad Azriel Azhari', N'2023', NULL, NULL, N'L', N'T. Midra Ilfa', N'1', N'127105130504000-3', N'', N'SMA Bridjen Katamso', N'BTN Sukamaju', N'', N'RS Regina Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023020', N'0000200474', N'Namira Asya Adzani', N'2023', NULL, NULL, N'P', N'Suriyani', N'1', N'1271096907000000', N'', N'SMKN 1 Medan', N'Jln STM gg Aman no 26', N'', N'RS Regina Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023021', N'00436622984', N'Nia Rahmazani', N'2023', NULL, NULL, N'P', N'Rahmati', N'1', N'110316551004000-1', N'', N'SMK Negeri 1 Peureulak', N'Alue Batee', N'082312456803', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023022', N'10260464', N'Rani Hati Buulolo', N'2023', NULL, NULL, N'P', N'Riahati Telaumbanua', N'2', N'121403460101001-0', N'', N'SMA N1 Somambawa', N'Bawonuru', N'085371174180', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023023', N'12753393', N'Tia Safitri ', N'2023', NULL, NULL, N'P', N'Supini', N'1', N'120509440901000-4', N'', N'SMA Bintang Langka', N'Dusun Kepala Sungai II', N'082276888581', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023024', N'0042428750', N'Vinesia Ndruru', N'2023', NULL, NULL, N'P', N'Meliana Halawa', N'3', N'121401460504000-1', N'', N'SMA Negeri 1 Lolomatua', N'Hiliotalua', N'082370377489', NULL, N'5f4dcc3b5aa765d61d8327deb882cf99')
GO

INSERT INTO [dbo].[mahasiswa] ([npm], [nisn], [nama], [angkatan], [tempatLahir], [tanggalLahir], [jenisKelamin], [namaIbu], [agama], [ktp], [penerimaKPS], [asalSekolah], [alamat], [hp], [rekomendasi], [password]) VALUES (N'2023025', N'0005078308', N'Wahyudi Pratama Ramadhan', N'2023', NULL, NULL, N'L', N'Indra Wati', N'1', N'120726291100000-0', N'', N'SMK Kesehatan Assyfa School Banda Aceh', N'Dusun XIV Psr V No 20', N'082294944232', N'RS Regina Maris', N'5f4dcc3b5aa765d61d8327deb882cf99')
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

INSERT INTO [dbo].[migrations] ([id], [migration], [batch]) VALUES (N'4', N'2024_06_28_074231_add_column_created_and_updated_table_item', N'2')
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
  [id] int  IDENTITY(1,1) NOT NULL,
  [nomor] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [createdBy] int  NOT NULL,
  [createdAt] datetime  NOT NULL,
  [returnedAt] datetime  NULL,
  [returnedBy] int  NULL,
  [distributedBy] int DEFAULT NULL NULL,
  [distributedAt] datetime DEFAULT NULL NULL
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
'MS_Description', N'Dipinjam pada',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'createdAt'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Dikembalikan pada',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'returnedAt'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Operator pemroses pengembalian',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'returnedBy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Didistribusikan oleh',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'distributedBy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Didistribusikan pada',
'SCHEMA', N'dbo',
'TABLE', N'pinjam',
'COLUMN', N'distributedAt'
GO


-- ----------------------------
-- Records of pinjam
-- ----------------------------
SET IDENTITY_INSERT [dbo].[pinjam] ON
GO

SET IDENTITY_INSERT [dbo].[pinjam] OFF
GO


-- ----------------------------
-- Table structure for pinjam_item
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[pinjam_item]') AND type IN ('U'))
	DROP TABLE [dbo].[pinjam_item]
GO

CREATE TABLE [dbo].[pinjam_item] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [pinjam] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [item] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [kondisiPinjam] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [kondisiKembali] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [stokPinjam] int DEFAULT NULL NULL,
  [stokKembali] int DEFAULT NULL NULL,
  [quantityRequest] int  NOT NULL,
  [quantityDistribusi] int DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[pinjam_item] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'Stok saat peminjaman',
'SCHEMA', N'dbo',
'TABLE', N'pinjam_item',
'COLUMN', N'stokPinjam'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Stok saat pengembalian',
'SCHEMA', N'dbo',
'TABLE', N'pinjam_item',
'COLUMN', N'stokKembali'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Quantity yang diminta',
'SCHEMA', N'dbo',
'TABLE', N'pinjam_item',
'COLUMN', N'quantityRequest'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Quantity yang diberikan oleh operator',
'SCHEMA', N'dbo',
'TABLE', N'pinjam_item',
'COLUMN', N'quantityDistribusi'
GO


-- ----------------------------
-- Records of pinjam_item
-- ----------------------------
SET IDENTITY_INSERT [dbo].[pinjam_item] ON
GO

SET IDENTITY_INSERT [dbo].[pinjam_item] OFF
GO


-- ----------------------------
-- Auto increment value for administrator
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[administrator]', RESEED, 5)
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
DBCC CHECKIDENT ('[dbo].[item]', RESEED, 1594)
GO


-- ----------------------------
-- Auto increment value for item_detail
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[item_detail]', RESEED, 175)
GO


-- ----------------------------
-- Primary Key structure for table item_detail
-- ----------------------------
ALTER TABLE [dbo].[item_detail] ADD CONSTRAINT [PK__item_det__3213E83F0F249DCF] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for item_stok
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[item_stok]', RESEED, 1)
GO


-- ----------------------------
-- Auto increment value for items
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[items]', RESEED, 195)
GO


-- ----------------------------
-- Auto increment value for jenis
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[jenis]', RESEED, 12)
GO


-- ----------------------------
-- Primary Key structure for table jenis
-- ----------------------------
ALTER TABLE [dbo].[jenis] ADD CONSTRAINT [PK__jenis__3213E83F16C812A0] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
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
DBCC CHECKIDENT ('[dbo].[migrations]', RESEED, 4)
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
-- Auto increment value for pinjam
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[pinjam]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table pinjam
-- ----------------------------
ALTER TABLE [dbo].[pinjam] ADD CONSTRAINT [PK__peminjam__3213E83F3630B163] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for pinjam_item
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[pinjam_item]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table pinjam_item
-- ----------------------------
ALTER TABLE [dbo].[pinjam_item] ADD CONSTRAINT [PK__pinjam_b__3213E83F069E4876] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

