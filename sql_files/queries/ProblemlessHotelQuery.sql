--Query 1 Version 2: The room number of all rooms without problems in a given hotel (by ID)
SELECT room_number 
FROM "ProjectPrototype".room LEFT JOIN "ProjectPrototype".problem ON room.room_id = problem.room_id
WHERE problem.room_ID IS NULL AND room.hotel_id = 19 --Change this number to select your hotel
ORDER BY room.hotel_id ASC,room.room_id ASC;