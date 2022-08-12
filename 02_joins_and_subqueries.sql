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

