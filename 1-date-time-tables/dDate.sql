-- CREATE DATE DIM TABLE
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver15
-- https://database.guide/get-the-day-of-the-year-from-a-date-in-sql-server-t-sql/

USE [Northwind_SkenderSP]
GO

-- DATE TABLE
CREATE TABLE [dbo].[dDate] (
    [idDate] INT IDENTITY NOT NULL PRIMARY KEY,
    [date] DATE,
    [type] VARCHAR(20),
    [formattedDate] VARCHAR(11),
    [day] INT,
    [month] INT,
    [year] INT,
    [quartal] INT,
    [dayOfWeek] INT,
    [dayOfTheYear] INT,
    [weekOfTheYear] INT,
    [dayOfWeekName] VARCHAR(10),
    [monthName] VARCHAR(10),
    [isWorkday] VARCHAR(3),
    [isLastDayOfTheMonth] VARCHAR(3),
    [season] VARCHAR(6),
    [event] VARCHAR(200),
    [isHoliday] VARCHAR(3),
    [holidayName] VARCHAR(200)
)


INSERT INTO [dbo].[dDate] (
    [type]
)
VALUES (
    'unknown'
)

INSERT INTO [dbo].[dDate] (
    [type]
)
VALUES (
    'has not happened'
)


DECLARE @start_date DATE
DECLARE @end_date DATE
DECLARE @date_i DATE

SET @start_date = CONVERT(DATE, '1.1.2000', 104)
SET @end_date = CONVERT(DATE, '1.1.2023', 104)
SET @date_i = @start_date

SET DATEFIRST 1

WHILE @date_i < @end_date
BEGIN
    INSERT INTO [dbo].[dDate] (
        [date],
        [type],
        [formattedDate],
        [day],
        [month],
        [year],
        [quartal],
        [dayOfWeek],
        [dayOfTheYear],
        [weekOfTheYear],
        [dayOfWeekName],
        [monthName],
        [isWorkday],
        [isLastDayOfTheMonth],
        [season],
        [event],
        [isHoliday],
        [holidayName]
    )
    VALUES (
        @date_i,
        'normal',
        CONVERT(VARCHAR, @date_i, 104) + '.',
        DAY(@date_i),
        MONTH(@date_i),
        YEAR(@date_i),
        DATEPART(q, @date_i),
        DATEPART(w, @date_i),
        DATEPART(dy, @date_i),
        DATEPART(wk, @date_i),
        DATENAME(dw, @date_i),
        FORMAT(@date_i, 'MMMM', 'en-US'),
        CASE
            WHEN DATEPART(w, @date_i) = 7 THEN 'NO'
            ELSE 'YES'
        END,
        CASE
            WHEN EOMONTH(@date_i) = @date_i THEN 'YES'
            ELSE 'NO'
        END,
        CASE
            WHEN @date_i BETWEEN CONVERT(DATE, CONCAT('21.3.', YEAR(@date_i)), 104) AND CONVERT(DATE, CONCAT('20.6.', YEAR(@date_i)), 104) THEN 'Spring'
            WHEN @date_i BETWEEN CONVERT(DATE, CONCAT('21.6.', YEAR(@date_i)), 104) AND CONVERT(DATE, CONCAT('22.9.', YEAR(@date_i)), 104) THEN 'Summer'
            WHEN @date_i BETWEEN CONVERT(DATE, CONCAT('23.9.', YEAR(@date_i)), 104) AND CONVERT(DATE, CONCAT('20.12.', YEAR(@date_i)), 104) THEN 'Autumn'
            ELSE 'Winter'
        END,
        'No events',
        'NO',
        'Not holiday'
    )

    SET @date_i = DATEADD(d, 1, @date_i)
END


-- ADD HOLIDAYS
UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'New Years Day'
WHERE
    [day] = 1 AND [month] = 1

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Epiphany'
WHERE
    [day] = 6 AND [month] = 1

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Labour Day'
WHERE
    [day] = 1 AND [month] = 5

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Statehood Day'
WHERE
    ([day] = 30 AND [month] = 5 AND [year] <= 2001) OR
    ([day] = 30 AND [month] = 5 AND [year] >= 2020)

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Anti-Fascist Struggle Day'
WHERE
    [day] = 22 AND [month] = 6

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Victory and Homeland Thanksgiving Day and Day of Croatian Defenders'
WHERE
    [day] = 5 AND [month] = 8

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Assumption of Mary'
WHERE
    [day] = 15 AND [month] = 8

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'All Saint Day'
WHERE
    [day] = 1 AND [month] = 11

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Day of Remembrance of the Victims of the Homeland War and Day of Remembrance of suffering of Vukovar and Škabrnja'
WHERE
    [day] = 18 AND [month] = 11 AND [year] >= 2020

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Christmas Day'
WHERE
    [day] = 25 AND [month] = 12

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Saint Stephens Day'
WHERE
    [day] = 26 AND [month] = 12

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Easter Sunday'
WHERE
    [formattedDate] IN (
        '23.04.2000.',
        '15.04.2001.',
        '31.03.2002.',
        '20.04.2003.',
        '11.04.2004.',
        '27.03.2005.',
        '16.04.2006.',
        '08.04.2007.',
        '23.03.2008.',
        '12.04.2009.',
        '04.04.2010.',
        '24.04.2011.',
        '08.04.2012.',
        '31.03.2013.',
        '20.04.2014.',
        '05.04.2015.',
        '27.03.2016.',
        '16.04.2017.',
        '01.04.2018.',
        '21.04.2019.',
        '12.04.2020.',
        '04.04.2021.',
        '17.4.2022.'
    )

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Easter Monday'
WHERE
    [date] IN (
        SELECT DATEADD(d, 1, CONVERT(DATE, [date], 104)) 
        FROM [dbo].[dDate] 
        WHERE [holidayName] = 'Easter Sunday'
    )

UPDATE [dbo].[dDate]
SET
    [isWorkday] = 'NO',
    [isHoliday] = 'YES',
    [holidayName] = 'Corpus Christi'
WHERE
    [date] IN (
        SELECT DATEADD(d, 60, CONVERT(DATE, [date], 104)) 
        FROM [dbo].[dDate] 
        WHERE [holidayName] = 'Easter Sunday'
    )


-- ADD EVENTS
UPDATE [dbo].[dDate]
SET
    [event] = 'Iron Maiden concert in Split'
WHERE
    [date] = CONVERT(DATE, '10.8.2008', 104)

UPDATE [dbo].[dDate]
SET
    [event] = 'Inauguration of newly elected President Kolinda Grabar-Kitarović'
WHERE
    [date] = CONVERT(DATE, '15.2.2015', 104)

UPDATE [dbo].[dDate]
SET
    [event] = 'World Cup final Croatia - France'
WHERE
    [date] = CONVERT(DATE, '15.7.2018', 104)

UPDATE [dbo].[dDate]
SET
    [event] = 'The first corona patient in Croatia'
WHERE
    [date] = CONVERT(DATE, '25.2.2020', 104)

UPDATE [dbo].[dDate]
SET
    [event] = 'Dinamo beat Tottenham 3.0 and reached the quarterfinals of the European League'
WHERE
    [date] = CONVERT(DATE, '18.3.2021', 104)
