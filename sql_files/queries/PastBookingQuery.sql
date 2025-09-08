--Query 4.2: All bookings past their end date
SELECT booking.room_id, booking.hotel_id, booking.start_date
FROM "ProjectPrototype".booking
WHERE booking.end_date < CURRENT_DATE
ORDER BY room_id ASC, hotel_id