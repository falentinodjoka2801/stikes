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

 Date: 01/07/2024 15:29:44
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
  [id] int  IDENTITY(1,1) NOT NULL,
  [createdBy] int  NULL,
  [createdAt] datetime  NULL,
  [updatedBy] int  NULL,
  [updatedAt] datetime  NULL
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

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628001', N'Alat 1', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'150', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628002', N'Alat 2', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'151', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628003', N'Alat 3', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'152', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628004', N'Alat 4', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'153', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628005', N'Alat 5', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'154', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628006', N'Alat 6', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'155', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628007', N'Alat 7', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'156', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628008', N'Alat 8', N'alat', N'-', N'bagus', N'dipinjam', N'2023001', N'157', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628009', N'Alat 9', N'alat', N'-', N'bagus', N'ready', NULL, N'158', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628010', N'Alat 10', N'alat', N'-', N'bagus', N'ready', NULL, N'159', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628011', N'Alat 11', N'alat', N'-', N'bagus', N'ready', NULL, N'160', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628012', N'Alat 12', N'alat', N'-', N'bagus', N'ready', NULL, N'161', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628013', N'Alat 13', N'alat', N'-', N'bagus', N'ready', NULL, N'162', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628014', N'Alat 14', N'alat', N'-', N'bagus', N'ready', NULL, N'163', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628015', N'Alat 15', N'alat', N'-', N'bagus', N'ready', NULL, N'164', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628016', N'Alat 16', N'alat', N'-', N'bagus', N'ready', NULL, N'165', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628017', N'Alat 17', N'alat', N'-', N'bagus', N'ready', NULL, N'166', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628018', N'Alat 18', N'alat', N'-', N'bagus', N'ready', NULL, N'167', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628019', N'Alat 19', N'alat', N'-', N'bagus', N'ready', NULL, N'168', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628020', N'Alat 20', N'alat', N'-', N'bagus', N'ready', NULL, N'169', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628021', N'Alat 21', N'alat', N'-', N'bagus', N'ready', NULL, N'170', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628022', N'Alat 22', N'alat', N'-', N'bagus', N'ready', NULL, N'171', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628023', N'Alat 23', N'alat', N'-', N'bagus', N'ready', NULL, N'172', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628024', N'Alat 24', N'alat', N'-', N'bagus', N'ready', NULL, N'173', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628025', N'Alat 25', N'alat', N'-', N'bagus', N'ready', NULL, N'174', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628026', N'Alat 26', N'alat', N'-', N'bagus', N'ready', NULL, N'175', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628027', N'Alat 27', N'alat', N'-', N'bagus', N'ready', NULL, N'176', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628028', N'Alat 28', N'alat', N'-', N'bagus', N'ready', NULL, N'177', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628029', N'Alat 29', N'alat', N'-', N'bagus', N'ready', NULL, N'178', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628030', N'Alat 30', N'alat', N'-', N'bagus', N'ready', NULL, N'179', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628031', N'Alat 31', N'alat', N'-', N'bagus', N'ready', NULL, N'180', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628032', N'Alat 32', N'alat', N'-', N'bagus', N'ready', NULL, N'181', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628033', N'Alat 33', N'alat', N'-', N'bagus', N'ready', NULL, N'182', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628034', N'Alat 34', N'alat', N'-', N'bagus', N'ready', NULL, N'183', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628035', N'Alat 35', N'alat', N'-', N'bagus', N'ready', NULL, N'184', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628036', N'Alat 36', N'alat', N'-', N'bagus', N'ready', NULL, N'185', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628037', N'Alat 37', N'alat', N'-', N'bagus', N'ready', NULL, N'186', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628038', N'Alat 38', N'alat', N'-', N'bagus', N'ready', NULL, N'187', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628039', N'Alat 39', N'alat', N'-', N'bagus', N'ready', NULL, N'188', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628040', N'Alat 40', N'alat', N'-', N'bagus', N'ready', NULL, N'189', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628041', N'Alat 41', N'alat', N'-', N'bagus', N'ready', NULL, N'190', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628042', N'Alat 42', N'alat', N'-', N'bagus', N'ready', NULL, N'191', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628043', N'Alat 43', N'alat', N'-', N'bagus', N'ready', NULL, N'192', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628044', N'Alat 44', N'alat', N'-', N'bagus', N'ready', NULL, N'193', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628045', N'Alat 45', N'alat', N'-', N'bagus', N'ready', NULL, N'194', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628046', N'Alat 46', N'alat', N'-', N'bagus', N'ready', NULL, N'195', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628047', N'Alat 47', N'alat', N'-', N'bagus', N'ready', NULL, N'196', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628048', N'Alat 48', N'alat', N'-', N'bagus', N'ready', NULL, N'197', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628049', N'Alat 49', N'alat', N'-', N'bagus', N'ready', NULL, N'198', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628050', N'Alat 50', N'alat', N'-', N'bagus', N'ready', NULL, N'199', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628051', N'Alat 51', N'alat', N'-', N'bagus', N'ready', NULL, N'200', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628052', N'Alat 52', N'alat', N'-', N'bagus', N'ready', NULL, N'201', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628053', N'Alat 53', N'alat', N'-', N'bagus', N'ready', NULL, N'202', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628054', N'Alat 54', N'alat', N'-', N'bagus', N'ready', NULL, N'203', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628055', N'Alat 55', N'alat', N'-', N'bagus', N'ready', NULL, N'204', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628056', N'Alat 56', N'alat', N'-', N'bagus', N'ready', NULL, N'205', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628057', N'Alat 57', N'alat', N'-', N'bagus', N'ready', NULL, N'206', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628058', N'Alat 58', N'alat', N'-', N'bagus', N'ready', NULL, N'207', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628059', N'Alat 59', N'alat', N'-', N'bagus', N'ready', NULL, N'208', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628060', N'Alat 60', N'alat', N'-', N'bagus', N'ready', NULL, N'209', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628061', N'Alat 61', N'alat', N'-', N'bagus', N'ready', NULL, N'210', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628062', N'Alat 62', N'alat', N'-', N'bagus', N'ready', NULL, N'211', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628063', N'Alat 63', N'alat', N'-', N'bagus', N'ready', NULL, N'212', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628064', N'Alat 64', N'alat', N'-', N'bagus', N'ready', NULL, N'213', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628065', N'Alat 65', N'alat', N'-', N'bagus', N'ready', NULL, N'214', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628066', N'Alat 66', N'alat', N'-', N'bagus', N'ready', NULL, N'215', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628067', N'Alat 67', N'alat', N'-', N'bagus', N'ready', NULL, N'216', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628068', N'Alat 68', N'alat', N'-', N'bagus', N'ready', NULL, N'217', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628069', N'Alat 69', N'alat', N'-', N'bagus', N'ready', NULL, N'218', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628070', N'Alat 70', N'alat', N'-', N'bagus', N'ready', NULL, N'219', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628071', N'Alat 71', N'alat', N'-', N'bagus', N'ready', NULL, N'220', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628072', N'Alat 72', N'alat', N'-', N'bagus', N'ready', NULL, N'221', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628073', N'Alat 73', N'alat', N'-', N'bagus', N'ready', NULL, N'222', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628074', N'Alat 74', N'alat', N'-', N'bagus', N'ready', NULL, N'223', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628075', N'Alat 75', N'alat', N'-', N'bagus', N'ready', NULL, N'224', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628076', N'Alat 76', N'alat', N'-', N'bagus', N'ready', NULL, N'225', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628077', N'Alat 77', N'alat', N'-', N'bagus', N'ready', NULL, N'226', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628078', N'Alat 78', N'alat', N'-', N'bagus', N'ready', NULL, N'227', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628079', N'Alat 79', N'alat', N'-', N'bagus', N'ready', NULL, N'228', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628080', N'Alat 80', N'alat', N'-', N'bagus', N'ready', NULL, N'229', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628081', N'Alat 81', N'alat', N'-', N'bagus', N'ready', NULL, N'230', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628082', N'Alat 82', N'alat', N'-', N'bagus', N'ready', NULL, N'231', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628083', N'Alat 83', N'alat', N'-', N'bagus', N'ready', NULL, N'232', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628084', N'Alat 84', N'alat', N'-', N'bagus', N'ready', NULL, N'233', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628085', N'Alat 85', N'alat', N'-', N'bagus', N'ready', NULL, N'234', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628086', N'Alat 86', N'alat', N'-', N'bagus', N'ready', NULL, N'235', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628087', N'Alat 87', N'alat', N'-', N'bagus', N'ready', NULL, N'236', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628088', N'Alat 88', N'alat', N'-', N'bagus', N'ready', NULL, N'237', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628089', N'Alat 89', N'alat', N'-', N'bagus', N'ready', NULL, N'238', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628090', N'Alat 90', N'alat', N'-', N'bagus', N'ready', NULL, N'239', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628091', N'Alat 91', N'alat', N'-', N'bagus', N'ready', NULL, N'240', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628092', N'Alat 92', N'alat', N'-', N'bagus', N'ready', NULL, N'241', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628093', N'Alat 93', N'alat', N'-', N'bagus', N'ready', NULL, N'242', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628094', N'Alat 94', N'alat', N'-', N'bagus', N'ready', NULL, N'243', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628095', N'Alat 95', N'alat', N'-', N'bagus', N'ready', NULL, N'244', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628096', N'Alat 96', N'alat', N'-', N'bagus', N'ready', NULL, N'245', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628097', N'Alat 97', N'alat', N'-', N'bagus', N'ready', NULL, N'246', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628098', N'Alat 98', N'alat', N'-', N'bagus', N'ready', NULL, N'247', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628099', N'Alat 99', N'alat', N'-', N'bagus', N'ready', NULL, N'248', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'A20240628100', N'Alat 100', N'alat', N'-', N'bagus', N'ready', NULL, N'249', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628001', N'Ruangan 1', N'ruang', N'-', N'bagus', N'ready', NULL, N'250', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628002', N'Ruangan 2', N'ruang', N'-', N'bagus', N'ready', NULL, N'251', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628003', N'Ruangan 3', N'ruang', N'-', N'bagus', N'ready', NULL, N'252', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628004', N'Ruangan 4', N'ruang', N'-', N'bagus', N'ready', NULL, N'253', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628005', N'Ruangan 5', N'ruang', N'-', N'bagus', N'ready', NULL, N'254', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628006', N'Ruangan 6', N'ruang', N'-', N'bagus', N'ready', NULL, N'255', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628007', N'Ruangan 7', N'ruang', N'-', N'bagus', N'ready', NULL, N'256', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628008', N'Ruangan 8', N'ruang', N'-', N'bagus', N'ready', NULL, N'257', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628009', N'Ruangan 9', N'ruang', N'-', N'bagus', N'ready', NULL, N'258', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628010', N'Ruangan 10', N'ruang', N'-', N'bagus', N'ready', NULL, N'259', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628011', N'Ruangan 11', N'ruang', N'-', N'bagus', N'ready', NULL, N'260', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628012', N'Ruangan 12', N'ruang', N'-', N'bagus', N'ready', NULL, N'261', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628013', N'Ruangan 13', N'ruang', N'-', N'bagus', N'ready', NULL, N'262', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628014', N'Ruangan 14', N'ruang', N'-', N'bagus', N'ready', NULL, N'263', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628015', N'Ruangan 15', N'ruang', N'-', N'bagus', N'ready', NULL, N'264', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628016', N'Ruangan 16', N'ruang', N'-', N'bagus', N'ready', NULL, N'265', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628017', N'Ruangan 17', N'ruang', N'-', N'bagus', N'ready', NULL, N'266', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628018', N'Ruangan 18', N'ruang', N'-', N'bagus', N'ready', NULL, N'267', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628019', N'Ruangan 19', N'ruang', N'-', N'bagus', N'ready', NULL, N'268', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628020', N'Ruangan 20', N'ruang', N'-', N'bagus', N'ready', NULL, N'269', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628021', N'Ruangan 21', N'ruang', N'-', N'bagus', N'ready', NULL, N'270', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628022', N'Ruangan 22', N'ruang', N'-', N'bagus', N'ready', NULL, N'271', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628023', N'Ruangan 23', N'ruang', N'-', N'bagus', N'ready', NULL, N'272', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628024', N'Ruangan 24', N'ruang', N'-', N'bagus', N'ready', NULL, N'273', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628025', N'Ruangan 25', N'ruang', N'-', N'bagus', N'ready', NULL, N'274', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628026', N'Ruangan 26', N'ruang', N'-', N'bagus', N'ready', NULL, N'275', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628027', N'Ruangan 27', N'ruang', N'-', N'bagus', N'ready', NULL, N'276', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628028', N'Ruangan 28', N'ruang', N'-', N'bagus', N'ready', NULL, N'277', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628029', N'Ruangan 29', N'ruang', N'-', N'bagus', N'ready', NULL, N'278', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628030', N'Ruangan 30', N'ruang', N'-', N'bagus', N'ready', NULL, N'279', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628031', N'Ruangan 31', N'ruang', N'-', N'bagus', N'ready', NULL, N'280', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628032', N'Ruangan 32', N'ruang', N'-', N'bagus', N'ready', NULL, N'281', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628033', N'Ruangan 33', N'ruang', N'-', N'bagus', N'ready', NULL, N'282', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628034', N'Ruangan 34', N'ruang', N'-', N'bagus', N'ready', NULL, N'283', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628035', N'Ruangan 35', N'ruang', N'-', N'bagus', N'ready', NULL, N'284', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628036', N'Ruangan 36', N'ruang', N'-', N'bagus', N'ready', NULL, N'285', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628037', N'Ruangan 37', N'ruang', N'-', N'bagus', N'ready', NULL, N'286', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628038', N'Ruangan 38', N'ruang', N'-', N'bagus', N'ready', NULL, N'287', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628039', N'Ruangan 39', N'ruang', N'-', N'bagus', N'ready', NULL, N'288', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628040', N'Ruangan 40', N'ruang', N'-', N'bagus', N'ready', NULL, N'289', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628041', N'Ruangan 41', N'ruang', N'-', N'bagus', N'ready', NULL, N'290', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628042', N'Ruangan 42', N'ruang', N'-', N'bagus', N'ready', NULL, N'291', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628043', N'Ruangan 43', N'ruang', N'-', N'bagus', N'ready', NULL, N'292', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628044', N'Ruangan 44', N'ruang', N'-', N'bagus', N'ready', NULL, N'293', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628045', N'Ruangan 45', N'ruang', N'-', N'bagus', N'ready', NULL, N'294', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628046', N'Ruangan 46', N'ruang', N'-', N'bagus', N'ready', NULL, N'295', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628047', N'Ruangan 47', N'ruang', N'-', N'bagus', N'ready', NULL, N'296', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628048', N'Ruangan 48', N'ruang', N'-', N'bagus', N'ready', NULL, N'297', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628049', N'Ruangan 49', N'ruang', N'-', N'bagus', N'ready', NULL, N'298', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628050', N'Ruangan 50', N'ruang', N'-', N'bagus', N'ready', NULL, N'299', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628051', N'Ruangan 51', N'ruang', N'-', N'bagus', N'ready', NULL, N'300', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628052', N'Ruangan 52', N'ruang', N'-', N'bagus', N'ready', NULL, N'301', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628053', N'Ruangan 53', N'ruang', N'-', N'bagus', N'ready', NULL, N'302', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628054', N'Ruangan 54', N'ruang', N'-', N'bagus', N'ready', NULL, N'303', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628055', N'Ruangan 55', N'ruang', N'-', N'bagus', N'ready', NULL, N'304', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628056', N'Ruangan 56', N'ruang', N'-', N'bagus', N'ready', NULL, N'305', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628057', N'Ruangan 57', N'ruang', N'-', N'bagus', N'ready', NULL, N'306', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628058', N'Ruangan 58', N'ruang', N'-', N'bagus', N'ready', NULL, N'307', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628059', N'Ruangan 59', N'ruang', N'-', N'bagus', N'ready', NULL, N'308', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628060', N'Ruangan 60', N'ruang', N'-', N'bagus', N'ready', NULL, N'309', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628061', N'Ruangan 61', N'ruang', N'-', N'bagus', N'ready', NULL, N'310', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628062', N'Ruangan 62', N'ruang', N'-', N'bagus', N'ready', NULL, N'311', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628063', N'Ruangan 63', N'ruang', N'-', N'bagus', N'ready', NULL, N'312', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628064', N'Ruangan 64', N'ruang', N'-', N'bagus', N'ready', NULL, N'313', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628065', N'Ruangan 65', N'ruang', N'-', N'bagus', N'ready', NULL, N'314', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628066', N'Ruangan 66', N'ruang', N'-', N'bagus', N'ready', NULL, N'315', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628067', N'Ruangan 67', N'ruang', N'-', N'bagus', N'ready', NULL, N'316', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628068', N'Ruangan 68', N'ruang', N'-', N'bagus', N'ready', NULL, N'317', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628069', N'Ruangan 69', N'ruang', N'-', N'bagus', N'ready', NULL, N'318', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628070', N'Ruangan 70', N'ruang', N'-', N'bagus', N'ready', NULL, N'319', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628071', N'Ruangan 71', N'ruang', N'-', N'bagus', N'ready', NULL, N'320', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628072', N'Ruangan 72', N'ruang', N'-', N'bagus', N'ready', NULL, N'321', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628073', N'Ruangan 73', N'ruang', N'-', N'bagus', N'ready', NULL, N'322', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628074', N'Ruangan 74', N'ruang', N'-', N'bagus', N'ready', NULL, N'323', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628075', N'Ruangan 75', N'ruang', N'-', N'bagus', N'ready', NULL, N'324', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628076', N'Ruangan 76', N'ruang', N'-', N'bagus', N'ready', NULL, N'325', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628077', N'Ruangan 77', N'ruang', N'-', N'bagus', N'ready', NULL, N'326', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628078', N'Ruangan 78', N'ruang', N'-', N'bagus', N'ready', NULL, N'327', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628079', N'Ruangan 79', N'ruang', N'-', N'bagus', N'ready', NULL, N'328', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628080', N'Ruangan 80', N'ruang', N'-', N'bagus', N'ready', NULL, N'329', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628081', N'Ruangan 81', N'ruang', N'-', N'bagus', N'ready', NULL, N'330', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628082', N'Ruangan 82', N'ruang', N'-', N'bagus', N'ready', NULL, N'331', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628083', N'Ruangan 83', N'ruang', N'-', N'bagus', N'ready', NULL, N'332', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628084', N'Ruangan 84', N'ruang', N'-', N'bagus', N'ready', NULL, N'333', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628085', N'Ruangan 85', N'ruang', N'-', N'bagus', N'ready', NULL, N'334', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628086', N'Ruangan 86', N'ruang', N'-', N'bagus', N'ready', NULL, N'335', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628087', N'Ruangan 87', N'ruang', N'-', N'bagus', N'ready', NULL, N'336', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628088', N'Ruangan 88', N'ruang', N'-', N'bagus', N'ready', NULL, N'337', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628089', N'Ruangan 89', N'ruang', N'-', N'bagus', N'ready', NULL, N'338', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628090', N'Ruangan 90', N'ruang', N'-', N'bagus', N'ready', NULL, N'339', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628091', N'Ruangan 91', N'ruang', N'-', N'bagus', N'ready', NULL, N'340', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628092', N'Ruangan 92', N'ruang', N'-', N'bagus', N'ready', NULL, N'341', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628093', N'Ruangan 93', N'ruang', N'-', N'bagus', N'ready', NULL, N'342', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628094', N'Ruangan 94', N'ruang', N'-', N'bagus', N'ready', NULL, N'343', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628095', N'Ruangan 95', N'ruang', N'-', N'bagus', N'ready', NULL, N'344', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628096', N'Ruangan 96', N'ruang', N'-', N'bagus', N'ready', NULL, N'345', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628097', N'Ruangan 97', N'ruang', N'-', N'bagus', N'ready', NULL, N'346', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628098', N'Ruangan 98', N'ruang', N'-', N'bagus', N'ready', NULL, N'347', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628099', N'Ruangan 99', N'ruang', N'-', N'bagus', N'ready', NULL, N'348', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628100', N'Ruangan 100', N'ruang', N'-', N'bagus', N'ready', NULL, N'349', N'2', N'2024-06-28 14:54:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[item] ([kode], [nama], [jenis], [kelompok], [kondisi], [status], [peminjam], [id], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (N'R20240628101', N'Ruang Rapat (edit)', N'ruang', N'A (edit)', N'rusak', N'dipinjam', NULL, N'355', N'2', N'2024-06-28 08:13:44.000', NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[pinjam] ON
GO

INSERT INTO [dbo].[pinjam] ([id], [nomor], [createdBy], [createdAt], [returnedAt]) VALUES (N'4', N'20240628001', N'2023001', N'2024-06-28 04:47:38.000', NULL)
GO

INSERT INTO [dbo].[pinjam] ([id], [nomor], [createdBy], [createdAt], [returnedAt]) VALUES (N'5', N'20240628002', N'2023001', N'2024-06-28 04:49:22.000', NULL)
GO

INSERT INTO [dbo].[pinjam] ([id], [nomor], [createdBy], [createdAt], [returnedAt]) VALUES (N'6', N'20240701001', N'2023001', N'2024-07-01 14:05:59.000', N'2024-07-01 14:06:34.000')
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
  [kondisiPinjam] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [kondisiKembali] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[pinjam_item] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of pinjam_item
-- ----------------------------
SET IDENTITY_INSERT [dbo].[pinjam_item] ON
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'10', N'4', N'150', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'11', N'4', N'151', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'12', N'4', N'152', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'13', N'5', N'153', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'14', N'5', N'154', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'15', N'5', N'155', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'16', N'5', N'156', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'17', N'5', N'157', N'bagus', NULL)
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'18', N'6', N'158', N'bagus', N'bagus')
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'19', N'6', N'159', N'bagus', N'bagus')
GO

INSERT INTO [dbo].[pinjam_item] ([id], [pinjam], [item], [kondisiPinjam], [kondisiKembali]) VALUES (N'20', N'6', N'160', N'bagus', N'bagus')
GO

SET IDENTITY_INSERT [dbo].[pinjam_item] OFF
GO


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
DBCC CHECKIDENT ('[dbo].[item]', RESEED, 358)
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
DBCC CHECKIDENT ('[dbo].[pinjam]', RESEED, 6)
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
DBCC CHECKIDENT ('[dbo].[pinjam_item]', RESEED, 20)
GO


-- ----------------------------
-- Primary Key structure for table pinjam_item
-- ----------------------------
ALTER TABLE [dbo].[pinjam_item] ADD CONSTRAINT [PK__pinjam_b__3213E83F069E4876] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

