CREATE EXTERNAL TABLE `uk-flight-punctuality.Flight_Punctuality.Flight_Analysis_EXT` OPTIONS (
	skip_leading_rows = 1
	,format = "CSV"
	,uris = ["gs://ukfligtinfo/*.csv"]
	);

select * from uk-flight-punctuality.Flight_Punctuality.Flight_Analysis_EXT