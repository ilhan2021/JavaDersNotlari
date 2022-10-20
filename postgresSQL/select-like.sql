CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');--unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--Not NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--unique
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --not NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--Prımary key
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--prımary key
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--prımary key Not NULL

select * from calisanlar;

-- FOREIGN KEY--

CREATE TABLE adresler
(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;

INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');-- kabul etmedi
--üst satir açıklama Parent tabloda olmayan id ile child tabloya ekleme yapamayız 

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');

--Calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin alt satir
SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;

DROP table calisanlar;-- bu calismaz cunku parentı üst satirda child a baglanti yaptik once child tabloyu sil sil diyor.

delete from calisanlar where id='10002';--Parent

delete from adresler WHERE adres_id='10002';--child

Drop table calisanlar;--Parent oldugu icin once child silinmeli diyor

--ON DELETE CASCADE--
-- HER DEFASINDA ONCE CHİLD TABLODAKİ VERILERI SILMEK YERINE
-- ON DELETE CASCADE SİLME OZELLİGİNİ AKTİF HALE GETİREBİLİRSİNİZ.
-- Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
							 
CREATE TABLE notlar
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

SELECT * FROM talebeler;
select * from notlar;

delete from notlar where talebe_id='123';
delete from talebeler where id= '126'; -- ON DELETE CASCADE kullandıgımız icin PARENT table'dan direk silebildik
							 --Parent table'dan sildigimiz icin child table dan da silinmis oldu.
	
DROP table talebeler CASCADE; -- PARENT tabloyu kaldırmak istersek Drop table tablo_adı'ndan sonra 
							 --CASCADE komutunu kullaniriz.
							
-- Talebeler tablosundaki isim sutununa NOT NULL kısıtlaması ekleyiniz ve veri tipini VARCHAR(30)olarak degistiriniz 
alter TABLE talebeler
alter column isim TYPE VARCHAR(30),
alter column isim SET NOT NULL;	

-- Talebeler tablosundaki yazılı_notu sutununa 60 dan büyük rakam girilebilsin
alter table talebeler 
ADD CONSTRAINT sinir CHECK (yazili_notu>60);
--CHECK kısıtlaması ile tablodaki istediğimiz sutunu sınırlandırabiliriz
-- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi
INSERT INTO talebeler VALUES(128, 'Mustafa Can', 'Hasan',45);

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler;
select * from ogrenci_adres;

--Tablodaki bir sutunu primary key ekleme 1. yol
alter table ogrenciler
ADD PRIMARY KEY (id);

-- Tablodaki bir sutunu primary key ekleme 2. yol
alter table ogrenciler
ADD Constraint pk_id PRIMARY KEY (id);

--Pkey den sonra foreign key atamasi
ALTER TABLE ogrenci_adres
ADD FOREIGN KEY (id) REFERENCES ogrenciler;-- Child tabloyu parent tablodan olusturdugumuz icin column adi vermedik

--PK'yi Silme CONSTRAİNT'i Silme
ALTER TABLE ogrenciler DROP CONSTRAINT pk_id;

--FK'yi Silme CONSTRAİNT'i Silme
ALTER table ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;

-- Sinav notu 85 ten buyuk olan talebe bilgilerini getirin
SELECT * FROM talebeler WHERE yazili_notu>85;
-- ismi MUStafa bak olan ogrenci bilgileri
SELECT * FROM talebeler WHERE isim='Mustafa Bak';

-- SELECT komutunda BETWEEN kosulu
-- BETWEEN belirttiginiz iki veri arasindaki bilgileri listeler
-- BETWEEN de belirttigimiz degerlerde listelemeye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);
/*
    AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler    
*/
SELECT * FROM personel
--id'si 1003 ile 1005 arasında olan personel bilgisini listeleyiniz 1. yol
select* from personel WHERE id BETWEEN '1003' and '1005';

--2.yol
select* from personel WHERE id>='1003' and id<='1005';

-- Derya soylu ile yavuz bal arasindaki personel bilgisini listeleyiniz.
SELECT * from personel WHERE isim between 'Derya Soylu' AND 'Yavuz Bal';

--Maası 70000 veya ismi Sena Personeli listele
SELECT * from personel WHERE maas=70000 OR isim ='Sena';

--IN : Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazabilme imkanı verir
--Farklı sütunlar için IN kullanılamaz

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele 1. yol
select* from personel Where id='1001' or id='1004';
-- 2. yol
select * from personel WHERE id IN ('1001','1002','1004');


-- Maaşı sadece 70000, 100000 olan personeli listele
select * from personel Where maas=70000 or maas=100000;--?
select * from personel Where maas in (70000,100000); -- hocanın cozumu

/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
*/

-- Ismi A harfi ile baSLAYAN PERSONELİ LİSTELE
select * from personel Where isim like'A%';

-- Ismi A harfi ile baSLAYAN PERSONELİ LİSTELE
select * from personel Where isim like'%t';

-- Isminin 2. harfi e olan personeli listeleyiniz
select * from personel Where isim like'_e%';

-- 'a' harfi ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel WHERE isim ~~* 'a%n'

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
SELECT * FROM personel WHERE isim ILIKE '_a_u%';

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel WHERE isim like '_e%y%';

-- a harfi olmayan personeli listeleyin
select * from personel where isim not like '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim ~~* 'A_____a%';

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select isim from personel where isim like '%r_';
