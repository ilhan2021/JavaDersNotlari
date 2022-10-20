-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama))
-Subquery içinde de kullanılır
-ANcak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
*/
--ALIAS (AS) toplada geçici isim vermek istersek koşuldan
--sonra AS sutun_isim olarak kullanılır


select * from calisanlar2;
select * from markalar;

--calisanlar2 tablosundaki en yuksek maaş degerini listeleyiniz
SELECT max(maas) from calisanlar2

--Calisanlar tablosundaki maaşların toplamını listeleyiniz
SELECT sum(maas) from calisanlar2
--Calıcanlar tablosundaki maas ortalamalını listeleyiniz
SELECT avg(maas) from calisanlar2
SELECT round(avg(maas)) from calisanlar2
SELECT round(avg(maas),2) from calisanlar2
--
--Calisanlar toplasundan en düşük maası listeleyiniz
SELECT min(maas) from calisanlar2;
--Calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz
SELECT count(maas) from calisanlar2;

-- Her markanin ismini, calisan sayisini ve o 
--markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim,calisan_sayisi,(SELECT sum(maas)from calisanlar2
WHERE marka_isim = isyeri) AS toplam_maas from markalar;

--NOT:

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,(SELECT MAX(maas)from calisanlar2 where marka_isim = isyeri)As max_maas,
								  (SELECT MIN(maas)from calisanlar2 where marka_isim = isyeri)as min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde 
--bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_isim, marka_id, (SELECT count (sehir) from calisanlar2 

							  
--Interview Question: En yüksek ikinci maas değerini çağırın.
SELECT max (maas) AS enYuksek_ikinci_maas from calisanlar2
WHERE maas < (SELECT max (maas)from calisanlar2);	
							  
--Interview Question: En dusuk ikinci maas değerini çağırın.
SELECT min (maas) AS endusuk_ikinci_maas from calisanlar2
WHERE maas >(SELECT min (maas)from calisanlar2);
							  
--Interview Question: En yüksek ucuncu maas değerini çağırın.
SELECT max (maas) AS enYuksek_ucuncu_maas from calisanlar2
WHERE maas >(SELECT min (maas)from calisanlar2
Where maas >(SELECT min (maas)from calisanlar2));
							  
--Interview Question: En dusuk ucuncu maas değerini çağırın.
SELECT min (maas) AS enDusuk_ucuncu_maas from calisanlar2
WHERE maas > (SELECT min (maas)from calisanlar2
Where maas<(SELECT max (maas)from calisanlar2));							  