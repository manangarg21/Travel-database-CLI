
GIVEN 
SELECT* FROM USER_DETAILS WHERE Date_change_pass < DATE_SUB(NOW(),INTERVAL 1 MONTH);
SELECT* from TRAVEL_ITINERARY WHERE DATEDIFF(end_date,start_date)=3;


-- INSERTION of a new user

INSERT INTO USER_DETAILS(user_id, username, email, pass, DOB, Date_change_pass, age)
VALUES 
    (1, 'JohnDoe', 'john@example.com', 'hashed_password', '1990-01-15', '2023-12-01', 33)
    ;

-- adding new accomo 
-- ismein chaman ne loc varchar kar rkhi hai , usko dekh liyo agar int se refer krna hai loc id ko for key bnakr
INSERT INTO ACCOMODATIONS (
    accommodation_id,
    accommodation_name,
    type_of_accomodation,
    location,
    is_massage_provided,
    is_buffet_provided,
    is_swimming_pool_present,
    AC_rooms_provided,
    extra_services,
    cost
) VALUES 
    (1, 'Hotel ABC', 'Hotel', 'City Center', 'Yes', 'Yes', 'Yes', 'Yes', 'Wi-Fi, Parking', 150)
    ;



-- INSERT A NEW DISH AT A LOCATION
INSERT INTO FAMOUS_DISHES (dish_id, cuisine_id, dish_name)
VALUES 
    (1, 101, 'Spaghetti Bolognese');
INSERT INTO DISHES_AT_LOCATION (dish_id, location)
VALUES 
    (1, 11);

-- UPDATION

-- updation of a hotel fascilities in a city's all hotels
-- like denying swimming pool in winters

UPDATE ACCOMODATIONS
SET 
    is_massage_provided = 'Yes',  
    is_swimming_pool_present = 'No' 
WHERE 
    location = 'City Center';

-- update password for a user
UPDATE USER_DETAILS
SET 
    pass = 'new_password',
    Date_change_pass = CURRENT_DATE 
WHERE 
    user_id = 123;


-- Projection


SELECT  TRAVEL_ITINERARY.itinerary_id, TRAVEL_DETAILS.user_id, TRAVEL_ITINERARY.cost
FROM TRAVEL_DETAILS
JOIN TRAVEL_ITINERARY ON TRAVEL_DETAILS.itinerary_id = TRAVEL_ITINERARY.itinerary_id;

--  finding review of an accomodation

SELECT r.rating , r.review_desc from REVIEWS as r JOIN ACCOMODATION_REVIEW as ar on ar.review_id = r.review_id where ar.accommodation_id=1;



-- ANALYSIS ones

-- finding most eaten cuisine at a place

SELECT c.cuisine_name
FROM CUISINES AS c
WHERE c.cuisine_id = (
    SELECT f.cuisine_id
    FROM FAMOUS_DISHES AS f
    JOIN DISHES_AT_LOCATION AS d ON d.dish_id = f.dish_id
    WHERE d.location = 1
    GROUP BY f.cuisine_id
    ORDER BY COUNT(f.cuisine_id) DESC
    LIMIT 1
);


--  slider
--  given

 SELECT i.itinerary_id from TRAVEL_ITENAERARY as i where i.itinerary_id in
    -> (SELECT DISTINCT si.itinerary_id from SEGMENT_IN_ITINERARY as si JOIN SEGMENTS as s on si.segment_id = s.segment_id where s.destination = 'GIVEN')
    -> AND 
    -> i.cost < 20000  -- slider max value
    -> AND 
    -> i.cost > 10000  -- slide min value
    -> ;


    






