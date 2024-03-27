
select * from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]

-- What is the total number of reservations in the dataset?

select count(Booking_ID) as number_of_reservations
from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]

--Which meal plan is the most popular among guests?

select top 1 type_of_meal_plan, count(type_of_meal_plan) as no_of_times_used
from [Hotel Reservation].[dbo].[Hotel Reservation Dataset] 
group by type_of_meal_plan
order by no_of_times_used desc


 --What is the average price per room for reservations involving children?

 select Booking_ID, no_of_children, avg_price_per_room, room_type_reserved
 from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]
 where no_of_children >0

 select avg(avg_price_per_room)
 from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]
 where no_of_children > 0

-- How many reservations were made for the year 2018?select count(Booking_ID) as no_of_reservations_in_2018from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]where arrival_date like '%2018%'-- What is the most commonly booked room type?
select top 1 room_type_reserved,  count(room_type_reserved) as no_of_times_bookedfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]group by room_type_reservedorder by no_of_times_booked desc --How many reservations fall on a weekend (no_of_weekend_nights > 0)?select count(Booking_ID) as  no_of_weekend_nights_reservationsfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]where no_of_weekend_nights > 0-- What is the highest and lowest lead time for reservations?--the lowest lead timeselect top 1 lead_timefrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]order by lead_time--the highest lead timeselect top 1 lead_time, Booking_IDfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]order by lead_time desc--What is the most common market segment type for reservations?select top 1 market_segment_type, count(market_segment_type) as no_of_times_usedfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]group by market_segment_typeorder by no_of_times_used desc --How many reservations have a booking status of "Confirmed"?select count(booking_status) no_of_confirmed_bookingsfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]where booking_status = 'Not_Canceled'--What is the total number of adults and children across all reservations?select sum(no_of_adults + no_of_children) as total_no_of_peoplefrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]--What is the average number of weekend nights for reservations involving children?select avg(no_of_weekend_nights)from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]where no_of_children > 0-- How many reservations were made in each month of the year?select month(arrival_date) as month , count(Booking_ID) as no_of_reservationsfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]group by month(arrival_date)order by month(arrival_date)--What is the average number of nights (both weekend and weekday) spent by guests for each room type? select room_type_reserved, avg(no_of_weekend_nights + no_of_week_nights) as avg_no_of_nightsfrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]group by room_type_reserved-- For reservations involving children, what is the most common room type, and what is the average price for that room type?select room_type_reserved, avg(avg_price_per_room) as avg_price_by_room_type from [Hotel Reservation].[dbo].[Hotel Reservation Dataset]where no_of_children > 0group by room_type_reservedorder by avg_price_by_room_type desc--Find the market segment type that generates the highest average price per room.select market_segment_type, avg(avg_price_per_room) as avg_pricefrom [Hotel Reservation].[dbo].[Hotel Reservation Dataset]group by market_segment_typeorder by market_segment_type desc