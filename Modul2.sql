--Buat Database
CREATE DATABASE TokoRetailDB;

--Gunakan DB TokoREtailDB
USE TokoRetailDB;

--Membuat tabel KategoriProduk
CREATE TABLE Produk (
  KategoriID INT IDENTITY(1,1) PRIMARY KEY,
  NamaKategori VARCHAR(100) NOT NULL UNIQUE
);
--Membuat tabel Produk
CREATE TABLE Produk(
  ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
  SKU VARCHAR(20) NOT NULL UNIQUE,
  NamaProduk VARCHAR(150) NOT NULL,
  Harga DECIMAL(10 ,2) NOT NULL,
  Stok INT NOT NULL,
  KategoriID INT NULL,

  --harganya gaboleh negatif
  CONSTRAINT CHK_HargaPositif CHECK (Harga >=0),
  --stoknya gaboleh negatif
   CONSTRAINT CHK_StokPositif CHECK (Harga >=0),
   --Relasikan dengan tabel KategoriProduk melalui KategoriID
   CONSTRAINT FK_Produk_Kategori
     FOREIGN KEY (KategoriID)
     REFERENCES KategoriProduk(KategoriID)
);

--masukan data ke tabel kategoriproduk
INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Electronik');

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Pakaian'),
('Buku');

--menampilkan tabel kategori
SELECT *
FROM KategoriProduk;

--Hanya menampilkan NamaKategori
SELECT NamaKategori
FROM KategoriProduk;

--Menambahkan data ke tabel Produk
INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES 
('ELEC-001', 'Laptop Gaming', 15000000.00, 50, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES 
('ELEC-002', 'HP Gaming', 5000000.00, 50, 1);

--Menampilkan tabel Produk
SELECT *
FROM Produk;

--mengubah data stok laptop  gaming menjadi 30
UPDATE Produk
SET Stok = 30
WHERE ProdukID = 1001;

--menghapus data HP Gaming
BEGIN TRANSACTION;

DELETE FROM Produk
WHERE ProdukID = 1002;

COMMIT TRANSACTION;

--menambah data lagi ke tabel produk
INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES 
('BAJU-001', 'Kaos Putih', 50000.00, 30, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES 
('BAJU-002', 'Kaos Hitam', 50000.00, 30, 2);

SELECT*FROM Produk;

--menghapus kaos putih
BEGIN TRAN;

DELETE FROM Produk
WHERE ProdukID = 1003;

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;
