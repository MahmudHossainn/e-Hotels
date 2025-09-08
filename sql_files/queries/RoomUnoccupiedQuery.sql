--Query 3: All unbooked, unreserved rooms
SELECT room.room_id, room.room_number, room.hotel_id 
FROM "ProjectPrototype".room LEFT JOIN "ProjectPrototype".booking ON room.room_id = booking.room_id
LEFT JOIN "ProjectPrototype".renting ON room.room_id= renting.room_id
WHERE booking.room_id IS NULL AND renting.room_id IS NULL 
--Booking.room_id and Renting.room_id are only null when a booking doesn't exist and is generated via the left join. 
ORDER BY room_id ASC, hotel_id, room_number ASC 