This Project is to analyze seven Gas pipelines of Canada(Alliance, Brunswick, Enbridge, Foothills, Ngtl, TC Canada Mainline and TQM) and nine Oil pipelines of 
Canada(Cochin, Enbridge Line9,Keystone, Montreal, Norman Wells, Southern Lights, Trans Mountain, Trans Northern, Westpur).Analysis is performed over 2019-2022 
to compare Gas pipeline and Oil pipeline based on throughput and capacity, Number of incidents happened on different pipeline. Furthermore dig deeper into Gas 
and oil pipeline to get answers where incidents happening, cause of incident, which pipeline is efficient, which pipeline use for export import and intra trade 
type and many more.

Data is collected from Canada open data source https://open.canada.ca/data/en/dataset/dc343c43-a592-4a27-8ee7-c77df56afb34 and https://open.canada.ca/data/en/
dataset/fd17f08f-f14d-433f-91df-c90a34e1e9a6

All the csv files are loaded to SQL server using Import and Export Data 64 bit, during load process datatypes are converted to desired format. With attention to
every detail Data is analyzed using select command, unrequired  rows deleted and columns dropped, replacing blank values, used trim command to delete spaces, update 
command to change values, union command is used to join all the gas pipelines in one table  and oil pipelines in one table, standardize the date format, using substring
and charindex  commands two column are created for better decision making.

Data is transferred to Visual studio to perform dimensional modeling different dimensions and facts were created from tables using dataflow, control flow, lookup, 
Execute SQL task, etc. Dimensional and Fact tables were created in SQL server. Database diagram is generated to build relationship between tables by developing 
primary and foreign keys.

Data is loaded to Power BI to get visually appealing dashboard and answer to business questions. Using DAX functions such as sum, calculate, percentage, Related, if, 
Divide  to create measures and columns. Power BI finds all one to Many relations by its own.

Some Important Findings  
Gas is more accident prone as compared to oil. Oil cause more serious injuries as compared to gas. BC has more of Oil Incidents where as AB has more Gas pipeline incidents.

Consumption of Oil is more as compared to Gas in  Canada. As more Vehicles  are operated on Gas with respect to Gas and gas is more used in households as well as more seasonal.

If we study about individual pipes Brunswick pipeline is most efficient pipeline whereas TC Canadian Mainline is least Prairies is the Keypoint where Throughput is much lesser than capacity

Nova Gas Transmission has highest number of incidents which happened Edson because of Fire due to external interference.

TC Canadian Pipeline is used for export import and intra trade type, Only 4%of gas is imported in Canada.

Almost all the pipelines are efficiently pipeline used except Westpur. Trans Northern Pipelines has direction of flow in all the directions
