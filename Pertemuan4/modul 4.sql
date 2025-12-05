USE KampusDB;

--CROS JOIN
SELECT M. NamaMahasiswa, MK. NamaMK
FROM Mahasiswa AS M
CROSS JOIN Matakuliah As MK;

--Menampilkan semua kombinasi dosen dan ruangan 
SELECT D. NamaDosen, R. KodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R;

--LEFT JOIN
--menampilkan semua mahasiswa termasuk yang belum mengisi KRS
SELECT M. NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M. MahasiswaID = K. MahasiswaID;

--Menampilkan semua mata kuliah, termasuk yang belum punyaa jadwal
SELECT MK. NamaMK, J.Hari
FROM MataKuliah MK
LEFT JOIN JadwaKuliah J ON MK. MataKuliahID = J.MataKuliahID; 

--RIGHT JOIN

SELECT MK. NamaMK, J.Hari
FROM MataKuliah MK
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahId;

--menampilkan semua ruangan apakah ruanan tersebut di pakai atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
RIGHT JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--INNER JOIN
--menampilkan nama mahaiswa dan matkulnya, tapi lewat KRS
SELECT M.NamaMahasiswa, MK.NamaMk
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID;

--Menampilakan mata kuliah dan dosen pengampu
SELECT MK. NamaMK, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID;

--Menampilkan jadwal lengkap
SELECT MK. NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--Menampilkan Nama Mahasiswa dan nilai akhirnya
SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MatakuliahID;

--Menampilkan dosen dan matakuliah yang dia ajar
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER JOIN MataKuliah MK ON D.DosenID = MK.DosenID;

--Menampilkan nama mahasiswa dan nilai akhir 
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaId = N.MahasiswaId;

--SELF JOIN
--Mencari Pasangan Mahasiswa Dari Prodi yang sama
SELECT A.NamaMahasiswa AS Mahasiswa1,
       B.NamaMahasiswa As Mahasiswa2,
       A.Prodi
FROM Mahasiswa A
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID; --agar nga ada pasangan yang saama

SELECT A.NamaMahasiswa As Mahasiswa1,
       B.NamaMahasiswa AS Mahasiswa1,
       A.Prodi
FROM Mahasiswa A
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID > B.MahasiswaId;

--Latihan
--1.Tampilkan nama mahasiswa (NamaMahasiswa) beserta prodi-nya (Prodi) dari tabel Mahasiswa,tetapi hanya mahasiswa yang memiliki nilai di tabel Nilai.

SELECT M.NamaMahasiswa, M.Prodi
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--2.Tampilkan nama dosen(NamaDosen) dan ruangan(KodeRuangan) tempat dosen tersebut mengajar

SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
INNER JOIN JadwalKuliah JK ON D.DosenID = JK.DosenID
INNER JOIN Ruangan R ON JK.RuanganID = R.RuanganID;

--3. Tampilkan daftar mahasiswa (NamaMahasiswa) yang mengambil suatu mata kuliah(NamaMK) beserta nama mata kuliah dan dosen pengampu-nya(NamaDosen)

SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM Mahasiswa M
INNER JOIN KRS K ON M.MahasiswaID = K.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

--4. Tampilkan jadwal kuliah berisi nama mata kuliah(NamaMK), nama dosen(NamaDosen), dan hari kuliah(Hari) tetapi tidak perlu menampilkan ruangan.

SELECT MK.NamaMK, D.NamaDosen, JK.Hari
FROM JadwalKuliah JK
INNER JOIN MataKuliah MK ON JK.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON JK.DosenID = D.DosenID;

--5. Tampilkan nilai mahasiswa(NilaiAkhir) lengkap dengan nama mahasiswa(NamaMahasiswa) nama mata kuliah (NamaMK) , nama dosen pengampu(NamaDosen) dan nilai akhirnya(NilaiAkhir)

SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

