USE master;  
GO  

--Delete the TestData database if it exists.  
IF EXISTS(SELECT * from sys.databases WHERE name='spring_security_demo_bcrypt')  
BEGIN  
    DROP DATABASE spring_security_demo_bcrypt;  
END  

--Create a new database called TestData.  
CREATE DATABASE spring_security_demo_bcrypt; 

USE spring_security_demo_bcrypt;  
If not exists( select [name] from sys.tables where[name]='dbo.users')
	CREATE TABLE dbo.users  
	   (username varchar(100)   NOT NULL ,  
		password varchar(100) NOT NULL,  
		enabled tinyint NOT NULL,
	  CONSTRAINT users_pk PRIMARY KEY (username))
GO  


If not exists( select [name] from sys.tables where[name]='dbo.authorities')
	CREATE TABLE dbo.authorities  
	  (username varchar(100) NOT NULL,
	  authority varchar(50) NOT NULL,
	   CONSTRAINT fk_inv_product
		FOREIGN KEY (username)
		REFERENCES dbo.users (username))
GO  

INSERT INTO dbo.users
VALUES 
	('john','{bcrypt}$2a$04$jT.ylf7nHkUpgfXjivxaE.Kix9WwbQ3TlX2ASBB2eMh4GOncgUXO',1),
	('mary','{bcrypt}$2a$04$jT.ylf7nHkUpgfXjivxaE.Kix9WwbQ3TlX2ASBB2eMh4GOncgUXO',1),
	('susan','{bcrypt}$2a$04$jT.ylf7nHkUpgfXjivxaE.Kix9WwbQ3TlX2ASBB2eMh4GOncgUXO',1);
GO

INSERT INTO dbo.authorities
VALUES 
	('john','ROLE_EMPLOYEE'),
	('mary','ROLE_EMPLOYEE'),
	('mary','ROLE_MANAGER'),
	('susan','ROLE_EMPLOYEE'),
	('susan','ROLE_ADMIN');
GO

select * from dbo.users;