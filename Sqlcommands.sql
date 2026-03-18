create database ola;
use ola;
drop database ola;
select * from bookings;
set autocommit=0;

select * from bookings;
# Retrieve all successful bookings--
create view Successful_Booking
as select * from bookings where booking_status="success";
select * from Successful_Booking;

#2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings GROUP BY
Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) from bookings where booking_status="Canceled by Customer";

#4. List the top 5 customers who booked the highest number of rides:
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) from bookings where booking_status="Canceled by Driver";
SELECT COUNT(*) FROM bookings WHERE Canceled_Rides_by_Customer = 'Personal & Car
related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
select * from bookings where Payment_Method="UPI";

#8. Find the average customer rating per vehicle type:
Select Vehicle_Type,avg(Customer_Rating) as customer_rating from bookings group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
select SUM(Booking_Value) as total_booking_value from bookings where booking_status="success";

#10. List all incomplete rides along with the reason:

select  Incomplete_Rides_Reason from bookings where Incomplete_Rides= "YES";