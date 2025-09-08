--Query 1: All rooms without problems
SELECT room.room_id, room.hotel_id, room_number 
FROM "ProjectPrototype".room LEFT JOIN "ProjectPrototype".problem ON room.room_id= problem.room_id
--Left join is used to also give rows with null problems that we can filter out. 
WHERE problem.room_ID IS NULL
ORDER BY room.hotel_id ASC,room.room_id ASC;
