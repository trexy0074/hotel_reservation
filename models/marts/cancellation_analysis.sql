SELECT 
    customer_type,
    COUNT(*) as total_bookings,
    SUM(is_canceled) as cancellations,
    ROUND(SUM(is_canceled)*100.0/COUNT(*), 2) as cancellation_rate
FROM 
    {{ ref('stg_hotel_bookings') }}
GROUP BY 
    customer_type
ORDER BY 
    cancellation_rate DESC