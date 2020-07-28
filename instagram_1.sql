DROP DATABASE IF EXISTS instagram;
create database instagram;
use instagram;


-- Таблица пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "ID пользователя", 
  nickname VARCHAR(25) NOT NULL UNIQUE COMMENT "Никнейм",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки" 
) COMMENT "Пользователи"; 


 -- Таблица профилей  
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  avatar VARCHAR(255) NOT NULL COMMENT "Аватар пользователя, прописан путь",
  name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  birthday DATE COMMENT "Дата рождения",
  gender VARCHAR(10) NOT NULL COMMENT "Пол",
  country VARCHAR(100) COMMENT "Страна",
  description VARCHAR (225) NOT NULL COMMENT "Описание",
  acount_types_id INT UNSIGNED COMMENT "Тип аккаунта",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

 -- Таблица типов аккаунтов (Обычный/бизнес)
 
DROP TABLE IF EXISTS acount_types;
CREATE TABLE acount_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(10) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы аккаутнов";

-- Таблица контента

DROP TABLE IF EXISTS content;
CREATE TABLE content (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
  size INT NOT NULL COMMENT "Размер файла",
  metadata JSON COMMENT "Метаданные файла",
  content_types_id INT UNSIGNED COMMENT "Тип файла",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Контент";

-- Типы контента

DROP TABLE IF EXISTS content_types;
CREATE TABLE content_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Тип контента",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы файлов";


-- Публикации

DROP TABLE IF EXISTS publication;
CREATE TABLE publication (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  geolacation VARCHAR (100) COMMENT "Геолокация поста", 
  content_id INT UNSIGNED,
  publication_types_id INT UNSIGNED COMMENT "Тип публикации",
  body TEXT NOT NULL,
  is_public BOOLEAN DEFAULT TRUE,
  views_counter INT UNSIGNED DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS publication_types;
CREATE TABLE publication_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Тип публикации",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы публикаций";

-- Таблица историй

DROP TABLE IF EXISTS stories;
CREATE TABLE stories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  geolacation VARCHAR (100) COMMENT "Геолокация поста", 
  content_id INT UNSIGNED,
  stories_types_id INT UNSIGNED COMMENT "Тип истории",
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  views_counter INT UNSIGNED DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица типов историй

DROP TABLE IF EXISTS stories_types;
CREATE TABLE stories_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Тип истории",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы историй";

-- Таблица сообщений

DROP TABLE IF EXISTS direct;
CREATE TABLE direct (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  from_user_id INT UNSIGNED COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  content_id INT UNSIGNED,
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Сообщения/Директ";

-- Таблица фоловеров
 
DROP TABLE IF EXISTS folowers;
CREATE TABLE folowers (
  user_id INT UNSIGNED COMMENT "Ссылка на того кто подписался",
  friend_id INT UNSIGNED COMMENT "Ссылка на того на котого произошла подписка",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",  
  PRIMARY KEY (user_id, friend_id) COMMENT "Составной первичный ключ"
) COMMENT "Таблица подписчиков";

-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED,
  likes_target_id INT UNSIGNED,
  target_types_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- Таблица хэштегов
DROP TABLE IF EXISTS hashtags;
CREATE TABLE hashtags (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100),
	user_id INT UNSIGNED COMMENT "Id пользователя, разместившего хэштег",
	content_id INT UNSIGNED COMMENT "Id контента, к которому указан хэштег",
	content_types_id INT UNSIGNED COMMENT "Тип контента",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

-- Тпблица просмотров
DROP TABLE IF EXISTS vievers;
CREATE TABLE vievers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED,
  vievers_target_id INT UNSIGNED,
  target_types_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица репостов
DROP TABLE IF EXISTS reposts;
CREATE TABLE reposts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED,
  reposts_target_id INT UNSIGNED,
  target_types_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица типов реакций
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- Таблица статистики
DROP TABLE IF EXISTS statistic;
CREATE TABLE statistic (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	acount_types_id INT UNSIGNED COMMENT "Тип аккаунта",
	likes_target_id INT UNSIGNED COMMENT "дайки",
	vievers_target_id INT UNSIGNED COMMENT "просмотры",
	reposts_target_id INT UNSIGNED COMMENT "репосты",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);
