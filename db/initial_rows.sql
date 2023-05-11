\connect db
INSERT INTO roles (id,name,access) VALUES (1,'admin','1111111111');
INSERT INTO roles (id,name,access) VALUES (2,'user','0000000000');
INSERT INTO users (name,pass,roles_id) VALUES ('admin','admin',1);