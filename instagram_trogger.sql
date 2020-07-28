USE instagram;

ALTER TABLE instagram.statistic DROP COLUMN activity_users;
ALTER TABLE instagram.statistic  ADD activity_users INT UNSIGNED NOT NULL;
ALTER TABLE instagram.statistic DROP COLUMN raiting_users;
ALTER TABLE instagram.statistic  ADD raiting_users INT UNSIGNED NOT NULL;

 DROP TRIGGER IF EXISTS instagram.summs_statistic;
 DROP TRIGGER IF EXISTS instagram.trg_ratings_insert;

DELIMITER $$

CREATE TRIGGER summs_statistic BEFORE UPDATE ON statistic
FOR EACH ROW
BEGIN
  UPDATE statistic SET NEW.activity_users = NEW.likes_target_id+NEW.vievers_target_id+NEW.reposts_target_id;
END $$

SELECT activity_users FROM statistic limit 10;

CREATE TRIGGER trg_ratings_insert BEFORE INSERT ON statistic 
FOR EACH ROW
 BEGIN
  UPDATE statistic SET NEW.raiting_users=statistic.activity_users/statistic.id;
END $$
DELIMITER ;


SELECT raiting_users FROM statistic WHERE id=1;


