-- CREATE TIME OF DAY DIM TABLE
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15

USE [Northwind_SkenderSPTEST5] -- TODO RENAME
GO

-- TIME OF DAY TABLE
CREATE TABLE [dbo].[dTimeOfDay] (
	[idTimeOfDay] INT IDENTITY NOT NULL PRIMARY KEY,
	[type] VARCHAR(20),
	[secondsMidnight] INT,
	[minutesMidnight] INT,
	[formattedTime] VARCHAR(8),
	[second] INT,
	[minute] INT,
	[hour] INT,
	[period] VARCHAR(20)
)


INSERT INTO [dbo].[dTimeOfDay] (
	[type]
)
VALUES (
	'unknown'
)

INSERT INTO [dbo].[dTimeOfDay] (
	[type]
)
VALUES (
	'has not happened'
)


DECLARE @time_i TIME
SET @time_i = CONVERT(TIME, '00:00:00', 108)  

DECLARE @secondsMidnight_i INT
SET @secondsMidnight_i = 0

DECLARE @minutesMidnight_i INT
SET @minutesMidnight_i = 0

DECLARE @second_i INT
SET @second_i = @secondsMidnight_i % 60

DECLARE @minute_i INT
SET @minute_i = @minutesMidnight_i % 60

DECLARE @hour_i INT
SET @hour_i = @minutesMidnight_i / 60


WHILE @secondsMidnight_i < 24 * 60 * 60
BEGIN
	INSERT INTO [dbo].[dTimeOfDay] (
		[type],
		[secondsMidnight],
		[minutesMidnight],
		[formattedTime],
		[second],
		[minute],
		[hour],
		[period]
	)
	VALUES (
		'normal',
		@secondsMidnight_i,
		@minutesMidnight_i,
		@time_i,
		@second_i,
		@minute_i,
		@hour_i,
		CASE
			WHEN @hour_i BETWEEN 0 AND 5 THEN 'night'
			WHEN @hour_i BETWEEN 6 AND 11 THEN 'morning'
			WHEN @hour_i BETWEEN 12 AND 17 THEN 'afternoon'
			WHEN @hour_i BETWEEN 18 AND 21 THEN 'evening'
			ELSE 'night'
		END
	)

	SET @time_i = DATEADD(s, 1, @time_i)
	SET @secondsMidnight_i = @secondsMidnight_i + 1
	SET @minutesMidnight_i = @secondsMidnight_i / 60
	SET @second_i = @secondsMidnight_i % 60
	SET @minute_i = @minutesMidnight_i % 60
	SET @hour_i = @minutesMidnight_i / 60
END
