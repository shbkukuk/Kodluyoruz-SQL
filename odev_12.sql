-- 1)film tablosunda film uzunluğu length sütununda gösterilmektedir. 
--Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) AS "film sayısı" FROM film
WHERE length > (
SELECT AVG(length) FROM film);
--2)film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*) AS "en yüksek rental_rate" FROM film
WHERE rental_rate = ANY 
(SELECT MAX(rental_rate) 
FROM film);
--3)film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT COUNT(*) AS "film sayısı" FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film) AND replacement_cost = (SELECT MAX(replacement_cost) FROM film);
--4)payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT customer_id FROM payment 
GROUP BY customer_id HAVING COUNT(*) = ALL
( SELECT COUNT(*) FROM payment GROUP BY customer_id );
