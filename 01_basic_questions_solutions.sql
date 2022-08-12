-- 1.
-- retrieve everything from the facilities table
SELECT * FROM cd.facilities;

-- 2.
-- print out a list of all facilities and their cost to members
SELECT name, membercost FROM cd.facilities;

-- 3.
-- produce a list of facilities that charge a fee to members
SELECT facid, name, membercost, guestcost, initialoutlay, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0;

-- 4.
-- produce a list of facilities that charge a fee to members and that fee is less than one fiftieth of the monthly maintenance cost.
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost < monthlymaintenance / 50 AND 
      membercost > 0;

-- 5.
-- Produce a list of all facilities with the word "tennis" in their name.
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- 6.
-- Retrieve the details of facilities with ID1 or ID5 without using OR
SELECT * 
FROM cd.facilities
WHERE name LIKE '%2';

-- solution 2
SELECT * 
FROM cd.facilities
WHERE facid IN (1,5);

-- 7.
-- Create a new column cost that categorises if monthly maintenance is cheap or expensive
SELECT name,
CASE 
    WHEN monthlymaintenance > 100 THEN 'expensive'
    ELSE 'cheap'
END AS cost
FROM cd.facilities;

-- 8.
-- Produce a list of members who joined after the start of September 2012
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- 9.
-- Produce an ordered list of the first ten surnames in the members table - no duplicates
SELECT DISTINCT surname 
FROM cd.members
ORDER BY surname ASC 
LIMIT 10;

--10.
-- Produce a combined list of all surnames and all facility names
SELECT surname
  FROM cd.members
UNION 
SELECT name
  FROM cd.facilities;

-- 11. 
-- Obtain the signup date for the last member to join
SELECT MAX(joindate) AS latest
FROM cd.members;

-- 12.
-- Obtain the 1st and last name of the last members who signed up
SELECT firstname, surname, joindate
FROM cd.members
ORDER BY joindate DESC LIMIT 1;

--Solution 2
SELECT firstname, surname, joindate
    FROM cd.members
    WHERE joindate = 
        (SELECT MAX(joindate)
            FROM cd.members)


