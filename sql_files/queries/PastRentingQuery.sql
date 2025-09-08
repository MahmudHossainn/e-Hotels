--Query 4.1: All rentings past their end date
SELECT renting.room_id, renting.hotel_id, renting.start_date,renting.end_date
FROM "ProjectPrototype".renting
WHERE renting.end_date < CURRENT_DATE
ORDER BY room_id ASC, hotel_id