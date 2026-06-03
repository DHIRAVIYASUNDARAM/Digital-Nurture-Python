SELECT u.full_name,
       e.title,
       e.city,
       e.start_date
FROM users u
JOIN registrations r
ON u.user_id = r.user_id
JOIN events e
ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
AND u.city = e.city
ORDER BY e.start_date;

SELECT e.event_id,
       e.title,
       AVG(f.rating) AS avg_rating
FROM events e
JOIN feedback f
ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(f.feedback_id) >= 10
ORDER BY avg_rating DESC;

SELECT u.full_name, e.title, e.city, e.start_date
FROM users u
JOIN registrations r ON u.user_id = r.user_id
JOIN events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
AND u.city = e.city
ORDER BY e.start_date;

SELECT e.event_id,
       e.title,
       AVG(f.rating) AS avg_rating
FROM events e
JOIN feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(f.feedback_id) >= 10
ORDER BY avg_rating DESC;

SELECT *
FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id
    FROM registrations
    WHERE registration_date >= CURDATE() - INTERVAL 90 DAY
);

SELECT e.title,
       COUNT(s.session_id) AS session_count
FROM events e
LEFT JOIN sessions s
ON e.event_id = s.event_id
AND HOUR(s.start_time) BETWEEN 10 AND 12
GROUP BY e.event_id, e.title;

SELECT u.city,
       COUNT(DISTINCT r.user_id) AS registrations
FROM users u
JOIN registrations r
ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY registrations DESC
LIMIT 5;

SELECT e.title,
       COUNT(CASE WHEN r.resource_type='pdf' THEN 1 END) AS pdf_count,
       COUNT(CASE WHEN r.resource_type='image' THEN 1 END) AS image_count,
       COUNT(CASE WHEN r.resource_type='link' THEN 1 END) AS link_count
FROM events e
LEFT JOIN resources r
ON e.event_id = r.event_id
GROUP BY e.event_id,e.title;

SELECT u.full_name,
       e.title,
       f.comments,
       f.rating
FROM feedback f
JOIN users u ON f.user_id=u.user_id
JOIN events e ON f.event_id=e.event_id
WHERE f.rating < 3;

SELECT e.title,
       COUNT(s.session_id) AS total_sessions
FROM events e
LEFT JOIN sessions s
ON e.event_id=s.event_id
WHERE e.status='upcoming'
GROUP BY e.event_id,e.title;

SELECT u.full_name,
       e.status,
       COUNT(*) AS total_events
FROM users u
JOIN events e
ON u.user_id=e.organizer_id
GROUP BY u.full_name,e.status;

SELECT e.event_id,
       e.title
FROM events e
JOIN registrations r
ON e.event_id=r.event_id
LEFT JOIN feedback f
ON e.event_id=f.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id,e.title;

SELECT registration_date,
       COUNT(*) AS user_count
FROM users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

SELECT e.title,
       COUNT(s.session_id) AS total_sessions
FROM events e
JOIN sessions s
ON e.event_id=s.event_id
GROUP BY e.event_id,e.title
HAVING COUNT(s.session_id)=(
    SELECT MAX(cnt)
    FROM(
        SELECT COUNT(*) cnt
        FROM sessions
        GROUP BY event_id
    ) x
);

SELECT e.city,
       AVG(f.rating) AS avg_rating
FROM events e
JOIN feedback f
ON e.event_id=f.event_id
GROUP BY e.city;

SELECT e.title,
       COUNT(r.registration_id) AS registrations
FROM events e
JOIN registrations r
ON e.event_id=r.event_id
GROUP BY e.event_id,e.title
ORDER BY registrations DESC
LIMIT 3;

SELECT s1.event_id,
       s1.title AS session1,
       s2.title AS session2
FROM sessions s1
JOIN sessions s2
ON s1.event_id=s2.event_id
AND s1.session_id < s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;

SELECT u.*
FROM users u
LEFT JOIN registrations r
ON u.user_id=r.user_id
WHERE u.registration_date >= CURDATE()-INTERVAL 30 DAY
AND r.registration_id IS NULL;

SELECT speaker_name,
       COUNT(*) AS total_sessions
FROM sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

SELECT e.event_id,
       e.title
FROM events e
LEFT JOIN resources r
ON e.event_id=r.event_id
WHERE r.resource_id IS NULL;

SELECT e.title,
       COUNT(DISTINCT r.registration_id) AS registrations,
       AVG(f.rating) AS avg_rating
FROM events e
LEFT JOIN registrations r
ON e.event_id=r.event_id
LEFT JOIN feedback f
ON e.event_id=f.event_id
WHERE e.status='completed'
GROUP BY e.event_id,e.title;

SELECT u.full_name,
       COUNT(DISTINCT r.event_id) AS events_attended,
       COUNT(DISTINCT f.feedback_id) AS feedback_given
FROM users u
LEFT JOIN registrations r
ON u.user_id=r.user_id
LEFT JOIN feedback f
ON u.user_id=f.user_id
GROUP BY u.user_id,u.full_name;

SELECT u.full_name,
       COUNT(f.feedback_id) AS total_feedbacks
FROM users u
JOIN feedback f
ON u.user_id=f.user_id
GROUP BY u.user_id,u.full_name
ORDER BY total_feedbacks DESC
LIMIT 5;

SELECT user_id,
       event_id,
       COUNT(*) AS duplicates
FROM registrations
GROUP BY user_id,event_id
HAVING COUNT(*) > 1;

SELECT DATE_FORMAT(registration_date,'%Y-%m') AS month,
       COUNT(*) AS registrations
FROM registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;

SELECT e.title,
       AVG(
       TIMESTAMPDIFF(
       MINUTE,
       s.start_time,
       s.end_time)
       ) AS avg_duration_minutes
FROM events e
JOIN sessions s
ON e.event_id=s.event_id
GROUP BY e.event_id,e.title;
