----Menampilkan semua data pada tabel product
SELECT *
FROM Production.Product;

--Menampikan Name, ProductNumber, dan ListPrice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product;

--menampilkan data menggunakan alias kolom
SELECT NAME AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--Menampikan HargaBaru = ListPrice * 1.1
SELECT Name, Listprice, (ListPrice*1.1) AS HargaBaru
FROM Production.Product;

--Menampikan data dengan Menggunakan String
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

--Filterisasi Data
--Menampikan product yang berwara red
SELECT Name,Color,ListPrice
FROM Production.Product
WHERE Color = 'red';

--Menampikan product yang ListPricenya lebih dari 1000
SELECT Name,ListPrice
FROM Production.Product
WHERE ListPrice < 1000;

--Menampilkan Product yang berwarna black DAN list pricenya lebih dari 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice >500;

--Menampilkan Product yang berwarna red, blue, ATAU black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black');

--Menampilkan Product  yang  namanya mengandung kata 'ROAD'
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%ROAD%'

--Agregasi dan Pengelompokan
--menghitung total baris
SELECT COUNT(*) AS TotalProduct
FROM Production.Product;

--menampilkan warna produk dan jumlahnya
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--menampilkan ProdkID, jumlah OrderQty, dan ratarata UnitPrice
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.salesOrderDetail
GROUP BY ProductID;

SELECT *
FROM Sales.SalesOrderDetail

--menampilkan data dengan grouping lebih dari satu kolom
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product

--Filter Hasil Agregasi
--menampilkan warna produk yang jumlahnya lebih dari 2
SELECT Color,COUNT(*) AS jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) > 2;

--menampilkan warna product yang listprice nya > 500 dan jumlahnya >10
SELECT Color,COUNT(*) AS jumlah
FROM Production.Product
WHERE ListPrice > 500
GROUP BY Color 
HAVING COUNT(*) < 10;

--menampilkan ProductID yang jumlah OrderQtynya lebih dari 100
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 10;

--menampilkan specialofferId yang rata rata OrderQtynya kurang dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

--menampilkan
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000;

--Advance Select da Order By
--Menapilka jobTitle tanpa dyplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee;

--menampilkan 5 produk termahal
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--OFFSET FETCH
SELECT Name, ListPrice
FROM Production.product
ORDER BY ListPrice DESC
OFFSET 3 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.product
WHERE ListPrice > 0
GROUP BY Color
ORDER BY TotalNilaiStok DESC;

--TUGAS MANDIRI 
--Tugas 1
SELECT ProductID,SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalUang DESC;

--Tugas 2
SELECT ProductID,SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty > = 2
GROUP BY ProductID
ORDER BY TotalUang DESC;


--Tugas 3
SELECT ProductID,SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty > = 2
GROUP BY ProductID;

--Tugas 4
SELECT ProductID,SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000;

--Tugas 5
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 5000
ORDER BY TotalUang DESC;

--Tugas 6
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 50
ORDER BY TotalUang DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
