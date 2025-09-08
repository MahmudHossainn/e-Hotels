SET search_path = 'ProjectPrototype';

-- triggers

-- update number of hotels in hotel_chain
CREATE OR REPLACE FUNCTION update_number_of_hotels_insert() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE HOTEL_CHAIN
    SET number_of_hotels = number_of_hotels + 1
    WHERE chain_name = NEW.chain_name;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_hotel
AFTER INSERT ON HOTEL
FOR EACH ROW
EXECUTE FUNCTION update_number_of_hotels_insert();

CREATE OR REPLACE FUNCTION update_number_of_hotels_delete() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE HOTEL_CHAIN
    SET number_of_hotels = number_of_hotels - 1
    WHERE chain_name = OLD.chain_name;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_delete_hotel
AFTER DELETE ON HOTEL
FOR EACH ROW
EXECUTE FUNCTION update_number_of_hotels_delete();

-- update number of rooms in hotel
CREATE OR REPLACE FUNCTION update_number_of_rooms_insert() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE HOTEL
    SET number_of_rooms = number_of_rooms + 1
    WHERE hotel_id = NEW.hotel_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_room
AFTER INSERT ON ROOM
FOR EACH ROW
EXECUTE FUNCTION update_number_of_rooms_insert();

CREATE OR REPLACE FUNCTION update_number_of_rooms_delete() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE HOTEL
    SET number_of_rooms = number_of_rooms - 1
    WHERE hotel_id = OLD.hotel_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_delete_room
AFTER DELETE ON ROOM
FOR EACH ROW
EXECUTE FUNCTION update_number_of_rooms_delete();

-- prevent overlapping bookings/rentings
CREATE OR REPLACE FUNCTION prevent_overlapping_bookings_rentings() 
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM BOOKING
        WHERE room_id = NEW.room_id 
          AND hotel_id = NEW.hotel_id
          AND (customer_id != NEW.customer_id)
          AND (
            (NEW.start_date >= start_date AND NEW.start_date <= end_date)
            OR
            (NEW.end_date >= start_date AND NEW.end_date <= end_date)
            OR
            (NEW.start_date <= start_date AND NEW.end_date >= start_date)
        )
    )
    OR EXISTS (
        SELECT 1
        FROM RENTING
        WHERE room_id = NEW.room_id 
          AND hotel_id = NEW.hotel_id
          AND (customer_id != NEW.customer_id)
          AND (
            (NEW.start_date >= start_date AND NEW.start_date <= end_date)
            OR
            (NEW.end_date >= start_date AND NEW.end_date <= end_date)
            OR
            (NEW.start_date <= start_date AND NEW.end_date >= start_date)
        )
    ) THEN
        RAISE EXCEPTION 'Booking or Renting overlaps with an existing booking/renting for this room';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_booking_overlaps
BEFORE INSERT ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION prevent_overlapping_bookings_rentings();

CREATE TRIGGER check_renting_overlaps
BEFORE INSERT ON RENTING
FOR EACH ROW
EXECUTE FUNCTION prevent_overlapping_bookings_rentings();

CREATE TRIGGER check_booking_overlaps_update
BEFORE UPDATE ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION prevent_overlapping_bookings_rentings();

CREATE TRIGGER check_renting_overlaps_update
BEFORE UPDATE ON RENTING
FOR EACH ROW
EXECUTE FUNCTION prevent_overlapping_bookings_rentings();

-- prevent advanced booking
CREATE OR REPLACE FUNCTION prevent_advance_booking() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.start_date > CURRENT_DATE + INTERVAL '1 year' THEN
        RAISE EXCEPTION 'Booking cannot be made more than 1 year in advance';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_advance_booking
BEFORE INSERT ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION prevent_advance_booking();

CREATE TRIGGER check_advance_booking_update
BEFORE UPDATE ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION prevent_advance_booking();

-- prevent multiple bookings/rentings at the same hotel
CREATE OR REPLACE FUNCTION prevent_multiple_bookings_and_rentings_at_same_hotel()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM BOOKING
        WHERE customer_id = NEW.customer_id
          AND hotel_id = NEW.hotel_id
		  AND (room_id != NEW.room_id OR start_date != NEW.start_date or end_date != NEW.end_date)
          AND (
            (NEW.start_date >= start_date AND NEW.start_date <= end_date)
            OR
            (NEW.end_date >= start_date AND NEW.end_date <= end_date)
            OR
            (NEW.start_date <= start_date AND NEW.end_date >= start_date)
        )
    )
    OR EXISTS (
        SELECT 1
        FROM RENTING
        WHERE customer_id = NEW.customer_id
          AND hotel_id = NEW.hotel_id
          AND (
            (NEW.start_date >= start_date AND NEW.start_date <= end_date)
            OR
            (NEW.end_date >= start_date AND NEW.end_date <= end_date)
            OR
            (NEW.start_date <= start_date AND NEW.end_date >= start_date)
        )
    ) THEN
        RAISE EXCEPTION 'Customer already has a booking or renting at this hotel during the selected period';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_multiple_bookings_at_same_hotel
BEFORE INSERT OR UPDATE ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION prevent_multiple_bookings_and_rentings_at_same_hotel();

CREATE TRIGGER check_multiple_rentings_at_same_hotel
BEFORE INSERT OR UPDATE ON RENTING
FOR EACH ROW
EXECUTE FUNCTION prevent_multiple_bookings_and_rentings_at_same_hotel();

