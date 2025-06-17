-- =============================================
-- Tugas Modul 7: Stored Procedure dan Trigger
-- =============================================

-- 1. Menambahkan Data Produk Baru
-- ------------------------------
-- Menambahkan data produk baru ke dalam tabel Produk
INSERT INTO Produk (Produk_id, Produk_nama, Jumlah_stok, Supplier_id) VALUES
    ('P150', 'Kretendeng', 80, 'S002'),
    ('P792', 'Miesadap', 30, 'S005'),
    ('P204', 'Somos', 50, 'S005'),
    ('P561', 'Marijan', 40, 'S004');

-- 2. Modifikasi Tabel Pegawai
-- --------------------------
-- Menambahkan kolom alamat dan jenis_kelamin ke tabel Pegawai
ALTER TABLE Pegawai 
    ADD COLUMN alamat VARCHAR(50) AFTER Jabatan,
    ADD COLUMN jenis_kelamin VARCHAR(15) AFTER alamat;

-- Menambahkan data pegawai baru
INSERT INTO Pegawai (
    Id_pegawai,
    Pegawai_nama,
    Jabatan,
    jenis_kelamin,
    alamat
) VALUES
    ('pg_007', 'Dani', 'Staff', 'Laki-laki', 'Jl. Suka Maju'),
    ('pg_008', 'Doni', 'Staff', 'Laki-laki', 'Jl. Suka Mundur'),
    ('pg_009', 'Dian', 'Staff', 'Perempuan', 'Jl. Ryacudu');

-- 3. Modifikasi Tabel Pembeli
-- --------------------------
-- Menambahkan kolom kota ke tabel Pembeli
ALTER TABLE Pembeli 
    ADD COLUMN kota VARCHAR(25) AFTER Pembeli_kontak;

-- Memperbarui data kota untuk pembeli yang ada
UPDATE Pembeli 
SET kota = 'Jakarta' 
WHERE Pembeli_nama = 'Egi';

UPDATE Pembeli 
SET kota = 'Bandung' 
WHERE Pembeli_nama = 'Ardi';

UPDATE Pembeli 
SET kota = 'Yogyakarta' 
WHERE Pembeli_nama = 'Rudi';

UPDATE Pembeli 
SET kota = 'Bandar Lampung' 
WHERE Pembeli_nama = 'Andi';

-- 4. Modifikasi Tabel Suppliers
-- ---------------------------
-- Menambahkan kolom kota ke tabel Suppliers
ALTER TABLE Suppliers 
    ADD COLUMN kota VARCHAR(25) AFTER Nama_kontak;

-- Memperbarui data kota untuk supplier yang ada
UPDATE Suppliers 
SET kota = 'Jakarta' 
WHERE Suppliers_id = 'S001';

UPDATE Suppliers 
SET kota = 'Bandung' 
WHERE Suppliers_id = 'S002';

UPDATE Suppliers 
SET kota = 'Surabaya' 
WHERE Suppliers_id = 'S003';

UPDATE Suppliers 
SET kota = 'Yogyakarta' 
WHERE Suppliers_id = 'S004';

UPDATE Suppliers 
SET kota = 'Bandar Lampung' 
WHERE Suppliers_id = 'S005';

UPDATE Suppliers 
SET kota = 'Bandar Lampung' 
WHERE Suppliers_id = 'S006';

-- Menampilkan data supplier yang diurutkan berdasarkan kota
SELECT * 
FROM Suppliers 
ORDER BY kota;

-- 5. Fungsi Agregasi
-- -----------------
-- Menampilkan nilai maksimal jumlah stok dari tabel Produk
SELECT MAX(Jumlah_stok) AS Stok_Tertinggi 
FROM Produk;

-- Menampilkan nilai rata-rata jumlah stok dari tabel Produk
SELECT AVG(Jumlah_stok) AS Rata_rata_Stok 
FROM Produk;