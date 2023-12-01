SELECT movies.title,
time_slot.day, time_slot.start_hr, time_slot.start_min,
screens.screen num, screens.seat_type, screens.screen_type, screens.capacity
CASE
WHERE ((movies.start_month =8) AND (movies.start_day < 15)) THEN 'T'
WHERE ((movies.end_month = 8) AND (movies.end_day > 15)) THEN 'T'
WHERE 8 BETWEEN movies.start_month AND movies.end_month THEN 'T'
ELSE 'F'
END AS comp
FROM movies INNER JOIN screens ON movies.screen_ID = screens.screen_ID
UNION
movies INNER JOIN time_slot ON movies.time_slot_ID = time_slot.slot_ID
WHERE comp = 'T' AND movies.loc_ID = 1;
