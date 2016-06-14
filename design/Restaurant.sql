SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS RESTAURANT.OPERATION;
DROP TABLE IF EXISTS RESTAURANT.REWARD_AND_PUNISHMENT;
DROP TABLE IF EXISTS RESTAURANT.EMPLOYEE_ACTION;
DROP TABLE IF EXISTS RESTAURANT.BUSINESS;
DROP TABLE IF EXISTS RESTAURANT.EMPLOYEE;
DROP TABLE IF EXISTS RESTAURANT.OFFICE;
DROP TABLE IF EXISTS RESTAURANT.WAGES_CONFIG;
DROP TABLE IF EXISTS RESTAURANT.WAGES_PROJECT;




/* Create Tables */

CREATE TABLE RESTAURANT.BUSINESS
(
	ID varchar(32) NOT NULL,
	TYPE varchar(12) NOT NULL,
	START_TIME datetime NOT NULL,
	STATUS varchar(12) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.EMPLOYEE
(
	ID varchar(32) NOT NULL,
	NAME varchar(100) NOT NULL,
	JOBS varchar(32) NOT NULL,
	LEVEL varchar(32) NOT NULL,
	PHONE varchar(32),
	STATUS varchar(12) NOT NULL,
	OFFICE varchar(32) NOT NULL,
	MONEY_BEGIN_DAY datetime NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.EMPLOYEE_ACTION
(
	ID varchar(32) NOT NULL,
	EMPLOYEE_ID varchar(32) NOT NULL,
	VALID_TIME datetime NOT NULL,
	BUSINESS varchar(32) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.OFFICE
(
	ID varchar(32) NOT NULL,
	NAME varchar(100) NOT NULL,
	ADDRESS varchar(200),
	STATUS varchar(12) NOT NULL,
	WAGES_PROJECT varchar(32),
	BOTIME datetime NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.OPERATION
(
	ID varchar(32) NOT NULL,
	USER_ID varchar(32) NOT NULL,
	USER_NAME varchar(100) NOT NULL,
	TYPE varchar(12) NOT NULL,
	NAME varchar(100) NOT NULL,
	OPERATION_TIME datetime NOT NULL,
	BUSINESS varchar(32) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.REWARD_AND_PUNISHMENT
(
	ID varchar(32) NOT NULL,
	ACTION varchar(32) NOT NULL,
	MONEY decimal(19,4) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.WAGES_CONFIG
(
	ID varchar(32) NOT NULL,
	JOBS varchar(32),
	LEVEL varchar(32),
	PRI int NOT NULL,
	WAGES_PROJECT varchar(32) NOT NULL,
	NAME varchar(20) NOT NULL,
	CONDITION_EL varchar(128),
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE RESTAURANT.WAGES_PROJECT
(
	ID varchar(32) NOT NULL,
	NAME varchar(128) NOT NULL,
	BOTIME datetime NOT NULL,
	PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



/* Create Foreign Keys */

ALTER TABLE RESTAURANT.OPERATION
	ADD FOREIGN KEY (BUSINESS)
	REFERENCES RESTAURANT.BUSINESS (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESTAURANT.EMPLOYEE_ACTION
	ADD FOREIGN KEY (BUSINESS)
	REFERENCES RESTAURANT.BUSINESS (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESTAURANT.EMPLOYEE_ACTION
	ADD FOREIGN KEY (EMPLOYEE_ID)
	REFERENCES RESTAURANT.EMPLOYEE (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESTAURANT.REWARD_AND_PUNISHMENT
	ADD FOREIGN KEY (ACTION)
	REFERENCES RESTAURANT.EMPLOYEE_ACTION (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESTAURANT.EMPLOYEE
	ADD FOREIGN KEY (OFFICE)
	REFERENCES RESTAURANT.OFFICE (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESTAURANT.OFFICE
	ADD FOREIGN KEY (WAGES_PROJECT)
	REFERENCES RESTAURANT.WAGES_PROJECT (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESTAURANT.WAGES_CONFIG
	ADD FOREIGN KEY (WAGES_PROJECT)
	REFERENCES RESTAURANT.WAGES_PROJECT (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


