select 
*
from
listings;


SELECT 
    l.minimum_nights, COUNT(r.date) AS number_dates
FROM
    listings AS l
        JOIN
    reviews AS r ON r.listing_id = l.id
GROUP BY l.minimum_nights
ORDER BY COUNT(r.date) DESC
LIMIT 10;


SELECT 
    l.room_type, COUNT(r.date) AS number_dates
FROM
    listings AS l
        JOIN
    reviews AS r ON r.listing_id = l.id
GROUP BY l.room_type
ORDER BY COUNT(r.date) DESC
LIMIT 10;


SELECT 
    neighbourhood, avg(price)*avg(minimum_nights) AS price_w_nights
FROM
    listings
GROUP BY neighbourhood
ORDER BY avg(price)*avg(minimum_nights) DESC
LIMIT 1000;





SELECT 
    neighbourhood, AVG(minimum_nights) AS avarage_minimum_nights
FROM
    listings
GROUP BY neighbourhood
ORDER BY AVG(minimum_nights) DESC
LIMIT 1000;
