-- 1. 
-- Produce a list of the start times for bookings by members named 'David Farrell'

SELECT starttime FROM cd.bookings
INNER JOIN cd.members
ON members.memid = bookings.memid
WHERE members.firstname = 'David' AND
      members.surname = 'Farrell';

-- 2.
-- Produce a list of start times for bookings for tennis courts for the date "2012-09-21". Return a list of start time and facility name pairings ordered by time
SELECT starttime, name 
FROM cd.bookings
INNER JOIN cd.facilities
ON bookings.facid = facilities.facid
WHERE facilities.name LIKE 'Tennis%' AND 
      starttime::date = '2012-09-21'
ORDER BY starttime;

-- Solution 2
SELECT bookings.starttime AS start, facilities.name AS name 
FROM cd.bookings
INNER JOIN cd.facilities
ON bookings.facid = facilities.facid
WHERE facilities.name IN ('Tennis Court 2', 'Tennis Court 1') AND 
      bookings.starttime >= '2012-09-21' AND 
      bookings.starttime < '2012-09-22'
ORDER BY bookings.starttime;

-- 3.
-- Produce a list of all members who have recommended another member. Ensure there are no duplicates in the list and that the results are ordered by (surname, firstname)
SELECT DISTINCT recs.firstname AS firstname,
                recs.surname AS surname
      FROM 
            cd.members mems
            INNER JOIN cd.members recs
                  ON recs.memid = mems.recommendedby
ORDER BY surname, firstname;

-- 4.
-- Output a list of all members including the individual who recommended them. Order results by (surname, firstname)
SELECT
      mem.firstname AS memfname,
      mem.surname AS memsname,
      rec.firstname AS recfname,
      rec.surname AS recsname
FROM 
      cd.members mem
      LEFT JOIN cd.members rec
            ON rec.memid = mem.recommendedby
ORDER BY mem.surname, mem.firstname;

-- 5.
-- Produce a list of all members who have used a tennis court which includes the name of the court and the 1st and surname of the member as a single column. No duplicate data and order by member name followed by facility name
SELECT DISTINCT 
      CONCAT(mem.firstname, ' ', mem.surname) AS mem_name,
      fac.name
FROM cd.members mem
      INNER JOIN cd.bookings bk
      ON mem.memid = bk.memid
      INNER JOIN cd.facilities fac
      ON fac.facid = bk.facid
WHERE fac.name LIKE 'Tennis%'
ORDER BY mem_name, fac.name;

-- solution 2
SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, facs.name AS facility
FROM 
      cd.members mems
      INNER JOIN cd.bookings bks
            ON mems.memid = bks.memid
      INNER JOIN cd.facilities facs
            ON bks.facid = facs.facid
WHERE
      facs.name IN ('Tennis Court 2', 'Tennis Court 1')
ORDER BY member, facility;
-- 6.
-- Produce a list of bookings on the day '2012-09-14' which will cost a member or guest more than $30. Guest ID is always "0". Include the name of the facility, the name of the member formatted as a single column and the cost. Order in the sending cost and do not use subqueries.



SELECT * FROM members

