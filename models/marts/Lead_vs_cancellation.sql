SELECT 
    CASE 
        WHEN lead_time < 7 THEN '0-7 days'
        WHEN lead_time < 30 THEN '7-30 days'
        WHEN lead_time < 90 THEN '30-90 days'
        ELSE '90+ days'
    END as lead_time_bucket,
    AVG(is_canceled) as cancellation_rate
FROM 
    {{ ref('stg_hotel_bookings') }}
GROUP BY 
    1
ORDER BY 
    1