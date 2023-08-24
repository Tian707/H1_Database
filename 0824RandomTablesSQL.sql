USE master;
DROP DATABASE Performance;

CREATE DATABASE Performance;
GO
USE Performance;

-- create tables without and with Primary Key

--CREATE TABLE Randoms(
	--ID INT,
	--RandomNumber INT
--);
--CREATE TABLE Randoms(
	--ID INT IDENTITY(1, 1) PRIMARY KEY,
	--RandomNumber INT
--);

-- 1. Søg efter et bestemt tilfældigt tal, fx 4711
Select * from Randoms
	WHERE RandomNumber = 4711
-- % PK: CPU: 797, Reads 3281, Duration: 829
-- √ PK: CPU: 31, Reads 2369, Duration: 160

--2. Lav en oversigt over alle de tilfældige tal og hvor mange gange 
--   de hver især forekommer, sorteret efter de tilfældige tal 
Select RandomNumber, COUNT(*) AS Frequency
FROM Randoms
GROUP BY RandomNumber
ORDER BY Frequency DESC
-- % PK: CPU: 265, Reads 2123, Duration: 326
-- √ PK: CPU: 297, Reads 1882, Duration: 355

-- 3. Find hvor mange gange det eller de sjældneste tilfældige tal forekommer
Select TOP 1 RandomNumber, COUNT(*) AS Frequency
FROM Randoms
GROUP BY RandomNumber
ORDER BY Frequency ASC;
-- % PK: CPU: 297, Reads 2127, Duration: 335
-- √ PK: CPU: 234, Reads 1882, Duration: 247

-- 4. Find hvor mange gange det eller de hyppigste tilfældige tal forekommer
Select TOP 1 RandomNumber, COUNT(*) AS Frequency
FROM Randoms
GROUP BY RandomNumber
ORDER BY Frequency DESC;
-- % PK: CPU: 282, Reads 2123, Duration: 285
-- √ PK: CPU: 265, Reads 1884, Duration: 266