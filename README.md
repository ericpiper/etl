# etl
Project 2- ETL


Data will be compiled from two sources related to California wildfires from 2013 to 2020 and California drough conditions from 2013 to 2020. 

Data is originated from Kaggle and the US Drought Monitor.


### Data Source(s)
https://drive.google.com/drive/folders/1Mnv9AQAnsckjfqfL2I-V6TqD8hTSrFyf?usp=sharing



Project Report:


*EXTRACT*

Original data sources (both in CSV format): 
	-Kaggle: https://www.kaggle.com/ananthu017/california-wildfire-incidents-20132020
	-https://droughtmonitor.unl.edu/


*TRANSFORM*

California_Drought_Data
* Drop columns
    *Mapdate is a duplicate date of Start_date
    *StatisticsFormatID are all the number 1
    *FIPS is a Weather Service ID
    *State all are CA
 * Removed county from county names
 * Renamed columns with underscores and lower-cases for postgres

California_Fire_Data
* Drop columns that we determined to be unimportant or containing information that was exactly the same throughout
    * CanonicalUrl - URL was partial and not necessary
    * ConditionStatement - notes about the fire, not relevent for the purposes of the join
    * ControlStatement - notes on how to manage populations; not relevent
    * StructuresEvacuated - no data
    * UniqueId - removed to create postgres ID for the file
    * Updated - last time the report was updated; irrelevent for this data
    * Featured - boolean and no specific information referenced; all FALSE
    * Final - boolean and all information was TRUE, not referenced
    * Public - boolean and all information was TRUE
    * Status - all fires are finalized and inactive
    * ArchiveYear -  archive date of the data, irrelevent to the report
    * PercentContained - all data was 100%, finalized and extinguished (except for fires with missing information that was removed)
    * CalFireIncident - boolean indicating whether a fire was featured on the CaFire website
* Dropped county ID to use our own
* Dropped search description because keywords was already information provided in the data
* Dropped rows related to fires that were not applicable, such as fires in other states and countries
* Use datetime and removed the timestamp and format 
* Renamed columns with underscores, lower-cases for postgres; renamed counties column to county for matching
* Indexed the dataframes to remove the index column

*Created the database connection and confirmed the tables


*LOAD*

* Loaded the dataframes into postgres (relational database)
* Postgres chosen because the information presented a 1:1 relationship and a relational database was the most approporate for the data
* Created counties, drought, and fire tables. Counties was assigned the PRIMARY KEY
* There were commonalitites in the information related to dates, location; county was chosen for the PRIMARY KEY because of the geographic relationship of the infomation



