use instagram;


DROP PROCEDURE IF EXISTS likes_staistic ;

DELIMITER //

CREATE PROCEDURE likes_staistic (INOUT likes_id_statistic INT, IN statistic_likes_id INT, IN small_or_high CHAR(1))
BEGIN
CASE small_or_high
  WHEN 's' THEN
    SELECT COUNT(id) INTO likes_id_statistic FROM statistic WHERE likes_id <=statistic_likes_id;    
  WHEN 'h' THEN  
    SELECT COUNT(id) INTO likes_id_statistic FROM statistic WHERE likes_id >=statistic_likes_id;    
  ELSE 
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Last parametr need set 's' or 'h'";
END CASE;
END //

DELIMITER ;

-- Проверяем
-- Кол-во лайков меньше 25
CALL likes_staistic(@my_count,25,'s');
SELECT @my_count ' меньше 25';

-- Кол-во лайков больше 65
CALL likes_staistic(@my_count,65,'h');
SELECT @my_count ' больше 65';