select 
*
from
listings;


# What type of ’minimum nights’ were prefered based on the number of the reviews?

SELECT 
    l.minimum_nights, COUNT(r.date) AS number_dates
FROM
    listings AS l
        JOIN
    reviews AS r ON r.listing_id = l.id
GROUP BY l.minimum_nights
ORDER BY COUNT(r.date) DESC
LIMIT 10;

# What kind of ’room type’ was the most visited one?
SELECT 
    l.room_type, COUNT(r.date) AS number_dates
FROM
    listings AS l
        JOIN
    reviews AS r ON r.listing_id = l.id
GROUP BY l.room_type
ORDER BY COUNT(r.date) DESC
LIMIT 10;

# Avarage price based on the neighborhoods (with and without number of the minimum nights).

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


