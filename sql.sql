SELECT movies.title, 
time_slot.day, time_slot.start_hr, time_slot.start_min, 
screens.screen_num, screens.seat_type, screens.screen_type, screens.capacity
FROM movies INNER JOIN screens ON movies.screen_ID = screens.screen_ID
UNION
movies INNER JOIN time_slot ON movies.time_slot_ID = time_slot.slot_ID
WHERE 8 BETWEEN movies.start_date AND movies.end_date AND loc_ID = 1
