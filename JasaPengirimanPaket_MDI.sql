CREATE TABLE `kurir` (
  `id_kurir` VARCHAR(20) PRIMARY KEY NOT NULL,
  `nama_kurir` VARCHAR(100) NOT NULL,
  `no_telp_kurir` VARCHAR(15) NOT NULL,
  `email_kurir` VARCHAR(50) NOT NULL
);

CREATE TABLE `paket` (
  `id_paket` VARCHAR(20) PRIMARY KEY NOT NULL,
  `deskripsi` VARCHAR(100) NOT NULL,
  `berat_paket` VARCHAR(20) NOT NULL,
  `pengiriman_id_pengiriman` VARCHAR(20) NOT NULL
);

CREATE TABLE `pelanggan` (
  `id_pelanggan` VARCHAR(20) PRIMARY KEY NOT NULL,
  `nama_pelanggan` VARCHAR(100) NOT NULL,
  `no_telp_pelanggan` VARCHAR(15) NOT NULL,
  `alamat_pelanggan` VARCHAR(100) NOT NULL,
  `email_pelanggan` VARCHAR(50)
);

CREATE TABLE `pengantaran` (
  `id_pengantaran` VARCHAR(20) PRIMARY KEY NOT NULL,
  `status_pengantaran` VARCHAR(50) NOT NULL,
  `waktu_pengantaran` DATE NOT NULL,
  `pengiriman_id_pengiriman` VARCHAR(20) NOT NULL,
  `kurir_id_kurir` VARCHAR(20) NOT NULL
);

CREATE TABLE `pengiriman` (
  `id_pengiriman` VARCHAR(20) PRIMARY KEY NOT NULL,
  `tanggal_pengiriman` DATE NOT NULL,
  `status_pengiriman` VARCHAR(50) NOT NULL,
  `tanggal_sampai` DATE NOT NULL,
  `pesanan_id_pesanan` VARCHAR(20) NOT NULL
);

CREATE TABLE `pesanan` (
  `id_pesanan` VARCHAR(20) PRIMARY KEY NOT NULL,
  `tanggal_pesanan` DATE NOT NULL,
  `jumlah_total` VARCHAR(20) NOT NULL,
  `status_pesanan` VARCHAR(50) NOT NULL,
  `pelanggan_id_pelanggan` VARCHAR(20) NOT NULL
);

ALTER TABLE `paket` ADD CONSTRAINT `paket_pengiriman_fk` FOREIGN KEY (`pengiriman_id_pengiriman`) REFERENCES `pengiriman` (`id_pengiriman`);

ALTER TABLE `pengantaran` ADD CONSTRAINT `pengantaran_kurir_fk` FOREIGN KEY (`kurir_id_kurir`) REFERENCES `kurir` (`id_kurir`);

ALTER TABLE `pengantaran` ADD CONSTRAINT `pengantaran_pengiriman_fk` FOREIGN KEY (`pengiriman_id_pengiriman`) REFERENCES `pengiriman` (`id_pengiriman`);

ALTER TABLE `pengiriman` ADD CONSTRAINT `pengiriman_pesanan_fk` FOREIGN KEY (`pesanan_id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);

ALTER TABLE `pesanan` ADD CONSTRAINT `pesanan_pelanggan_fk` FOREIGN KEY (`pelanggan_id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
