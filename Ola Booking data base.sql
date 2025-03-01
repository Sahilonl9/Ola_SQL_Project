Select * from Bookings

--Retrive all successfull bookings
Create view successfull_booking as
Select * from Bookings
Where booking_status ='Success'
Select * from successfull_booking
-- Find the avg ride distance for each vehicle type
Create view average_distance as
Select vehicle_type, avg(Ride_distance)
as average_distance from bookings 
Group by vehicle_type
Select * From average_distance

--Get the total number of cancled rides by customer
Create view Customer_cancelation As
Select count (*) from Bookings
Where booking_status ='Canceled by Customer'
Select * From Customer_cancelation

-- List the top 5 customers who booked the highest numbers of ride
Create view top_customers as
Select customer_id, count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides DEsc limit 5
Select * from top_customers

-- get the number of rides canceled by drivers due to personal and car- related issues
Create view Personal_and_Car_related_issue as
Select Canceled_rides_by_driver from bookings 
Where Canceled_rides_by_driver = 'Personal & Car related issue'
Select * From Personal_and_Car_related_issue

-- find the maximum and minium driver ratings for prime sedan booking
Create view Drivers_rating_for_sedan as
SELECT 
    MAX(driver_ratings) AS max_rating,
    MIN(driver_ratings) AS min_rating
FROM 
    bookings 
WHERE 
    vehicle_type = 'Prime Sedan';
Select * from Drivers_rating_for_sedan

--Retrive all the rides where payment was made using upi
Select * From bookings 
Where payment_method ='UPI'
--find the avg customer rating per vechile type
Create view average_rating as
Select vehicle_type, avg(customer_rating)
as average_rating from bookings 
Group by vehicle_type;
Select * From average_rating
--calculate the total booking value of rides completed successfully
Create view total_booking_value as
Select sum(booking_value) as total_booking_value
From bookings
Where booking_status = 'Success'
Select * From total_booking_value

--list all incomplete rides along with the reason
Create view lists_and_reasons_incomplete_rides as
Select Incomplete_Rides_Reason from bookings
Where incomplete_rides = 'Yes'
Select * From lists_and_reasons_incomplete_rides
