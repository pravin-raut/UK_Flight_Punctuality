#Flight Punctuality Analysis with Power BI
Overview
This project aims to provide a Power BI-based dashboard for analyzing the punctuality statistics of major airports in the UK. The data used in this analysis is collected and compiled by the UK Civil Aviation Authority (CAA) on a monthly basis. The data covers the period from 1990 to the present day.

#Data Acquisition
The CAA provides the punctuality statistics data for 26 major airports in the UK on their website. The data is available for download in CSV format and is updated monthly. The CAA validates the data, but provides no warranty as to its accuracy, integrity, or reliability.

#Preparation and Storing
The downloaded CSV files are stored in Google Cloud Storage. Google BigQuery is used to consume the data and transform it into a format that is more suitable for analysis. The CAA provides the data in the form of percentages, but for the purposes of analysis, it is more helpful to convert these percentages to actual numbers.

#Tools Used
Power BI
Google Cloud Storage
Google BigQuery
