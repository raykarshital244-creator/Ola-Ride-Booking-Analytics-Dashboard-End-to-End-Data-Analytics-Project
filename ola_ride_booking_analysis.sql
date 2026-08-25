create database ola_ride_analytics;
use ola_ride_analytics;

select * from ola_bookings;

# To Solve Business Questions

-- 1.What is the total number of bookings?
select count(*) as total_bookings from ola_bookings;

-- 2.How many bookings are there for each booking status?
select Booking_Status, count(*) as total_bookings
from ola_bookings group by Booking_Status;

-- 3.How many successful bookings are there?
select count(*) as successful_bookings from ola_bookings
where Booking_Status='success';

-- 4.What is the booking percentage for each booking status?
select Booking_Status,count(*) *100.0/ (select count(*) from ola_bookings) as percentage
 from ola_bookings group by Booking_Status;
 
 -- 5.Which vehicle type has the highest number of bookings?
 select Vehicle_Type, count(*) as total_bookings from ola_bookings
 group by Vehicle_Type order by total_bookings desc;
 
 -- 6.Which vehicle type generates the highest revenue?
 select Vehicle_Type, sum(Booking_Value) as revenue
 from ola_bookings where Booking_Status="success"
 group by Vehicle_Type order by revenue desc;
 
 -- 7.What is the total revenue from successful bookings?
 select sum(Booking_Value) as total_revenue from ola_bookings
 where Booking_Status="success";
 
 -- 8.What is the average booking value?
 select avg(Booking_Value) as avg_booking_value from ola_bookings
 where Booking_Status="success";
 
 -- 9.What is the average ride distance?
 select avg(Ride_Distance) as avg_ride_distance from ola_bookings
 where Booking_status="success";
 
 -- 10.Which payment method is used the most?
 select Payment_Method, count(*) as total_bookings
 from ola_bookings group by Payment_Method order by total_bookings desc;
 
 -- 11.What are the top 10 pickup locations?
 select Pickup_Location, count(*) total_bookings from ola_bookings
 group by Pickup_Location order by total_bookings desc limit 10;
 
 -- 12.What are the top 10 drop locations?
  select Drop_Location, count(*) total_bookings from ola_bookings
 group by Drop_Location order by total_bookings desc limit 10;
 
 -- 13.How many rides were cancelled by drivers?
 select count(*) as Driver_Cancellations from ola_bookings
 where Booking_Status="Canceled by Driver";
 
 -- 14.How many rides were cancelled by customers?
  select count(*) as Customer_Cancellations from ola_bookings
 where Booking_Status="Canceled by Customer";
 
 -- 15.What are the average driver and customer ratings?
 select avg(Driver_Ratings) as avg_Driver_Rating,
 avg(Customer_Rating) as avg_Customer_Rating from ola_bookings;
 
 -- 16.What is the average booking value for each booking status?
 select Booking_Status, avg(booking_value) as avg_booking_value from ola_bookings
 group by Booking_Status;
 
 -- 17.What is the average ride distance for each booking status?
 select Booking_Status, avg(Ride_Distance) as avg_ride_distance from ola_bookings
 group by Booking_Status;
 
 -- 18.Which vehicle type has the highest number of successful bookings?
 select Vehicle_Type, count(*) as successful_bookings from ola_bookings
 where Booking_Status="success" group by Vehicle_Type order by successful_bookings;
 
 -- 19.Which day has the highest average booking value?
 select Day, avg(booking_value) as avg_booking_value from ola_bookings
 group by Day order by avg_booking_value desc;
 
 -- 20.Which hour has the highest number of successful bookings?
 select Hour, count(*) as successful_bookings from ola_bookings
 where Booking_Status="success" group by Hour order by successful_bookings desc;
 
 
 
