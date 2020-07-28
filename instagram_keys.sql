use instagram;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

ALTER TABLE direct
  ADD CONSTRAINT direct_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT direct_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id),
     ADD CONSTRAINT content_direct_id_fk
  FOREIGN KEY (content_id) REFERENCES content(id)
    ON DELETE SET NULL;   
   
ALTER TABLE content
  ADD CONSTRAINT content_types_id_fk
  FOREIGN KEY (content_types_id) REFERENCES content_types(id)
    ON DELETE SET NULL;

ALTER TABLE profiles 
  ADD CONSTRAINT acount_types_id_fk
  FOREIGN KEY (acount_types_id) REFERENCES acount_types(id)
    ON DELETE SET NULL;
   
ALTER TABLE publication  
  ADD CONSTRAINT publication_users_content_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  ADD CONSTRAINT publication_content_id_fk
  FOREIGN KEY (content_id) REFERENCES content(id)
    ON DELETE SET NULL,
  ADD CONSTRAINT publication_types_id_fk
  FOREIGN KEY (publication_types_id) REFERENCES publication_types(id)
    ON DELETE SET NULL; 
    
ALTER TABLE folowers
  ADD CONSTRAINT folowers_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  ADD CONSTRAINT folowers_friend_id_fk
  FOREIGN KEY (friend_id) REFERENCES users(id)
    ON DELETE CASCADE;
   
   
ALTER TABLE stories 
  ADD CONSTRAINT stories_users_content_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,   
  ADD CONSTRAINT stories_types_id_fk
  FOREIGN KEY (stories_types_id) REFERENCES stories_types(id)
    ON DELETE SET NULL, 
  ADD CONSTRAINT stories_content_id_fk
  FOREIGN KEY (content_id) REFERENCES content(id)
    ON DELETE SET NULL;


ALTER TABLE likes 
  ADD CONSTRAINT likes_users_content_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,   
  ADD CONSTRAINT target_types_id_fk
  FOREIGN KEY (target_types_id) REFERENCES target_types(id)
    ON DELETE SET NULL;
     

ALTER TABLE vievers 
  ADD CONSTRAINT vievers_users_content_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,   
  ADD CONSTRAINT vievers_target_types_id_fk
  FOREIGN KEY (target_types_id) REFERENCES target_types(id)
    ON DELETE SET NULL;   


ALTER TABLE reposts 
  ADD CONSTRAINT reposts_users_content_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,   
  ADD CONSTRAINT reposts_target_types_id_fk
  FOREIGN KEY (target_types_id) REFERENCES target_types(id)
    ON DELETE SET NULL;  
   
   
ALTER TABLE hashtags 
  ADD CONSTRAINT hashtags_users_content_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,   
  ADD CONSTRAINT hashtags_content_id_fk
  FOREIGN KEY (content_id) REFERENCES content(id)
    ON DELETE SET NULL,
    ADD CONSTRAINT hashtags_content_types_id_fk
  FOREIGN KEY (content_types_id) REFERENCES content_types(id)
    ON DELETE SET NULL;   

ALTER TABLE statistic 
  ADD CONSTRAINT statistic_acount_types_id_fk
  FOREIGN KEY (acount_types_id) REFERENCES acount_types (id)
    ON DELETE CASCADE,   
  ADD CONSTRAINT statistic_likes_id_fk
  FOREIGN KEY (likes_target_id) REFERENCES likes(id)
    ON DELETE SET NULL,
    ADD CONSTRAINT statistic_vievers_id_fk
  FOREIGN KEY (vievers_target_id) REFERENCES vievers(id)
    ON DELETE SET NULL,
  ADD CONSTRAINT statistic_reposts_id_fk
  FOREIGN KEY (reposts_target_id) REFERENCES reposts(id)
    ON DELETE SET NULL;  

   