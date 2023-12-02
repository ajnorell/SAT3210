SELECT movies.title, 
time_slot.day, time_slot.start_hr, time_slot.start_min, 
screens.screen_num, screens.seat_type, screens.screen_type, screens.capacity
FROM 
time_slot INNER JOIN movies ON movies.time_slot_ID = time_slot.slot_ID INNER JOIN screens ON movies.screen_ID = screens.screen_ID
WHERE 2023-08-15 BETWEEN movies.start_date AND movies.end_date AND movies.loc_ID = 1
