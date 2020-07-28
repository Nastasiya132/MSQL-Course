use instagram;

SELECT * FROM profiles LIMIT 10;

DROP TABLE IF EXISTS gender;
CREATE TEMPORARY TABLE gender (name CHAR(1));

INSERT INTO gender VALUES 
  ('m'),
  ('f');
 
UPDATE profiles SET gender = (SELECT name FROM gender ORDER BY RAND() LIMIT 1); 

DROP TABLE IF EXISTS countries;

CREATE TEMPORARY TABLE countries (name VARCHAR(150));

INSERT INTO 
	countries 
VALUES 
('Abkhazia'),('Afghanistan'),('Albania'),('Algeria'),
('Argentina'),('Armenia'),('Australia'),('Austria'),('Azerbaijan'),('Bahamas'),
('Bahrain'),('Bangladesh'),('Belarus'),('Belgium'),('Bermuda Islands'),
('Bolivia'),('Brazil'),('Bulgaria'),('Burundi'),
('Cambodia'),('Cameroon'),('Canada'),('Chile'),('China'),('Colombia'),('Congo'),
('Costa Rica'),('Cuba'),('Cyprus'),('Czech Republic'),('Denmark'),
('Dominican Republic'),('Ecuador'),('Egypt'),('El Salvador'),('Estonia'),('Ethiopia'),
('Finland'),('France'),('Georgia'),('Germany'),('Ghana'),('Gibraltar'),('United Kingdom'),
('Greece'),('Guatemala'),('Guinea'),('Haiti'),('Hawaii'),('Honduras'),('Hong Kong'),('Hungary'),
('Iceland'),('India'),('Indonesia'),('Iran'),('Iraq'),('Ireland'),('Israel'),('Italy'),('Ivory Coast'),
('Jamaica'),('Japan'),('Kazakhstan'),('Kenya'),('Kuwait'),('Kyrgyzstan'),('Latvia'),('Lebanon'),
('Liberia'),('Libya'),('Lithuania'),('Luxemburg'),('Madagascar'),('Malawi'),
('Malaysia'),('Malta'),('Mexico'),('Moldova'),('Monaco'),('Mongolia'),
('Morocco'),('Nepal'),('Holland'),('New Zeland'),('Nicaragua'),('Nigeria'),
('North Korea'),('Norway'),('Oman'),('Pakistan'),('Panama'),('Papua New Guinea'),
('Paraguay'),('Peru'),('Philippines'),('Poland'),('Portugal'),('Puerto Rico'),
('Romania'),('Russia'),('Rwanda'),('Saudi Arabia'),('Senegal'),('Sierra Leone'),
('Singapore'),('Slovakia'),('Slovenia'),('South Africa'),('South Korea'),('South Ossetia'),
('Spain'),('Sri Lanka'),('Sudan'),('Sweden'),('Switzerland'),('Syria'),
('Taiwan'),('Tajikistan'),('Thailand'),('Togo'),('Tunisia'),('Turkey'),
('Turkmenistan'),('Uganda'),('Ukraine'),('United Arab Emirates'),('USA'),('Uruguay'),
('Uzbekistan'),('Venezuela'),('Yemen'),('Zaire'),('Zambia'),('Zimbabwe')
;

SELECT * FROM countries;

UPDATE profiles 
  SET country = (SELECT name FROM countries ORDER BY RAND() LIMIT 1);  
 
select * from direct limit 10;

UPDATE direct SET 
  from_user_id = FLOOR(1 + RAND() * 100),
  to_user_id = FLOOR(1 + RAND() * 100);
 
 UPDATE direct SET 
  content_id = FLOOR(1 + RAND() * 100);
 
 select *from content limit 10;

 UPDATE content SET 
  user_id = FLOOR(1 + RAND() * 100),
  content_types_id = FLOOR(1 + RAND() * 3);
 
  select *from folowers limit 10;

 UPDATE folowers SET 
  user_id = FLOOR(1 + RAND() * 100),
  friend_id = FLOOR(1 + RAND() * 100);
  
select *from hashtags limit 10;

 UPDATE hashtags SET 
  user_id = FLOOR(1 + RAND() * 100),
  content_id = FLOOR(1 + RAND() * 100),
  content_types_id = FLOOR(1 + RAND() * 3);
 
select *from publication limit 10;

 UPDATE publication SET 
  user_id = FLOOR(1 + RAND() * 100),
  content_id = FLOOR(1 + RAND() * 100),
  publication_types_id = FLOOR(1 + RAND() * 3);
 
select *from stories limit 10; 

 UPDATE stories SET 
  user_id = FLOOR(1 + RAND() * 100),
  content_id = FLOOR(1 + RAND() * 100),
  stories_types_id = FLOOR(1 + RAND() * 2);
 
 
UPDATE content SET filename = CONCAT('192.168.54.3.2/users',
  filename,
  '.',
  (SELECT name FROM content_types ORDER BY RAND() LIMIT 1)
); 

UPDATE content SET size = FLOOR(1000 + (RAND() * 1000000)) WHERE size < 100;

UPDATE content SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(nickname, ' ') FROM users WHERE id = user_id),
  '"}');  
 
ALTER TABLE content MODIFY COLUMN metadata JSON;

SELECT * FROM likes;
 
UPDATE likes SET 
  user_id = FLOOR(1 + RAND() * 100),
  target_types_id = FLOOR(1 + RAND() * 3);
 
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 3)),
    CURRENT_TIMESTAMP 
  FROM publication;
 
SELECT * FROM vievers limit 10;
 
UPDATE vievers SET 
  user_id = FLOOR(1 + RAND() * 100),
  target_types_id = FLOOR(1 + RAND() * 3);
 
INSERT INTO vievers 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 3)),
    CURRENT_TIMESTAMP 
  FROM stories; 

 
SELECT * FROM reposts;
 
UPDATE reposts SET 
  user_id = FLOOR(1 + RAND() * 100),
  target_types_id = FLOOR(1 + RAND() * 3);
 
INSERT INTO reposts 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 3)),
    CURRENT_TIMESTAMP 
  FROM publication;
 
UPDATE statistic SET 
  likes_target_id = FLOOR(1 + RAND() * 100),
  vievers_target_id = FLOOR(1 + RAND() * 100),
  reposts_target_id = FLOOR(1 + RAND() * 100);