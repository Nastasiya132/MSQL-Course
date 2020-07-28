USE instagram;

SELECT users.id, GROUP_CONCAT(statistic.likes_id) as likes,users.nickname FROM likes
	JOIN users ON (users.id = likes.user_id)
	JOIN statistic ON (statistic.id = likes.user_id)
GROUP BY users.id 
ORDER BY users.nickname DESC;

SELECT publication.user_id, content.filename, (SUM(publication_types_id)/COUNT(publication.user_id)) as fullreting FROM publication
	JOIN content ON (content.id = publication.user_id)
WHERE content.updated_at LIKE '20%'	
GROUP BY user_id
ORDER BY (SUM(publication_types_id)/COUNT(publication.user_id)) DESC;

SELECT users.id, GROUP_CONCAT(statistic.reposts_id ) as reposts ,users.nickname FROM reposts
	JOIN users ON (users.id = reposts.user_id)
	JOIN statistic ON (statistic.id = reposts .user_id)
GROUP BY users.id 
ORDER BY users.nickname DESC;

SELECT users.id, CONCAT(nickname) AS name, (COUNT(likes.id) + COUNT(vievers.id) + COUNT(reposts.id)) AS activity FROM users
	LEFT JOIN likes  
	 	ON users.id = likes.user_id
	LEFT JOIN vievers 
		ON users.id = vievers.user_id 
	LEFT JOIN reposts 
		ON users.id = reposts.user_id
	GROUP BY users.id 
	ORDER BY activity
	LIMIT 10;


