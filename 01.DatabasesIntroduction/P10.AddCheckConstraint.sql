ALTER TABLE Users
ADD CONSTRAINT Users_Password_Length CHECK(LEN(Password) >= 5);