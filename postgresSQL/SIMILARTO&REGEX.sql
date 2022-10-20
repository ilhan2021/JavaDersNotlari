-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
REGEX : Herhangi bir kod, medin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır
PostgreSQL'de "~" karakteri ile kullanılır.
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
Select * from kelimeler;

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır
--SIMILAR TO ile
select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot|Ot|oT|At|aT|OT)%';
--LIKE ile
select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%';
select * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%'
--REGEX
select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at'

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz

--SIMILAR TO ILE
select * from kelimeler Where kelime similar to 'ho%|hi%'; 

-- LİKE ile
select * from kelimeler WHERE kelime ~~* 'hi%' or kelime ~~* 'ho%'

--REGEX ILE
select * FROM kelimeler where kelime ~* 'h[oi](.*)'; --REGEXte nokta bir karakteri temsil eder
--Regex'de ikinci karakter için köşeli parantez kullanılır. * hepsi anlamında kullanılır


--Sonu 't' veya 'm' ile bitenleri listeleyeniz

--SIMILAR TO İLE
select * from kelimeler Where kelime similar to '%t|%m';
-- REGEX ILE
select * FROM kelimeler where kelime ~* '(.*)[tm]$';--$ isareti bitisi gosterir


--h ile baslayip t ile biten 3 harfli kelimeleri listeleyiniz
--SIMILAR TO İLE
select * from kelimeler Where kelime similar to 'h[a-z,A-Z,0-9]t';
--LIKE ILE
select * from kelimeler Where kelime ~~*'h_t';
--REGEX ILE
select * from kelimeler Where kelime ~*'h[a-z,A-Z,0-9]t';


--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 
--'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
--SIMILAR TO ILE
select kelime  from kelimeler Where kelime similar to 'h[a-e]%t';
--REGEX ILE
select kelime  from kelimeler Where kelime ~*'h[a-e](.*)t';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[say](.*)'; -- ^ başlangıç'ı temsil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın
select * from kelimeler where kelime ~ '(.*)[maf]$';

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 
--3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR TO ILE
select * from kelimeler where kelime ~ 'h[a|i]t';

select * from kelimeler where kelime ~ '^h[a|i]t;


--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter
-- üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz
select * from kelimeler where kelime similar to '%[o][o]%';
select * from kelimeler where kelime similar to '%[o]{2}%';


--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o]{4}%';

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[a|s|y](.*)[m|f]$';

