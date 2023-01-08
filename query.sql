create database latihan_alif;
\l
\c latihan_alif;

-- struktur tabel
-- one-to-one relationship
create type j_k as enum ('laki-laki', 'perempuan');

create table siswa(
    nisn int primary key,
    nama varchar(255),
    kelas varchar(255),
    umur int,
    jenis_kelamin j_k
);

create table tas(
    id_tas int primary key,
    kapasitas_tas int,
    warna_tas varchar(255),
    nisn int,
    constraint fk_nisn foreign key (nisn) references siswa(nisn)
);

-- one-to-many relationship
create table rumah(
    id_rumah int primary key,
    alamat_rumah varchar(255),
    luas_rumah int,
    warna_rumah varchar(255)
);

create table penghuni(
    id_penghuni int primary key,
    nama_penghuni varchar(255),
    anggota_keluarga_penghuni varchar(255),
    id_rumah int,
    constraint fk_id_rumah foreign key (id_rumah) references rumah(id_rumah)
);

-- many-to-many relationship
create table pengguna(
    email_pengguna varchar(255) primary key,
    nama_pengguna varchar(255),
    pass_pengguna varchar(255) 
);

create table sosial_media(
    nama_sosial_media varchar(255) primary key,
    url_sosial_media varchar(255)
);

create table relasi_pengguna_sosial_media(
    id_relasi_pengguna_sosial_media int primary key,
    email_pengguna varchar(255),
    constraint fk_email_pengguna foreign key (email_pengguna) references pengguna(email_pengguna),
    nama_sosial_media varchar(255),
    constraint fk_nama_sosial_media foreign key (nama_sosial_media) references sosial_media(nama_sosial_media)
);


-- CRUD tabel siswa
-- -- insert
-- insert into siswa(nisn, nama, kelas, umur, jenis_kelamin)
--     values
--         (34486233, 'alif', '12 A', 17, 'laki-laki'),
--         (71495910, 'hose', '12 B', 17, 'laki-laki'),
--         (89391422, 'shania', '12 C', 17, 'perempuan');
-- -- read
-- select * from siswa;
-- select nisn, nama, kelas from siswa;
-- -- update
-- update siswa set nisn=30124342 where nisn=89391422;
-- update siswa set nisn=50741426, nama='alif anke bima p' where nisn=34486233;
-- -- delete
-- delete from siswa where nama='hose';

-- CRUD tabel tas
-- -- insert
-- insert into tas(id_tas, kapasitas_tas, warna_tas, nisn)
--     values
--         (1, 3, 'hitam', (select nisn from siswa where nama='alif anke bima p')),
--         (2, 3, 'hijau', (select nisn from siswa where nama='hose')),
--         (3, 4, 'putih', (select nisn from siswa where nama='shania'));
-- -- read
-- select * from tas;
-- select nisn, id_tas from tas;
-- -- update
-- update tas set warna_tas='coklat' where id_tas=1;
-- -- delete
-- delete from tas where id_tas=3;

-- CRUD tabel rumah
-- -- insert
-- insert into rumah(id_rumah, alamat_rumah, luas_rumah, warna_rumah)
--     values
--         (1, 'jl. lele, bekasi', 240, 'abu-abu'),
--         (2, 'jl. maju mundur, jakarta', 180, 'biru'),
--         (3, 'jl. makmur, bogor', 360, 'hijau');
-- -- read
-- select * from rumah;
-- select id_rumah, alamat_rumah from rumah;
-- -- update
-- update rumah set alamat_rumah='jl. jeruk, tangerang' where id_rumah=3;
-- -- delete
-- delete from rumah where id_rumah=2;

-- CRUD tabel penghuni
-- -- insert
-- insert into penghuni(id_penghuni, nama_penghuni, anggota_keluarga_penghuni, id_rumah)
--     values
--         (12256, 'ilham', 'adik', 1),
--         (16988, 'iqbal', 'kakak', 1),
--         (36714, 'kamal', 'paman', 2);
-- -- read
-- select * from penghuni;
-- select nama_penghuni, anggota_keluarga_penghuni from penghuni;
-- -- update
-- update penghuni set id_penghuni=65843 where nama_penghuni='kamal';
-- -- delete
-- delete from penghuni where id_penghuni=16988;

-- CRUD tabel user
-- insert
-- insert into pengguna(email_pengguna, nama_pengguna, pass_pengguna)
--     values
--         ('alif@gmail.com', 'alif', 'a6#sNpHDL!'),
--         ('kamal@gmail.com', 'kamal', 'nGTye6Xi%d'),
--         ('verdy@gmail.com', 'verdy', '64YKd*nzmo');
-- -- read
-- select * from pengguna;
-- select nama_pengguna, email_pengguna from pengguna;
-- -- update
-- update pengguna set pass_pengguna='Js2Acw$khY' where email_pengguna='alif@gmail.com';
-- -- delete
-- delete from pengguna where email_pengguna='verdy@gmail.com';

-- CRUD tabel sosial_media
-- -- insert
-- insert into sosial_media(nama_sosial_media, url_sosial_media)
--     values
--         ('twitter', 'https://twitter.com/'),
--         ('instagram', 'https://www.instagram.com/'),
--         ('facebook', 'https://www.facebook.com');
-- insert into sosial_media values ('mastodon', 'https://mastodon.social/');
-- -- read
-- select * from sosial_media;
-- -- update
-- update sosial_media set url_sosial_media='https://twitter.com/home' where nama_sosial_media='twitter';
-- -- delete
-- delete from sosial_media where nama_sosial_media='twitter';

-- CRUD tabel relasi_user_sosial_media
-- -- insert
-- insert into relasi_pengguna_sosial_media(id_relasi_pengguna_sosial_media, email_pengguna, nama_sosial_media)
--     values
--         (1, 'alif@gmail.com', 'instagram'),
--         (2, 'alif@gmail.com', 'mastodon'),
--         (3, 'kamal@gmail.com', 'instagram'),
--         (4, 'kamal@gmail.com', 'facebook'),
--         (5, 'kamal@gmail.com', 'twitter'),
--         (6, 'verdy@gmail.com', 'twitter');
-- -- read
-- select * from relasi_pengguna_sosial_media;
-- -- update
-- update relasi_pengguna_sosial_media set nama_sosial_media='mastodon' 
--     where email_pengguna='verdy@gmail.com' and nama_sosial_media='twitter';
-- -- delete
-- delete from relasi_pengguna_sosial_media
--     where email_pengguna='kamal@gmail.com' and nama_sosial_media='facebook';