/*
DDL-> DATA DEFINITION LANGUAGE
CREATE-ALTER-DROP
*/
-- CREATE - TABLO OLUŞTURMA-
CREATE table OGRENCI(
OGR_NO int,
OGR_ISIM VARCHAR(30),
NOTLAR REAL,
YAS int,
ADRES VARCHAR(50),
KAYİT_TARİHİ DATE
);
-- VAROLAN TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE table ogr_notlari
AS
SELECT OGR_NO, NOTLAR FROM OGRENCI;
SELECT * FROM OGRENCI;
SELECT * FROM OGR_NOTLARI;