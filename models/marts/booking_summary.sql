SELECT
    hotel,
    country,
    customer_type,
    meal,
    reserved_room_type,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS total_cancellations,
    AVG(adr) AS avg_daily_rate,
    AVG(lead_time) AS avg_lead_time
FROM {{ ref('stg_hotel_bookings') }}
GROUP BY hotel, country, customer_type, meal, reserved_room_type
ORDER BY total_bookings DESC
