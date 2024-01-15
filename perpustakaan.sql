-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2024 pada 13.58
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(255) DEFAULT NULL,
  `TahunTerbit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`BukuID`, `Judul`, `Pengarang`, `TahunTerbit`) VALUES
(1, 'Interaksi Manusia Dan Komputer', 'Rudi Hartono', 2023),
(2, 'Jaringan Komputer', 'Jajang Nurwahid', 2020),
(3, 'Bahasa C', 'Deden Komarudin', 2021),
(4, 'Pemrograman Internet', 'Teguh Ashoy', 2021),
(5, 'Basis Data', 'Maman Joki', 2022);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpeminjaman`
--

CREATE TABLE `detailpeminjaman` (
  `id_det` int(11) NOT NULL,
  `PeminjamanID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detailpeminjaman`
--

INSERT INTO `detailpeminjaman` (`id_det`, `PeminjamanID`, `BukuID`) VALUES
(1, 5, 3),
(3, 3, 1),
(4, 2, 2),
(5, 1, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `PeminjamID` int(11) NOT NULL,
  `NamaPeminjam` varchar(255) NOT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `NoTelepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjam`
--

INSERT INTO `peminjam` (`PeminjamID`, `NamaPeminjam`, `Alamat`, `NoTelepon`) VALUES
(1, 'Dinda', 'Ciamis', '085223424123'),
(2, 'Fazryan', 'Ciamis', '08773123123'),
(3, 'Mayasari', 'Ciamis', '082213285123'),
(4, 'Sukma', 'Tasikmalaya', '087731264512');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `PeminjamanID` int(11) NOT NULL,
  `PeminjamID` int(11) DEFAULT NULL,
  `TanggalPinjam` date DEFAULT NULL,
  `TanggalKembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`PeminjamanID`, `PeminjamID`, `TanggalPinjam`, `TanggalKembali`) VALUES
(1, 1, '2023-12-30', '2023-12-31'),
(2, 2, '2023-12-31', '2024-01-02'),
(3, 3, '2023-12-28', '2023-12-31'),
(5, 4, '2023-12-19', '2023-12-22');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`BukuID`);

--
-- Indeks untuk tabel `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  ADD PRIMARY KEY (`id_det`),
  ADD KEY `PeminjamanID` (`PeminjamanID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`PeminjamID`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `PeminjamID` (`PeminjamID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  MODIFY `id_det` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `PeminjamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  ADD CONSTRAINT `detailpeminjaman_ibfk_1` FOREIGN KEY (`PeminjamanID`) REFERENCES `peminjaman` (`PeminjamanID`),
  ADD CONSTRAINT `detailpeminjaman_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`PeminjamID`) REFERENCES `peminjam` (`PeminjamID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
