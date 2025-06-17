-- =============================================
-- Tugas Modul 6: Fungsi Agregasi dan Subquery
-- =============================================

-- 1. Menampilkan Produk dari Supplier Tertentu
-- -------------------------------------------
-- Menampilkan nama produk dan jumlah stok yang di-supply oleh perusahaan Suka Maju
SELECT 
    Produk_nama,
    Jumlah_stok 
FROM Produk 
WHERE Supplier_id IN (
    SELECT Suppliers_id 
    FROM Suppliers 
    WHERE Company_nama = "Suka Maju"
);

-- 2. Menampilkan Produk dari Supplier dengan Kontak Tertentu
-- --------------------------------------------------------
-- Menampilkan seluruh data produk yang nama kontak supplier-nya Rahmat
SELECT * 
FROM Produk 
WHERE Supplier_id IN (
    SELECT Suppliers_id 
    FROM Suppliers 
    WHERE Nama_kontak = "Rahmat"
);

-- 3. Menampilkan Transaksi dengan Kriteria Kompleks
-- -----------------------------------------------
-- Menampilkan transaksi yang dilakukan di atas tanggal 15 September,
-- dilayani oleh Siska, dan di-supply oleh Surya
SELECT * 
FROM Transaksi 
WHERE Tgl_transaksi > "2022-09-15" 
    AND Id_pegawai IN (
        SELECT Id_pegawai 
        FROM Pegawai 
        WHERE Pegawai_nama = "Siska"
    )
    AND Produk_id IN (
        SELECT Produk_id 
        FROM Produk 
        WHERE Supplier_id IN (
            SELECT Suppliers_id 
            FROM Suppliers 
            WHERE Company_nama = "Surya"
        )
    );

-- 4. Menampilkan Supplier dengan Pembelian di Bawah 3 Pcs
-- ----------------------------------------------------
-- Menampilkan seluruh nama perusahaan yang jumlah pembeliannya di bawah 3 pcs
SELECT Company_nama 
FROM Suppliers 
WHERE Suppliers_id IN (
    SELECT Supplier_id 
    FROM Produk 
    WHERE Produk_id IN (
        SELECT Produk_id 
        FROM Transaksi 
        WHERE Jumlah_beli < 3
    )
);

-- 5. Menampilkan Pembeli yang Dilayani oleh Pegawai Tertentu
-- --------------------------------------------------------
-- Menampilkan semua data pembeli yang dilayani oleh Santi
SELECT * 
FROM Pembeli 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Transaksi 
    WHERE Id_pegawai IN (
        SELECT Id_pegawai 
        FROM Pegawai 
        WHERE Pegawai_nama = "Santi"
    )
);

-- 6. Menampilkan Kontak Pembeli dengan Kriteria Tertentu
-- ---------------------------------------------------
-- Menampilkan kontak pembeli yang membeli 3 pcs barang dan dilayani oleh Siska
SELECT Pembeli_kontak 
FROM Pembeli 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Transaksi 
    WHERE Jumlah_beli = 3 
        AND Id_pegawai IN (
            SELECT Id_pegawai 
            FROM Pegawai 
            WHERE Pegawai_nama = "Siska"
        )
);

-- 7. Menampilkan Kontak Pembeli dengan Kriteria Kompleks
-- ---------------------------------------------------
-- Menampilkan kontak pembeli yang membeli 3 pcs barang,
-- tidak dilayani oleh Siska, dan barangnya di-supply oleh Surya
SELECT Pembeli_kontak 
FROM Pembeli 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Transaksi 
    WHERE Jumlah_beli = 3 
        AND Id_pegawai NOT IN (
            SELECT Id_pegawai 
            FROM Pegawai 
            WHERE Pegawai_nama = "Siska"
        )
        AND Produk_id IN (
            SELECT Produk_id 
            FROM Produk 
            WHERE Supplier_id IN (
                SELECT Suppliers_id 
                FROM Suppliers 
                WHERE Company_nama = "Surya"
            )
        )
);