-- prevent deleting bookings to close to start
CREATE OR REPLACE FUNCTION prevent_delete_booking_within_1_day() 
RETURNS TRIGGER AS $$
BEGIN
    IF CURRENT_DATE = OLD.start_date OR CURRENT_DATE = OLD.start_date - INTERVAL '1 day' THEN
        RAISE EXCEPTION 'Booking cannot be deleted less than 1 day before the start date';
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_delete_booking
BEFORE DELETE ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION prevent_delete_booking_within_1_day();

-- copy booking to history
CREATE OR REPLACE FUNCTION copy_booking_to_history() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO BOOKING_HISTORY (room_id, hotel_id, start_date, end_date, customer_id)
    VALUES (OLD.room_id, OLD.hotel_id, OLD.start_date, OLD.end_date, OLD.customer_id);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER copy_booking_to_history_trigger
AFTER DELETE ON BOOKING
FOR EACH ROW
EXECUTE FUNCTION copy_booking_to_history();

-- copy renting to history
CREATE OR REPLACE FUNCTION copy_renting_to_history()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO RENTAL_HISTORY (room_id, hotel_id, start_date, end_date, employee_id, customer_id)
    VALUES (OLD.room_id, OLD.hotel_id, OLD.start_date, OLD.end_date, OLD.employee_id, OLD.customer_id);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER copy_renting_to_history_trigger
AFTER DELETE ON RENTING
FOR EACH ROW
EXECUTE FUNCTION copy_renting_to_history();

-- indexes

CREATE INDEX idx_hotel_chain_name ON HOTEL (chain_name);
/*
This single column index on HOTEL.chain_name will be helpful in our hotel management system, 
as queries often need to find hotels based on the chain_name.
For example, if a user wants to find all hotels under a specific hotel chain, 
this query could use an index on the chain_name column.

Example query:
SELECT * FROM HOTEL WHERE chain_name = 'Chain A';

When updating or deleting hotels by their chain_name, 
having this index would speed up the operation by quickly identifying which rows need to be modified or removed.

Example update query:
UPDATE HOTEL SET rating = 5 WHERE chain_name = 'Chain A';

The chain_name column can be used often to filter in queries. 
Indexing it will significantly improve search performance when looking for hotels from a particular chain, 
especially if the database has a large number of hotels across various chains.
*/

CREATE INDEX idx_booking_room_hotel ON BOOKING (room_id, hotel_id);
/*
This multicolumn index on BOOKING.room_id and BOOKING.hotel_id will help with common operations in the hotel system 
like checking or querying bookings for a specific room in a specific hotel. 
For example, queries that look for bookings in a particular room in a given hotel would benefit from this index.

Example query:
SELECT * FROM BOOKING WHERE room_id = 101 AND hotel_id = 1;

When inserting, updating, or deleting bookings, 
the system often needs to identify a specific booking based on both the room_id and hotel_id. 
Using this index allows the database to quickly find the relevant row in the BOOKING table.

Example update query:
UPDATE BOOKING SET start_date = '2025-06-01' WHERE room_ID = 30 AND hotel_ID = 20;

Since room_ID and hotel_ID are frequently used together in queries and are also part of the primary key for the BOOKING table, 
creating a multicolumn index on these two columns will help speed up searches for bookings by room and hotel. 
This is important for operations like checking availability or querying booking details for a particular room in a given hotel.
*/

CREATE INDEX idx_sea_view_rooms ON ROOM (room_id, view) WHERE view = 'Sea';
/*
This partial index on ROOM.room_id and ROOM.view will significantly speed up queries that search for rooms with a sea view. 
For instance, a query looking for available sea view rooms, which are typically in demand, will benefit from this index.

Example query:
SELECT * FROM ROOM WHERE view = 'Sea';

The index will only include rooms with a sea view, which reduces the number of rows in the index. 
This makes the index more efficient and speeds up query execution. 
Without the partial index, all of the rooms would be scanned, which would be less efficient.

By limiting the index to sea view rooms, the database can quickly locate the relevant rooms without scanning other unnecessary rows. 
This is particularly useful for hotel booking systems, where users often search for rooms with specific views and availability.
*/

-- views

-- View 1: The number of available rooms per area.
CREATE VIEW available_rooms_per_area AS
SELECT 
    H.city,
    H."province/state",
    H.country,
    COUNT(R.room_id) AS available_rooms
FROM 
    ROOM R
JOIN 
    HOTEL H ON R.hotel_id = H.hotel_id
LEFT JOIN 
    BOOKING B ON R.room_id = B.room_id AND R.hotel_id = B.hotel_id
    AND B.start_date <= CURRENT_DATE AND B.end_date >= CURRENT_DATE
WHERE 
    B.room_id IS NULL
GROUP BY 
    H.city, H."province/state", H.country;

--View 2: the second view is the aggregated capacity of all the rooms of a specific hotel.
CREATE VIEW hotel_room_capacity AS
SELECT 
    R.hotel_id, 
    H.hotel_name,
    SUM(R.capacity) AS total_capacity
FROM 
    ROOM R
JOIN 
    HOTEL H ON R.hotel_id = H.hotel_id
GROUP BY 
    R.hotel_id, H.hotel_name;
