SELECT reporting_period AS Month
	,reporting_airport
	,airline_name AS Airlines
	,origin_destination_country
	,origin_destination
	,CASE 
		WHEN arrival_departure = 'A'
			THEN 'ARRIVAL'
		WHEN arrival_departure = 'D'
			THEN 'DEPARTURE'
		ELSE NULL
		END AS arrival_departure
	,CASE 
		WHEN scheduled_charter = 'S'
			THEN 'SCHEDULED'
		WHEN scheduled_charter = 'C'
			THEN 'CHARTER'
		ELSE NULL
		END AS scheduled_charter
	,number_flights_matched AS TotalFLightsFlown
	,number_flights_cancelled AS CancelledFlights
	,ROUND((flights_more_than_15_minutes_early_percent / 100) * (number_flights_matched)) AS FLT_15_Plus_minutes_early
	,ROUND((flights_15_minutes_early_to_1_minute_early_percent / 100) * (number_flights_matched)) AS FLT_1_To_15_Mins_Early
	,- ROUND((flights_0_to_15_minutes_late_percent / 100) * (number_flights_matched)) AS FLT_0_to_15_minutes_late
	,- ROUND((flights_between_16_and_30_minutes_late_percent / 100) * (number_flights_matched)) AS FLT_16_to_30_minutes_late
	,- ROUND((flights_between_31_and_60_minutes_late_percent / 100) * (number_flights_matched)) AS FLT_31_to_60_minutes_late
	,- ROUND((flights_between_61_and_120_minutes_late_percent / 100) * (number_flights_matched)) AS FLT_61_to_120_minutes_late
	,- ROUND((flights_between_121_and_180_minutes_late_percent / 100) * (number_flights_matched)) AS FLT_121_to_180_minutes_late
	,- ROUND((flights_between_181_and_360_minutes_late_percent / 100) * (number_flights_matched)) AS FLT_181_to_360_minutes_late
	,coalesce(average_delay_mins, 0) AS average_delay_mins
FROM `uk-flight-punctuality.Flight_Punctuality.Flight_Analysis_EXT`
WHERE number_flights_matched > 0
	AND flights_unmatched_percent = 0
	AND arrival_departure IS NOT NULL
