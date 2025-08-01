CREATE TABLE IF NOT EXISTS flight_data (
`Year` Int32,
`Quarter` Int32,
`Month` Int32,
`DayofMonth` Int32,
`DayOfWeek` Int32,
`FlightDate` String,
`Reporting_Airline` String,
`DOT_ID_Reporting_Airline` Int32,
`IATA_CODE_Reporting_Airline` String,
`Tail_Number` String,
`Flight_Number_Reporting_Airline` Int32,
`OriginAirportID` Int32,
`OriginAirportSeqID` Int32,
`OriginCityMarketID` Int32,
`Origin` String,
`OriginCityName` String,
`OriginState` String,
`OriginStateFips` Int32,
`OriginStateName` String,
`OriginWac` Int32,
`DestAirportID` Int32,
`DestAirportSeqID` Int32,
`DestCityMarketID` Int32,
`Dest` String,
`DestCityName` String,
`DestState` String,
`DestStateFips` Int32,
`DestStateName` String,
`DestWac` Int32,
`CRSDepTime` Int32,
`DepTime` Float64,
`DepDelay` Float64,
`DepDelayMinutes` Float64,
`DepDel15` Float64,
`DepartureDelayGroups` Float64,
`DepTimeBlk` String,
`TaxiOut` Float64,
`WheelsOff` Float64,
`WheelsOn` Float64,
`TaxiIn` Float64,
`CRSArrTime` Int32,
`ArrTime` Float64,
`ArrDelay` Float64,
`ArrDelayMinutes` Float64,
`ArrDel15` Float64,
`ArrivalDelayGroups` Float64,
`ArrTimeBlk` String,
`Cancelled` Float64,
`CancellationCode` Float64,
`Diverted` Float64,
`CRSElapsedTime` Float64,
`ActualElapsedTime` Float64,
`AirTime` Float64,
`Flights` Float64,
`Distance` Float64,
`DistanceGroup` Int32,
`CarrierDelay` Float64,
`WeatherDelay` Float64,
`NASDelay` Float64,
`SecurityDelay` Float64,
`LateAircraftDelay` Float64,
`FirstDepTime` Float64,
`TotalAddGTime` Float64,
`LongestAddGTime` Float64,
`DivAirportLandings` Float64,
`DivReachedDest` Float64,
`DivActualElapsedTime` Float64,
`DivArrDelay` Float64,
`DivDistance` Float64,
`Div1Airport` Float64,
`Div1AirportID` Float64,
`Div1AirportSeqID` Float64,
`Div1WheelsOn` Float64,
`Div1TotalGTime` Float64,
`Div1LongestGTime` Float64,
`Div1WheelsOff` Float64,
`Div1TailNum` Float64,
`Div2Airport` Float64,
`Div2AirportID` Float64,
`Div2AirportSeqID` Float64,
`Div2WheelsOn` Float64,
`Div2TotalGTime` Float64,
`Div2LongestGTime` Float64,
`Div2WheelsOff` Float64,
`Div2TailNum` Float64,
`Div3Airport` Float64,
`Div3AirportID` Float64,
`Div3AirportSeqID` Float64,
`Div3WheelsOn` Float64,
`Div3TotalGTime` Float64,
`Div3LongestGTime` Float64,
`Div3WheelsOff` Float64,
`Div3TailNum` Float64,
`Div4Airport` Float64,
`Div4AirportID` Float64,
`Div4AirportSeqID` Float64,
`Div4WheelsOn` Float64,
`Div4TotalGTime` Float64,
`Div4LongestGTime` Float64,
`Div4WheelsOff` Float64,
`Div4TailNum` Float64,
`Div5Airport` Float64,
`Div5AirportID` Float64,
`Div5AirportSeqID` Float64,
`Div5WheelsOn` Float64,
`Div5TotalGTime` Float64,
`Div5LongestGTime` Float64,
`Div5WheelsOff` Float64,
`Div5TailNum` String,
`Unnamed: 109` Float64
) ENGINE = MergeTree() ORDER BY FlightDate;