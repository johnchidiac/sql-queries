-- FS1. Find the name and rating of the top rated apps in each category, among apps that have been installed at least 50,000 times.
SELECT analytics.app_name, analytics.rating, analytics.category
FROM analytics
JOIN (
    SELECT category, MAX(rating) as max_rating
    FROM analytics
    GROUP BY category
) as max_ratings
ON analytics.category = max_ratings.category AND analytics.rating = max_ratings.max_rating
WHERE analytics.min_installs >= 50000;


-- FS2. Find all the apps that have a name similar to “facebook”.
SELECT app_name FROM analytics WHERE app_name ILIKE '%face%' OR app_name ILIKE '%book%';

-- FS3. Find all the apps that have more than 1 genre.
SELECT app_name, genres FROM analytics WHERE array_length(genres, 1) > 1;

-- FS4. Find all the apps that have education as one of their genres.
SELECT app_name, genres FROM analytics WHERE 'Education' = ANY(genres)