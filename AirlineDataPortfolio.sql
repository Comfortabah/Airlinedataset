Select *
From AirlineDataset


-- Checking the Month with most Depature.
Select
Month([Departure Date]) as Month,
count(*) as TravelCount
from AirlineDataset
group by Month([Departure Date])
order by TravelCount desc

-- Checking the Month with the most Depatures in the United States
Select
Month([Departure Date]) as Month,
count(*) as TravelCount
from AirlineDataset
where [Country Name] = 'United States'
group by Month([Departure Date])
order by TravelCount desc


--Gives a breakdown of passengers by gender and age group, allowing you to see how many passengers fall into each category
Select Gender, Age,
   Case
When Age Between 18 And 30 Then '18-30'
When Age Between 31 And 40 Then '31-40'
When Age Between 41 And 50 Then '41-50'
else '51+'
end as AgeGroup,
count(*) as PassengerCount
from AirlineDataset
group by Gender, Age;


--Shows the most Nationalities amongst travellers
Select Nationality,
count(*) as PassengerNationality
from AirlineDataset
group bY Nationality
order by PassengerNationality desc




-- Shows Airports with delays
Select
[Arrival Airport],
Iif([Flight Status] = 'Delayed', 'True', 'False') as DelayedRate
from AirlineDataset
group by [Arrival Airport], [Flight Status]
order by DelayedRate desc;



--Shows Airports with high delayed arrival rate
with AirportDelayRates as (
select [Arrival Airport],
Sum(Case when [Flight Status] = 'Delayed' Then 1.0 else 0 end) as DelayedFlights,
count(*) as TotalFlights
from AirlineDataset
group by [Arrival Airport]
)
Select top 20
[Arrival Airport],
(DelayedFlights) / TotalFlights as DelayRate
from AirportDelayRates
order by DelayRate desc;


-- This is to understand the variation by country and continent
Select
[Country Name] as Country,
[Airport Continent] as Continent,
count(*) as FlightCount
from AirlineDataset
group by [Country Name], [Airport Continent]
order by Continent, Country

--Verifying the country with the most passengers

Select
[Country Name] as Country,
[Airport Continent] as Continent,
count(*) as FlightCount
from AirlineDataset
group by [Country Name], [Airport Continent]
order by FlightCount desc;







