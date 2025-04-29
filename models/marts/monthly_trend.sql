SELECT 
    arrival_date_month,
    COUNT(*) as total_bookings,
    AVG(adr) as average_daily_rate
FROM 
    {{ ref('stg_hotel_bookings') }}
GROUP BY 
    arrival_date_month
ORDER BY 
    EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month'))