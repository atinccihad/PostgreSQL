
-- satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
-- sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
SELECT urun_adi, COUNT(isim) as kisi_sayisi from manav
where urun_adi is not null
group by urun_adi


-- satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
-- MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu yazınız.
SELECT urun_adi, min(urun_miktari) as minimum_urun_mik, max(urun_miktari) as maksimum_urun_mik from manav    
where urun_adi is not null
group by urun_adi
order by maksimum_urun_mik



-- kisi ismine ve urun adına göre satılan ürünlerin toplamını gruplandıran 
-- ve isime göre ters sırasıda listeyen sorguyu yazınız.
SELECT isim, urun_adi, sum(urun_miktari) as toplam_urun from manav
group by isim, urun_adi
order by isim desc;


-- Personeli, ulkelere göre ve şehirlere göre gruplayarak sorgulayın
SELECT ulke,sehir from personel
group by ulke,sehir

-- Her ulke için bay ve bayan çalışan sayısı ve yaş ortalamasını sorgulayınız.
SELECT ulke,cinsiyet,count(*) as calisan_sayisi, round(avg(yas)) as yas_ortalamasi from personel
group by ulke, cinsiyet

-- isim i null olanlari sorgula
SELECT * from insanlar where isim is null

-- null olmayanları listeleyelim
select * from insanlar WHERE isim is not null

-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
UPDATE insanlar
SET isim = 'NO NAME'
WHERE isim is null

--NOT : Çoklu değişimde her değişim için SET ... WHERE isim IS NULL gibi 
--ifade yazmamak için COALESCE(Birleştirme) kullanılır 

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

UPDATE insanlar
SET isim = coalesce (isim, 'HENUZ ISIM GIRILMEDI'),
    adres = coalesce (adres, 'HUNUZ ADRES GIRILMEDI'),
    ssn = coalesce (ssn, 'NO SSN');
	
	
  --MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 

SELECT urun_id, musteri_isim from mart				
WHERE exists (SELECT urun_id from nisan WHERE mart.urun_id = nisan.urun_id)







