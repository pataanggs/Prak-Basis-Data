-- =============================================
-- Tugas Modul 4: Query Lanjutan
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
    ("S004", "Pelita", "Baru Puspa"),
    ("S005", "Surya", "Kun Siti"),
    ("S006", "Ceria", "Kasih Topan");

-- 2.2 Tabel Produk
CREATE TABLE IF NOT EXISTS Produk (
    Produk_id VARCHAR(10) PRIMARY KEY NOT NULL,
    Produk_nama VARCHAR(50) NOT NULL,
    Jumlah_Stok INT(11) NOT NULL,
    Supplier_id VARCHAR(4) NOT NULL,
    CONSTRAINT fk_produk_supplier 
    FOREIGN KEY (Supplier_id) 
    REFERENCES Suppliers(Suppliers_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO Produk (Produk_id, Produk_nama, Jumlah_Stok, Supplier_id) VALUES
    ("P552", "Aqua 1 L", 300, "S001"),
    ("P882", "Indomilk 25 ml", 200, "S004"),
    ("P333", "Sari Roti 100 gram", 30, "S005"),
    ("P123", "Gulaku 1 Kg", 100, "S005"),
    ("P453", "Garam 30 gram", 20, "S006"),
    ("P109", "The Kotak 300 ml", 40, "S002");

-- 2.3 Tabel Pegawai
CREATE TABLE IF NOT EXISTS Pegawai (
    Id_pegawai VARCHAR(6) PRIMARY KEY NOT NULL,
    Pegawai_nama VARCHAR(50) NOT NULL,
    Jabatan VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Pegawai (Id_pegawai, Pegawai_nama, Jabatan) VALUES
    ("pg_002", "Siska", "Cashier"),
    ("pg_003", "Nuri", "Cashier"),
    ("pg_004", "Jamal", "Cashier");

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

-- 2.5 Tabel Transaksi
CREATE TABLE IF NOT EXISTS Transaksi (
    Id_transaksi INT(5) PRIMARY KEY NOT NULL,
    Id_pembeli VARCHAR(5) NOT NULL,
    Id_pegawai VARCHAR(6) NOT NULL,
    Produk_Id VARCHAR(10) NOT NULL,
    Tgl_transaksi DATE NOT NULL,
    Jumlah_beli INT(11) NOT NULL,
    CONSTRAINT fk_transaksi_pembeli 
    FOREIGN KEY (Id_pembeli) 
    REFERENCES Pembeli(Id_pembeli),
    CONSTRAINT fk_transaksi_pegawai 
    FOREIGN KEY (Id_pegawai) 
    REFERENCES Pegawai(Id_pegawai),
    CONSTRAINT fk_transaksi_produk 
    FOREIGN KEY (Produk_Id) 
    REFERENCES Produk(Produk_id)
) ENGINE = InnoDB;

INSERT INTO Transaksi (Id_transaksi, Id_pembeli, Id_pegawai, Produk_Id, Tgl_transaksi, Jumlah_beli) VALUES
    (1, "C_901", "pg_002", "P552", "2022-09-12", 3),
    (2, "C_901", "pg_003", "P109", "2022-09-15", 10),
    (3, "C_810", "pg_001", "P114", "2022-09-15", 2),
    (4, "C_991", "pg_004", "P333", "2022-09-18", 3),
    (5, "C_800", "pg_001", "P552", "2022-09-18", 1),
    (6, "C_810", "pg_002", "P552", "2022-09-20", 10);

-- 3. Query Lanjutan
-- ----------------
-- 3.1 Natural Join antara Produk dan Suppliers
SELECT *
FROM Produk NATURAL JOIN Suppliers;

-- 3.2 Inner Join antara Produk dan Suppliers
SELECT *
FROM Produk 
INNER JOIN Suppliers ON Produk.Supplier_id = Suppliers.Suppliers_id;

-- 3.3 Join untuk Menampilkan Data Pegawai dengan ID pg_001
SELECT 
    Pegawai.Jabatan,
    Pegawai.Id_pegawai,
    Transaksi.Tgl_transaksi
FROM Pegawai 
JOIN Transaksi ON Pegawai.Id_pegawai = Transaksi.Id_pegawai
WHERE Pegawai.Id_pegawai = "pg_001";

-- 3.4 Join untuk Menampilkan Produk dengan Stok > 50
SELECT 
    Produk.Produk_id,
    Produk.Produk_nama,
    Produk.Jumlah_Stok,
    Suppliers.Suppliers_id,
    Suppliers.Company_nama,
    Suppliers.Nama_kontak
FROM Produk 
JOIN Suppliers ON Produk.Supplier_id = Suppliers.Suppliers_id
WHERE Produk.Jumlah_Stok > 50;

-- 3.5 Join untuk Menampilkan Transaksi dengan Jumlah Beli > 6
SELECT 
    Transaksi.Id_transaksi,
    Transaksi.Produk_id,
    Transaksi.Jumlah_beli,
    Transaksi.Tgl_transaksi
FROM Transaksi 
JOIN Produk ON Transaksi.Produk_id = Produk.Produk_id
WHERE Transaksi.Jumlah_beli > 6;

-- 3.6 Join antara Transaksi dan Pegawai
SELECT *
FROM Transaksi 
JOIN Pegawai ON Transaksi.Id_pegawai = Pegawai.Id_pegawai;

-- 3.7 Join antara Transaksi dan Pembeli
SELECT 
    Transaksi.Id_pembeli,
    Pembeli.Pembeli_nama,
    Transaksi.Tgl_transaksi,
    Transaksi.Produk_id,
    Transaksi.Jumlah_beli
FROM Transaksi 
JOIN Pembeli ON Transaksi.Id_pembeli = Pembeli.Id_pembeli;

-- 3.8 Join untuk Menampilkan Produk dengan Nama Dimulai 'G'
SELECT 
    Produk.Produk_id,
    Produk.Supplier_id,
    Produk.Produk_nama,
    Suppliers.Nama_kontak
FROM Produk 
JOIN Suppliers ON Produk.Supplier_id = Suppliers.Suppliers_id
WHERE Produk.Produk_nama LIKE "G%";

-- 3.9 Join untuk Menampilkan Produk dengan ID Dimulai 'P1'
SELECT 
    Produk.Produk_id,
    Produk.Produk_nama,
    Transaksi.Id_transaksi,
    Transaksi.Jumlah_beli,
    Transaksi.Tgl_transaksi
FROM Produk 
JOIN Transaksi ON Produk.Produk_id = Transaksi.Produk_id
WHERE Produk.Produk_id LIKE "P1%";

-- 3.10 Inner Join untuk Menampilkan Produk dengan Stok 60-150
SELECT 
    Produk.Produk_id,
    Produk.Produk_nama,
    Transaksi.Tgl_transaksi,
    Transaksi.Id_transaksi
FROM Produk 
INNER JOIN Transaksi ON Produk.Produk_id = Transaksi.Produk_id
WHERE Produk.Jumlah_Stok > 60 AND Produk.Jumlah_Stok < 150;

-- 3.11 Join untuk Menampilkan Transaksi dengan Kriteria Tertentu
SELECT 
    Pegawai.Id_pegawai,
    Pegawai.Jabatan,
    Transaksi.Id_transaksi
FROM Pegawai 
JOIN Transaksi ON Pegawai.Id_pegawai = Transaksi.Id_pegawai
WHERE Transaksi.Jumlah_beli < 6 
    AND Transaksi.Tgl_transaksi BETWEEN "2022-09-15" AND "2022-09-18";