-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Nov 2026 pada 08.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp_05`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(10) DEFAULT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `harga`, `stok`, `supplier_id`) VALUES
(1, 'BRG001', 'Beras Ramos 5kg', 68000, 50, 1),
(2, 'BRG002', 'Minyak Goreng 2L', 34000, 80, 2),
(3, 'BRG003', 'Gula Pasir 1kg', 17000, 100, 3),
(4, 'BRG004', 'Tepung Terigu 1kg', 12000, 60, 4),
(5, 'BRG005', 'Kecap Manis 550ml', 21000, 40, 5),
(6, 'BRG006', 'Susu UHT 1L', 19500, 45, 6),
(7, 'BRG007', 'Kopi Bubuk 200g', 15000, 70, 7),
(8, 'BRG008', 'Teh Celup Isi 25', 8500, 90, 8),
(9, 'BRG009', 'Mie Instan Goreng (Kardus)', 115000, 30, 9),
(10, 'BRG010', 'Sabun Mandi Cair 450ml', 24000, 55, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `jenis_kelamin`, `telp`, `alamat`) VALUES
(1, 'Ahmad Fauzi', 'L', '081211112222', 'Jl. Mawar No. 1, Surabaya'),
(2, 'Nurul Hidayah', 'P', '081222223333', 'Jl. Melati No. 5, Sidoarjo'),
(3, 'Rizky Pratama', 'L', '081233334444', 'Jl. Anggrek No. 10, Gresik'),
(4, 'Anisa Rahmawati', 'P', '081244445555', 'Jl. Flamboyan No. 2, Surabaya'),
(5, 'Dimas Setiawan', 'L', '081255556666', 'Jl. Kenanga No. 8, Bangkalan'),
(6, 'Fitri Handayani', 'P', '081266667777', 'Jl. Cempaka No. 12, Surabaya'),
(7, 'Bayu Wicaksono', 'L', '081277778888', 'Jl. Dahlia No. 4, Mojokerto'),
(8, 'Mega Putri', 'P', '081288889999', 'Jl. Tulip No. 7, Surabaya'),
(9, 'Doni Saputra', 'L', '081299990000', 'Jl. Kamboja No. 9, Sidoarjo'),
(10, 'Tiara Andini', 'P', '081300001111', 'Jl. Teratai No. 3, Surabaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `waktu_bayar` datetime NOT NULL,
  `total` int(11) NOT NULL,
  `metode` enum('TUNAI','TRANSFER','EDC') NOT NULL,
  `transaksi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `waktu_bayar`, `total`, `metode`, `transaksi_id`) VALUES
