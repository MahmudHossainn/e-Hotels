SET search_path = 'ProjectPrototype';

-- hotel_chain

INSERT INTO HOTEL_CHAIN (chain_name, street_number, street_name, city, "province/state", country, "ZIP")
VALUES ('string', 'string', 'string', 'string', 'string', 'string', 'string');

DELETE FROM HOTEL_CHAIN
WHERE chain_name = 'string' AND number_of_hotels = 0;

UPDATE HOTEL_CHAIN
SET 
    street_number = 'string', 
    street_name = 'string',
    city = 'string',
    "province/state" = 'string',
    country = 'string',
    "ZIP" = 'string'
WHERE chain_name = 'string';

-- chain_phone

INSERT INTO CHAIN_PHONE (chain_name, phone)
VALUES ('string', 'string');

DELETE FROM CHAIN_PHONE
WHERE chain_name = ''string'' AND phone = 'string';

-- chain_email

INSERT INTO CHAIN_EMAIL (chain_name, email)
VALUES ('string', 'string');

DELETE FROM CHAIN_EMAIL
WHERE chain_name = ''string'' AND email = 'string';

-- hotel

INSERT INTO HOTEL (hotel_name, rating, street_number, street_name, city, "province/state", country, "ZIP", manager_id, chain_name)
VALUES ('string', int, 'string', 'string', 'string', 'string', 'string', 'string', int, 'string');

DELETE FROM HOTEL
WHERE hotel_id = int AND number_of_rooms = 0;

UPDATE HOTEL 
SET 
    hotel_name = 'string',
    rating = int,
    street_number = 'string', 
    street_name = 'string',
    city = 'string',
    "province/state" = 'string',
    country = 'string',
    "ZIP" = 'string',
    manager_id = int
WHERE hotel_id = int;

-- hotel_phone

INSERT INTO HOTEL_PHONE (hotel_id, phone)
VALUES ('string', 'string');

DELETE FROM HOTEL_PHONE
WHERE hotel_id = 'string' AND phone = 'string';

-- hotel_email

INSERT INTO HOTEL_EMAIL (hotel_id, email)
VALUES ('string', 'string');

DELETE FROM HOTEL_EMAIL
WHERE hotel_id = 'string' AND email = 'string';

-- room

INSERT INTO ROOM (hotel_id, price, capacity, view, extendable, room_number)
VALUES (int, int, int, 'string', boolean, int);

DELETE FROM ROOM 
WHERE hotel_id = int AND room_id = int;

UPDATE ROOM 
SET 
    price = int, 
    capacity = int,
    view = 'string',
    extendable = 'string',
    room_number = int,
WHERE hotel_id = int AND room_id = int;

-- problem

INSERT INTO PROBLEM (hotel_id, room_id, problem_description)
VALUES (int, int, 'string');

DELETE FROM PROBLEM 
WHERE hotel_id = int AND room_id = int AND problem_description = 'string';

-- amenity

INSERT INTO AMENITY (hotel_id, room_id, amenity_name)
VALUES (int, int, 'string');

DELETE FROM AMENITY 
WHERE hotel_id = int AND room_id = int AND amenity_name = 'string';

-- customer

INSERT INTO CUSTOMER (id_type, first_name, last_name, street_number, street_name, city, "province/state", country, "ZIP", date_of_regestration)
VALUES ('string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'date');

DELETE FROM CUSTOMER 
WHERE customer_id = int;

UPDATE CUSTOMER 
SET 
    Id_type = int, 
    first_name = 'string', 
    last_name = 'string', 
    street_number = 'string', 
    street_name = 'string', 
    city = 'string', 
    "province/state" = 'string', 
    country = 'string', 
    "ZIP" = 'string'
WHERE customer_id = int;

-- employee

INSERT INTO EMPLOYEE (hotel_id, first_name, last_name, street_number, street_name, city, "province/state", country, "ZIP")
VALUES (int, 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string');

DELETE FROM EMPLOYEE 
WHERE employee_id = int;

UPDATE EMPLOYEE 
SET 
    hotel_id = int, 
    first_name = 'string', 
    last_name = 'string', 
    street_number = 'string', 
    street_name = 'string', 
    city = 'string', 
    "province/state" = 'string', 
    country = 'string', 
    "ZIP" = 'string'
WHERE employee_id = int;

-- employee_role

INSERT INTO EMPLOYEE_ROLE (employee_id, "role")
VALUES (int, 'string');

DELETE FROM EMPLOYEE_ROLE 
WHERE employee_id = int AND "role" = 'string';

-- booking

INSERT INTO BOOKING (room_id, hotel_id, start_date, end_date, customer_id)
VALUES (int, int, 'date', 'date', int);

DELETE FROM BOOKING 
WHERE room_id = int AND hotel_id = int AND start_date = 'date';

UPDATE BOOKING 
SET 
    end_date = 'date', 
    customer_id = int
WHERE room_id = int AND hotel_id = int AND start_date = int;

-- renting

INSERT INTO RENTING (room_id, hotel_id, start_date, end_date, employee_id, customer_id, payment_info)
VALUES (int, int, 'date', 'date', int, int, 'string')
WHERE EXISTS (
    SELECT 1 
    FROM EMPLOYEE 
    WHERE employee_id = int 
    AND hotel_id = int -- hotel_id of employee must match
);

DELETE FROM RENTING 
WHERE room_id = int AND hotel_id = int AND start_date = int;

UPDATE RENTING 
SET 
    end_date = date, 
    employee_id = int, 
    customer_id = int, 
    payment_info = 'string'
WHERE room_id = int AND hotel_id = int AND start_date = int AND EXISTS (
    SELECT 1
    FROM EMPLOYEE
    WHERE employee_id = int
    AND hotel_id = int -- hotel_id of employee must match
    );

-- booking_history

INSERT INTO BOOKING_HISTORY (room_id, hotel_id, start_date, end_date, customer_id)
VALUES (int, int, date, date, int);

DELETE FROM BOOKING_HISTORY 
WHERE room_id = int AND hotel_id = int AND start_date = int;

-- rental_history

INSERT INTO RENTAL_HISTORY (room_id, hotel_id, start_date, end_date, employee_id, customer_id)
VALUES (int, int, date, date, int, int);

DELETE FROM RENTAL_HISTORY 
WHERE room_id = int AND hotel_id = int AND start_date = int;