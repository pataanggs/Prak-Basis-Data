-- =============================================
-- Tugas Modul 5: Join dan Subquery
-- =============================================

-- 1. Inner Join untuk Menampilkan Data Pegawai
-- -------------------------------------------
-- Menampilkan jabatan, ID pegawai, dan tanggal transaksi untuk pegawai dengan ID pg_001
SELECT 
    Pegawai.Jabatan,
    Pegawai.Id_pegawai,
    Transaksi.Tgl_transaksi
FROM Pegawai
INNER JOIN Transaksi ON Pegawai.Id_pegawai = Transaksi.Id_pegawai
WHERE Pegawai.Id_pegawai = 'pg_001';

-- 2. Left Outer Join antara Pegawai dan Transaksi
-- ----------------------------------------------
-- Menampilkan semua data pegawai beserta transaksinya (jika ada)
SELECT *
FROM Pegawai
LEFT OUTER JOIN Transaksi ON Pegawai.Id_pegawai = Transaksi.Id_pegawai;

-- 3. Left Outer Join untuk Produk dengan Nama Dimulai 'S'
-- -----------------------------------------------------
-- Menampilkan produk yang namanya dimulai dengan 'S' beserta data supplier
SELECT 
    Produk.Produk_id,
    Produk.Supplier_id,
    Produk.Produk_nama,
    Suppliers.Nama_kontak
FROM Produk
LEFT OUTER JOIN Suppliers ON Produk.Supplier_id = Suppliers.Suppliers_id
WHERE Produk.Produk_nama LIKE 'S%';

-- 4. Inner Join untuk Produk dengan ID Dimulai 'P3'
-- -----------------------------------------------
-- Menampilkan detail produk dan transaksi untuk produk dengan ID dimulai 'P3'
SELECT 
    Produk.Produk_id,
    Produk.Produk_nama,
    Transaksi.Id_transaksi,
    Produk.Jumlah_stok,
    Transaksi.Tgl_transaksi
FROM Produk
INNER JOIN Transaksi ON Produk.Produk_id = Transaksi.Produk_id
WHERE Produk.Produk_id LIKE 'P3%';

-- 5. Full Outer Join antara Pembeli dan Transaksi
-- ---------------------------------------------
-- Menampilkan semua data pembeli dan transaksi (menggunakan UNION)
SELECT *
FROM Pembeli
LEFT OUTER JOIN Transaksi ON Pembeli.Id_pembeli = Transaksi.Id_pembeli
UNION
SELECT *
FROM Pembeli
RIGHT OUTER JOIN Transaksi ON Pembeli.Id_pembeli = Transaksi.Id_pembeli;

-- 6. Left Outer Join antara Produk dan Transaksi
-- --------------------------------------------
-- Menampilkan semua produk beserta transaksinya (jika ada)
SELECT *
FROM Produk
LEFT OUTER JOIN Transaksi ON Produk.Produk_id = Transaksi.Produk_id;

-- 7. Right Outer Join antara Produk dan Transaksi
-- ---------------------------------------------
-- Menampilkan semua transaksi beserta produknya (jika ada)
SELECT *
FROM Produk
RIGHT OUTER JOIN Transaksi ON Produk.Produk_id = Transaksi.Produk_id;

-- 8. Inner Join antara Pembeli dan Transaksi
-- ----------------------------------------
-- Menampilkan data pembeli yang memiliki transaksi
SELECT *
FROM Pembeli
INNER JOIN Transaksi ON Pembeli.Id_pembeli = Transaksi.Id_pembeli;

-- 9. Left Outer Join antara Pembeli dan Transaksi
-- ---------------------------------------------
-- Menampilkan semua pembeli beserta transaksinya (jika ada)
SELECT *
FROM Pembeli
LEFT OUTER JOIN Transaksi ON Pembeli.Id_pembeli = Transaksi.Id_pembeli;

-- 10. Right Outer Join antara Pembeli dan Transaksi
-- -----------------------------------------------
-- Menampilkan semua transaksi beserta pembelinya (jika ada)
SELECT *
FROM Pembeli
RIGHT OUTER JOIN Transaksi ON Pembeli.Id_pembeli = Transaksi.Id_pembeli;

-- 11. Inner Join antara Transaksi dan Produk
-- ----------------------------------------
-- Menampilkan data transaksi beserta produknya
SELECT *
FROM Transaksi
INNER JOIN Produk ON Transaksi.Produk_id = Produk.Produk_id;