-- 8. Menampilkan Kontak Pembeli dengan Pembelian di Atas 3 Pcs
-- ---------------------------------------------------------
-- Menampilkan kontak pembeli yang membeli di atas 3 pcs barang
-- dan transaksi dilakukan tanggal 15 September
SELECT Pembeli_kontak 
FROM Pembeli 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Transaksi 
    WHERE Jumlah_beli > 3 
        AND Tgl_transaksi = "2022-09-15"
);

-- 9. Menampilkan Tanggal Penjualan Produk dari Supplier Tertentu
-- -----------------------------------------------------------
-- Menampilkan tanggal penjualan barang dari perusahaan Ceria
SELECT DISTINCT Tgl_transaksi 
FROM Transaksi 
WHERE Produk_id IN (
    SELECT Produk_id 
    FROM Produk 
    WHERE Supplier_id IN (
        SELECT Suppliers_id 
        FROM Suppliers 
        WHERE Company_nama = "Ceria"
    )
);

-- 10. Menampilkan Pembeli yang Dilayani oleh Dua Pegawai
-- ---------------------------------------------------
-- Menampilkan nama pelanggan yang pernah dilayani oleh Siska dan Nuri
SELECT Pembeli_nama 
FROM Pembeli 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Transaksi 
    WHERE Id_pegawai IN (
        SELECT Id_pegawai 
        FROM Pegawai 
        WHERE Pegawai_nama IN ("Siska", "Nuri")
    )
);

-- 11. Menampilkan Pembeli dengan Kriteria Stok dan Supplier
-- -----------------------------------------------------
-- Menampilkan nama pelanggan yang membeli barang dengan jumlah stok di atas 100
-- dan di-supply oleh Ali
SELECT Pembeli_nama 
FROM Pembeli 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Transaksi 
    WHERE Produk_id IN (
        SELECT Produk_id 
        FROM Produk 
        WHERE Jumlah_stok > 100 
            AND Supplier_id IN (
                SELECT Suppliers_id 
                FROM Suppliers 
                WHERE Company_nama = "Ali"
            )
    )
);

-- 12. Menampilkan Transaksi dengan Pembeli dan Pegawai Tertentu
-- ----------------------------------------------------------
-- Menampilkan data seluruh transaksi yang dilakukan oleh Andi
-- dan dilayani oleh Jamal
SELECT * 
FROM Transaksi 
WHERE Id_pembeli IN (
    SELECT Id_pembeli 
    FROM Pembeli 
    WHERE Pembeli_nama = "Andi"
)
AND Id_pegawai IN (
    SELECT Id_pegawai 
    FROM Pegawai 
    WHERE Pegawai_nama = "Jamal"
);

-- 13. Menampilkan Produk dari Supplier Tertentu
-- -------------------------------------------
-- Menampilkan nama produk dan jumlah stok yang di-supply oleh Maju Terus
SELECT 
    Produk_nama,
    Jumlah_stok 
FROM Produk 
WHERE Supplier_id IN (
    SELECT Suppliers_id 
    FROM Suppliers 
    WHERE Company_nama = "Maju Terus"
);

-- 14. Menampilkan Supplier yang Dilayani oleh Pegawai Tertentu
-- ---------------------------------------------------------
-- Menampilkan nama perusahaan dan kontaknya yang transaksi barangnya
-- dilayani oleh Yaya
SELECT 
    Company_nama,
    Nama_kontak 
FROM Suppliers 
WHERE Suppliers_id IN (
    SELECT Supplier_id 
    FROM Produk 
    WHERE Produk_id IN (
        SELECT Produk_id 
        FROM Transaksi 
        WHERE Id_pegawai IN (
            SELECT Id_pegawai 
            FROM Pegawai 
            WHERE Pegawai_nama = "Yaya"
        )
    )
);

-- 15. Menampilkan Pegawai dengan Penjualan di Atas 5 Pcs
-- --------------------------------------------------
-- Menampilkan nama pegawai yang berhasil menjual lebih dari 5 pcs barang
-- dalam satu transaksi
SELECT Pegawai_nama 
FROM Pegawai 
WHERE Id_pegawai IN (
    SELECT Id_pegawai 
    FROM Transaksi 
    WHERE Jumlah_beli > 5
);