--------------------- ALTER ----------------
-- Add a New Column
ALTER TABLE Flights
ADD Airline nvarchar(50) NOT NULL DEFAULT 'Unknown';

-- Modify a Column Type
ALTER TABLE Flights
ALTER COLUMN Price decimal(10,2) NOT NULL;

-- Rename a Column
EXEC sp_rename 'Flights.DepartureCity', 'FromCity', 'COLUMN';

-- Drop a Column
ALTER TABLE Flights
DROP COLUMN Airline;

-- Add a New Constraint (Check)
ALTER TABLE Flights
ADD CONSTRAINT CHK_FlightPrice CHECK (Price >= 50);

-- Drop an Existing Constraint
ALTER TABLE Flights
DROP CONSTRAINT CHK_FlightPrice;
