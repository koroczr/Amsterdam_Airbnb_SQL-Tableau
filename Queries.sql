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
    neighbourhood,
    AVG(minimum_nights) AS avarage_minimum_nights,
    AVG(price) AS avg_price,
    AVG(price) * AVG(minimum_nights) AS price_w_nights
FROM
    listings
GROUP BY neighbourhood
ORDER BY AVG(price) * AVG(minimum_nights) DESC
LIMIT 100;


-- What is the most visited neighborhoods?

SELECT 
    l.neighbourhood, COUNT(l.neighbourhood)
FROM
    listings AS l
        JOIN
    reviews AS r ON l.id = r.listing_id
GROUP BY l.neighbourhood
ORDER BY COUNT(l.neighbourhood) DESC;

-- Who does have more than 20 apartments? People name and location of apartments.


SELECT 
    host_id,
    host_name,
    latitude,
    longitude,
    room_type,
    price,
    minimum_nights
FROM
    listings
WHERE
    host_id IN (SELECT 
            host_id
        FROM
            listings
        GROUP BY host_id
        HAVING COUNT(host_id) > 20);


SELECT 
    host_id, host_name, COUNT(host_id) as number_of_apartments 
FROM
    listings
GROUP BY host_id
HAVING number_of_apartments  > 20
ORDER BY number_of_apartments  DESC;



