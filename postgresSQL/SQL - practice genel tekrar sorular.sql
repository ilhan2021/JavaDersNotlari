-- sql_practise 1                                                                             
create table personel                                                                         
(                                                                                             
id serial primary key  ,                                                                      
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
																							  
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 

insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);


-- 1) Tablo bilgilerini listeleyiniz.
select *from personel;

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
SELECT isim, yas, maas FROM personel;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
SELECT * FROM personel where id = 8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyin
SELECT isim, yas, email FROM personel where id = 5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
SELECT * FROM personel where yas >30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel where maas!=21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
SELECT * FROM personel where isim like 'A%';--like kucuk buyuk uyumu arar eger kuck a yazsak 
											--listede kck a ile olmadıgı icn bos liste döner 
SELECT * FROM personel where isim ilike 'a%';--üstteki ile aynı sonucu verir cünkü ilike kck
											-- byk farkı gözetmez
-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
SELECT * FROM personel where isim like '%n';
SELECT * FROM personel where isim ilike '%N';--aynı sonucu verir bu listeye göre eger sonu büyük
											--ile biten olsa idi yukarıdaki onları görmezdi.


-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
SELECT * FROM personel where email like '%gmail%';--ILIKE ilede çözülebilir

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel where email Not like '%gmail%';

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
SELECT * FROM personel where id in (3,5,7,9); 

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel where yas not in (39 ,48, 54); 

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
SELECT * FROM personel where yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
SELECT * FROM personel where yas not between 30 and 40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
SELECT * FROM personel where email is null;

-- 16) personel bilgilerini yaşa göre sıralayınız.
SELECT * FROM personel ORDER BY YAS;

-- 17) personel bilgilerini maaşa göre sıralayınız.
SELECT * FROM personel ORDER BY MAAS;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
SELECT * FROM personel ORDER BY yas DESC;

-- 20) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
SELECT * FROM personel ORDER BY MAAS DESC;

-- 21) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
SELECT * FROM personel ORDER BY MAAS desc limit 3;



==============================================================

CREATE TABLE workers 
(  
  id int, 
  name varchar(20),
  title varchar(60),
  manager_id int 
);

INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;


-- Tabloya company_industry isminde sütun ekleyiniz




-- TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.


    
-- tablodaki worker_address sütununu siliniz



-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.



-- Tablonun ismini employees olarak değişitiriniz.


-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.



-- Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.



=============================================================

-- TABLOYA DATA EKLEME

CREATE TABLE students
(
    student_id CHAR(3) PRIMARY KEY,
    student_name VARCHAR(50) UNIQUE,
    student_age int NOT NULL,
    student_dob DATE,
    CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20)
    
);


-- Tam veri girişi
INSERT INTO students VALUES(101, 'ALI CAN', 13, '021-08-11');
INSERT INTO students VALUES(102, 'VELI HAN', 14, '2007-08-10');
INSERT INTO students VALUES(103, 'AYSE TAN', 14, '2007-08-08');
INSERT INTO students VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO students VALUES(105, 'TOM HANKS', 20, '2005-10-12');
INSERT INTO students VALUES(106, 'ANGELINA JULIE', 18, '1986-10-12');
INSERT INTO students VALUES(107, 'BRAD PITT', 0, '2021-08-10');

-- Parçalı veri girişi
INSERT INTO students(student_id, student_age) VALUES('108', 17);
INSERT INTO students(student_name, student_id, student_age) VALUES('JOHN DAVID', '109', 20);

select * from students;


-- 101 id öğrencinin ismini 'LEO OCEAN' olarak güncelleyinin


-- 101 id öğrencinin yasini 22 olarak güncelleyinin


-- 101 id öğrencinin ismini 'ALI CAN' olarak güncelleyinin


-- 109 idli öğrencinin doğumtarihini 2010-12-11 olarak update yapın.


--ilk iki veriden sonra 5 veriyi listeleyiniz


-- yasi en buyyuk 4. 5.  6. kişilerin bilgilerini listeleyiniz





--  ================== SUBQUERIES ==========================
--  SORGU içinde çalişan SORGUYA SUBQUERY (ALT SORGU) denilir.

CREATE TABLE calisanlar 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
    
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
    
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
    
select * from calisanlar;
select * from markalar;
    

-- SORU1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

                   
-- SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz. 


-- SORU3: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.


  
/* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlari(SUM,COUNT, MIN,MAX, AVG) Subquery içinde kullanilabilir.
    Ancak, Sorgu tek bir değer döndürüyor olmalidir.
    SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmammalı
==============================================================================*/   
      
-- SORU4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen bir Sorgu yaziniz.

 

-- SORU5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.



-- SORU6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

-- SORU7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.



============================================================
interview questions 
CREATE TABLE personel6
(
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO personel6 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel6 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel6 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel6 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');  
INSERT INTO personel6 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel6 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel6 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

SELECT *
FROM personel6;

CREATE TABLE isciler 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'texas', 2500, 'IBM');


SELECT *
FROM isciler;

-- 1) Her iki tablodaki ortak id’leri ve 
--     personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz




-- 2) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin


-- 3)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin



-- 4) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin

							
							
 --5)Isciler tablosunda ikinci en yuksek maasi alan kisinin tum bilgilerini listeleyen sorgu yaziniz