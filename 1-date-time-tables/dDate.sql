-- DATE TABLE

-- https://docs.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver15
-- https://database.guide/get-the-day-of-the-year-from-a-date-in-sql-server-t-sql/

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
    [holidayName] VARCHAR(100)
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
SET @end_date = CONVERT(DATE, '20.3.2022', 104)
SET @date_i = @start_date

SET DATEFIRST 1

WHILE @date_i <= @end_date
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
        NULL,
        'NO',
        NULL
    )

    SET @date_i = DATEADD(d, 1, @date_i)

END


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