(1, '2026-10-01 10:15:00', 102000, 'TUNAI', 1),
(2, '2026-10-02 11:30:00', 51000, 'TRANSFER', 2),
(3, '2026-10-03 14:00:00', 45000, 'EDC', 3),
(4, '2026-10-04 09:20:00', 115000, 'TRANSFER', 4),
(5, '2026-10-05 16:45:00', 43500, 'TUNAI', 5),
(6, '2026-10-06 13:10:00', 136000, 'EDC', 6),
(7, '2026-10-07 15:25:00', 68000, 'TUNAI', 7),
(8, '2026-10-08 17:50:00', 23500, 'TUNAI', 8),
(9, '2026-10-09 18:05:00', 60000, 'TRANSFER', 9),
(10, '2026-10-10 20:00:00', 39000, 'EDC', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `telp`, `alamat`) VALUES
(1, 'PT. Maju Bersama', '0812345678', 'Surabaya'),
(2, 'PT. Senang Sekali', '0815155631', 'Bangkalan'),
(3, 'PT. Segar Segar', '0845454663', 'Surabaya'),
(4, 'CV. Sumber Makmur', '0821345678', 'Sidoarjo'),
(5, 'PT. Berkah Jaya', '0819876543', 'Malang'),
(6, 'CV. Abadi Sentosa', '0878123456', 'Gresik'),
(7, 'PT. Cahaya Terang', '0852345678', 'Mojokerto'),
(8, 'CV. Mitra Utama', '0813987654', 'Surabaya'),
(9, 'PT. Bintang Kejora', '0822456789', 'Kediri'),
(10, 'CV. Harapan Bangsa', '0816789012', 'Pasuruan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `waktu_transaksi` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `pelanggan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `waktu_transaksi`, `keterangan`, `total`, `pelanggan_id`) VALUES
(1, '2026-10-01', 'Belanja Kebutuhan Pokok', 102000, 1),
(2, '2026-10-02', 'Belanja Mingguan', 51000, 2),
(3, '2026-10-03', 'Pembelian Bahan Dapur', 45000, 3),
(4, '2026-10-04', 'Belanja Sembako', 115000, 4),
(5, '2026-10-05', 'Belanja Rumah Tangga', 43500, 5),
(6, '2026-10-06', 'Stok Warung', 136000, 6),
(7, '2026-10-07', 'Belanja Bulanan', 68000, 7),
(8, '2026-10-08', 'Belanja Harian', 23500, 8),
(9, '2026-10-09', 'Persiapan Acara', 60000, 9),
(10, '2026-10-10', 'Belanja Akhir Pekan', 39000, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `transaksi_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`transaksi_id`, `barang_id`, `harga`, `qty`) VALUES
(1, 1, 68000, 1),
(1, 2, 34000, 1),
(2, 2, 34000, 1),
(3, 3, 17000, 2),
(4, 9, 115000, 1),
(5, 5, 21000, 1),
(6, 1, 68000, 2),
(7, 2, 34000, 2),
(8, 7, 15000, 1),
(9, 4, 12000, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` tinyint(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `alamat`, `hp`, `level`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrator Utama', 'Jl. Pemuda No. 10, Surabaya', '081234567890', 1),
(2, 'kasir1', 'de28f8f7998f23ab4194b51a6029416f', 'Budi Santoso', 'Jl. Diponegoro No. 12, Surabaya', '081234567891', 2),
(3, 'kasir2', 'de28f8f7998f23ab4194b51a6029416f', 'Siti Aminah', 'Jl. Pahlawan No. 45, Sidoarjo', '081234567892', 2),
(4, 'gudang1', 'cbb7449d78314665f9e7c7dd0a18a68a', 'Agus Prayogo', 'Jl. Basuki Rahmat No. 3, Surabaya', '081234567893', 3),
(5, 'gudang2', 'cbb7449d78314665f9e7c7dd0a18a68a', 'Eko Prasetyo', 'Jl. Kartini No. 88, Gresik', '081234567894', 3),
(6, 'manajer', '5fbb69663039903931daf8b26344b76b', 'Rina Wijaya', 'Jl. Darmo No. 15, Surabaya', '081234567895', 1),
(7, 'kasir3', 'de28f8f7998f23ab4194b51a6029416f', 'Dewi Lestari', 'Jl. Mayjend Sungkono, Surabaya', '081234567896', 2),
(8, 'supervisor', '6ade4163a398335a0a2abced430cf869', 'Hendra Gunawan', 'Jl. Ahmad Yani No. 20, Surabaya', '081234567897', 1),
(9, 'audit', 'd33542b8458db8cabd9843fe7c1e8784', 'Fajar Nugraha', 'Jl. Kenjeran No. 50, Surabaya', '081234567898', 1),
(10, 'owner', '5be057accb25758101fa5eadbbd79503', 'Bambang Soediro', 'Jl. Kertajaya Indah, Surabaya', '081234567899', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_barang_supplier` (`supplier_id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembayaran_transaksi` (`transaksi_id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaksi_pelanggan` (`pelanggan_id`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`transaksi_id`,`barang_id`),
  ADD KEY `fk_detail_barang` (`barang_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_barang_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_transaksi` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_pelanggan` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `fk_detail_barang` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
