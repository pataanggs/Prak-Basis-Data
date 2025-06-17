-- =============================================
-- Tugas Modul 3: Manipulasi Data Dasar
-- =============================================

-- 1. Persiapan Database
-- --------------------
DROP DATABASE IF EXISTS Galeri_ITERA;
CREATE DATABASE Galeri_ITERA;
USE Galeri_ITERA;

-- 2. Pembuatan dan Pengisian Tabel
-- -------------------------------
-- 2.1 Tabel Suppliers (Pemasok)
CREATE TABLE IF NOT EXISTS Suppliers (
    Suppliers_id VARCHAR(4) PRIMARY KEY NOT NULL,
    Company_nama VARCHAR(50) NOT NULL,
    Nama_kontak VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Suppliers (Suppliers_id, Company_nama, Nama_kontak) VALUES
    ("S001", "Semua Terang", "Sugiono"),
    ("S002", "Suka Maju", "Rahmat"),
    ("S003", "Maju Terus", "Dayono");

-- 2.2 Tabel Produk
CREATE TABLE IF NOT EXISTS Produk (
    Produk_id VARCHAR(4) PRIMARY KEY NOT NULL,
    Produk_nama VARCHAR(50) NOT NULL,
    Jumlah_stok INT(11) NOT NULL,
    Supplies_id VARCHAR(4) NOT NULL,
    CONSTRAINT fk_produk_suppliers 
    FOREIGN KEY (Supplies_id) 
    REFERENCES Suppliers(Suppliers_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO Produk (Produk_id, Produk_nama, Jumlah_stok, Supplies_id) VALUES
    ("P114", "Milo 100 ml", 100, "S001"),
    ("P235", "Aqua 250 ml", 300, "S001"),
    ("P311", "Grand 320 ml", 400, "S003"),
    ("P115", "Milo 150 ml", 50, "S003"),
    ("P441", "Rojo Lele 5 kg", 60, "S002");

-- 2.3 Tabel Pegawai
CREATE TABLE IF NOT EXISTS Pegawai (
    Id_pegawai VARCHAR(6) PRIMARY KEY NOT NULL,
    Pegawai_nama VARCHAR(50) NOT NULL,
    Jabatan VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Pegawai (Id_pegawai, Pegawai_nama, Jabatan) VALUES
    ("pg_001", "Santi", "Cashier"),
    ("pg_011", "Sinta", "Manager"),
    ("pg_201", "Santo", "Satpam");

-- 2.4 Tabel Pembeli
CREATE TABLE IF NOT EXISTS Pembeli (
    Id_pembeli VARCHAR(5) PRIMARY KEY NOT NULL,
    Pembeli_nama VARCHAR(50) NOT NULL,
    Pembeli_kontak VARCHAR(15) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Pembeli (Id_pembeli, Pembeli_nama, Pembeli_kontak) VALUES
    ("C_901", "Rudi", "081231511"),
    ("C_991", "Andi", "085212021111"),
    ("C_800", "Egi", "0812521221"),
    ("C_810", "Ardi", "0862145121");

-- 3. Manipulasi Data (DML)
-- -----------------------
-- 3.1 Update ID Pembeli
UPDATE Pembeli
SET Id_pembeli = 'C_890' 
WHERE Pembeli_nama = 'Egi';

-- 3.2 Tampilkan Semua Pembeli
SELECT * FROM Pembeli;

-- 3.3 Tampilkan Produk dengan Stok < 700
SELECT Produk_nama 
FROM Produk 
WHERE jumlah_stok < 700;

-- 3.4 Hapus Pembeli dengan ID C_810
DELETE FROM Pembeli
WHERE Id_pembeli = 'C_810';

-- 3.5 Tampilkan Semua Pembeli (Setelah Penghapusan)
SELECT * FROM Pembeli;

-- 3.6 Join Produk dengan Suppliers
SELECT * 
FROM Suppliers
INNER JOIN Produk ON Produk.Supplies_id = Suppliers.Suppliers_id
WHERE Suppliers.Company_nama = 'Suka Maju';

-- 3.7 Update Stok Milo 100 ml
UPDATE Produk
SET Jumlah_stok = 800 
WHERE Produk_nama = 'Milo 100 ml';

-- 3.8 Update Nama Perusahaan
UPDATE Suppliers
SET Company_nama = 'Ali' 
WHERE Company_nama = 'Semua Terang';

-- 3.9 Tampilkan Pembeli dengan ID C_9
SELECT * 
FROM Pembeli
WHERE Id_pembeli LIKE 'C_9%';

-- 3.10 Tampilkan Semua Produk
SELECT * FROM Produk;

-- 3.11 Tampilkan Produk dari Supplier S001 atau S003
SELECT * 
FROM Produk
WHERE Supplies_id IN ('S001', 'S003');

-- 3.12 Update Jabatan Santo
UPDATE Pegawai
SET Jabatan = 'Cashier' 
WHERE Pegawai_nama = 'Santo';

-- 3.13 Update Data Pembeli
UPDATE Pembeli
SET 
    Pembeli_nama = 'Prassetya',
    Pembeli_kontak = '08521116464' 
WHERE Id_pembeli = 'C_890';

-- 3.14 Update Nama Pegawai
UPDATE Pegawai
SET Pegawai_nama = 'Yaya' 
WHERE Id_pegawai = 'pg_300';
