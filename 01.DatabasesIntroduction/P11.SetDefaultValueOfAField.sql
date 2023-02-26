ALTER TABLE Users
ADD CONSTRAINT Default_LastLoginTime
DEFAULT GetDate() FOR LastLoginTime;