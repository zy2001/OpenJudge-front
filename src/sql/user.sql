CREATE DATABASE openjudge;
USE openjudge;
CREATE TABLE USER(
  id int primary key,
  username varchar(20) unique,
  password varchar(20),
  token varchar(20),
  gmt_create date,
  gmt_modified date
);