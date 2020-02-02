CREATE DATABASE openjudge;
USE openjudge;
CREATE TABLE USER(
  ID INT PRIMARY KEY,
  USERNAME VARCHAR(20) UNIQUE,
  PASSWORD VARCHAR(20),
  TOKEN VARCHAR(42),
  GMT_CREATE DATE,
  GMT_MODIFIED DATE
);

INSERT INTO USER(ID, USERNAME, PASSWORD) VALUES(1, 'zy2000', '123456');