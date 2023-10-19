CREATE OR REPLACE TABLE `datawithburhan.uber_data_engineering_yt.final_analytics` AS (
SELECT 
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pl.pickup_latitude,
pl.pickup_longitude,
dl.dropoff_latitude,
dl.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 

`datawithburhan.uber_data_engineering_yt.fact_table` f
JOIN `datawithburhan.uber_data_engineering_yt.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `datawithburhan.uber_data_engineering_yt.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `datawithburhan.uber_data_engineering_yt.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `datawithburhan.uber_data_engineering_yt.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `datawithburhan.uber_data_engineering_yt.pickup_location_dim` pl ON pl.pickup_location_id=f.pickup_location_id
JOIN `datawithburhan.uber_data_engineering_yt.dropoff_location_dim` dl ON dl.dropoff_location_id=f.dropoff_location_id
JOIN `datawithburhan.uber_data_engineering_yt.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id);