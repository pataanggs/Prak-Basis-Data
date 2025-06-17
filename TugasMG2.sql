-- =============================================
-- Tugas Modul 2: Pembuatan Database dan Tabel
-- =============================================

-- 1. Membuat Database
-- -------------------
CREATE DATABASE IF NOT EXISTS Westhinghouse;
USE Westhinghouse;

-- 2. Membuat Tabel-tabel Dasar
-- ----------------------------
-- Tabel Buku untuk menyimpan informasi buku
CREATE TABLE IF NOT EXISTS Buku (
    id_buku INT(11) PRIMARY KEY NOT NULL,
    buku_nama VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

-- Tabel Penerbit untuk menyimpan informasi penerbit
CREATE TABLE IF NOT EXISTS Penerbit (
    id_penerbit INT(11) PRIMARY KEY NOT NULL,
    nama_penerbit VARCHAR(50) NOT NULL,
    kontak_penerbit VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

-- Tabel Pegawai untuk menyimpan informasi pegawai
CREATE TABLE IF NOT EXISTS Pegawai (
    id_pegawai INT(11) PRIMARY KEY NOT NULL,
    pegawai_nama VARCHAR(50) NOT NULL,
    jabatan VARCHAR(30) NOT NULL,
    umur INT(3) NOT NULL
) ENGINE = InnoDB;

-- Tabel Pembeli untuk menyimpan informasi pembeli
CREATE TABLE IF NOT EXISTS Pembeli (
    id_pembeli INT(11) PRIMARY KEY NOT NULL,
    nama_pembeli VARCHAR(50) NOT NULL,
    kontak_pembeli VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

-- 3. Modifikasi Struktur Tabel
-- ---------------------------
-- Mengubah nama kolom pegawai_nama menjadi nama_pegawai
ALTER TABLE Pegawai 
    CHANGE COLUMN pegawai_nama nama_pegawai VARCHAR(50) NOT NULL;

-- Menghapus kolom umur dari tabel Pegawai
ALTER TABLE Pegawai 
    DROP COLUMN umur;

-- Mengubah nama kolom buku_nama menjadi nama_buku
ALTER TABLE Buku 
    CHANGE COLUMN buku_nama nama_buku VARCHAR(50);

-- Menambahkan kolom jumlah_stok setelah nama_buku
ALTER TABLE Buku 
    ADD COLUMN jumlah_stok INT(11) NOT NULL AFTER nama_buku;

-- Mengubah tipe data dan nama kolom id_buku menjadi isbn
ALTER TABLE Buku 
    CHANGE COLUMN id_buku isbn VARCHAR(20);

-- 4. Menambahkan Foreign Key
-- -------------------------
-- Menambahkan kolom id_penerbit sebagai foreign key
ALTER TABLE Buku 
    ADD COLUMN id_penerbit INT(11) NOT NULL;

-- Menambahkan constraint foreign key
ALTER TABLE Buku
    ADD CONSTRAINT fk_buku_penerbit 
    FOREIGN KEY (id_penerbit) 
    REFERENCES Penerbit (id_penerbit)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
