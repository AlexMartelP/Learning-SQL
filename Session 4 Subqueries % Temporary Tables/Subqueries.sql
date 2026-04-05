--Interesting, it's like creating a temporary table to do the heavy lifting; super useful.

--If you get stuck look again at the video above. We want to find the average number of events 
--for each day for each channel. The first table will provide us the number of events for each day and channel,
-- and then we will need to average these values together using a second query.
SELECT channel, AVG(qty)
FROM (SELECT DATE_TRUNC('day',occurred_at), channel, COUNT(*) qty
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC) AS channel_count
GROUP BY 1
ORDER BY 2 DESC;
