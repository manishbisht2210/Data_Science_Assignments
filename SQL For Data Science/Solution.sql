#Droping tables if exists
DROP TABLE IF EXISTS `assignment`.`bajaj1`;
DROP TABLE IF EXISTS `assignment`.`eicher1`;
DROP TABLE IF EXISTS `assignment`.`hero1`;
DROP TABLE IF EXISTS `assignment`.`infosys1`;
DROP TABLE IF EXISTS `assignment`.`tcs1`;
DROP TABLE IF EXISTS `assignment`.`tvs1`;

#Creating tables
CREATE TABLE `assignment`.`bajaj1` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `20 Day MA` FLOAT(7,2),
  `50 Day MA` FLOAT(7,2),
  PRIMARY KEY (`Date`));

CREATE TABLE `assignment`.`eicher1` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `20 Day MA` FLOAT(7,2),
  `50 Day MA` FLOAT(7,2),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`hero1` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `20 Day MA` FLOAT(7,2),
  `50 Day MA` FLOAT(7,2),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`infosys1` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `20 Day MA` FLOAT(7,2),
  `50 Day MA` FLOAT(7,2),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`tcs1` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `20 Day MA` FLOAT(7,2),
  `50 Day MA` FLOAT(7,2),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`tvs1` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `20 Day MA` FLOAT(7,2),
  `50 Day MA` FLOAT(7,2),
  PRIMARY KEY (`Date`));
  
 #Inserting data
 INSERT INTO `assignment`.`bajaj1` (
 `Date`,`Close Price`,`20 Day MA`,`50 Day MA`)
 SELECT `Date`,`Close Price`, 
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 19 THEN (avg(`Close Price`) over (order by `Date` rows between 19 preceding and current row)) ELSE null END),2),
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 49 THEN (avg(`Close Price`) over (order by `Date` rows between 49 preceding and current row)) ELSE null END),2) 
 FROM `assignment`.`bajaj auto`;
 
 INSERT INTO `assignment`.`eicher1` (
 `Date`,`Close Price`,`20 Day MA`,`50 Day MA`)
 SELECT `Date`,`Close Price`, 
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 19 THEN (avg(`Close Price`) over (order by `Date` rows between 19 preceding and current row)) ELSE null END),2),
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 49 THEN (avg(`Close Price`) over (order by `Date` rows between 49 preceding and current row)) ELSE null END),2) 
 FROM `assignment`.`eicher motors`;
 
 INSERT INTO `assignment`.`hero1` (
 `Date`,`Close Price`,`20 Day MA`,`50 Day MA`)
 SELECT `Date`,`Close Price`, 
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 19 THEN (avg(`Close Price`) over (order by `Date` rows between 19 preceding and current row)) ELSE null END),2),
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 49 THEN (avg(`Close Price`) over (order by `Date` rows between 49 preceding and current row)) ELSE null END),2) 
 FROM `assignment`.`hero motocorp`;
 
 INSERT INTO `assignment`.`infosys1` (
 `Date`,`Close Price`,`20 Day MA`,`50 Day MA`)
 SELECT `Date`,`Close Price`, 
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 19 THEN (avg(`Close Price`) over (order by `Date` rows between 19 preceding and current row)) ELSE null END),2),
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 49 THEN (avg(`Close Price`) over (order by `Date` rows between 49 preceding and current row)) ELSE null END),2) 
 FROM `assignment`.`infosys`;
 
 INSERT INTO `assignment`.`tcs1` (
 `Date`,`Close Price`,`20 Day MA`,`50 Day MA`)
 SELECT `Date`,`Close Price`, 
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 19 THEN (avg(`Close Price`) over (order by `Date` rows between 19 preceding and current row)) ELSE null END),2),
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 49 THEN (avg(`Close Price`) over (order by `Date` rows between 49 preceding and current row)) ELSE null END),2) 
 FROM `assignment`.`tcs`;
 
 INSERT INTO `assignment`.`tvs1` (
 `Date`,`Close Price`,`20 Day MA`,`50 Day MA`)
 SELECT `Date`,`Close Price`, 
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 19 THEN (avg(`Close Price`) over (order by `Date` rows between 19 preceding and current row)) ELSE null END),2),
 ROUND((CASE WHEN (row_number() over (order by `Date`)) > 49 THEN (avg(`Close Price`) over (order by `Date` rows between 49 preceding and current row)) ELSE null END),2) 
 FROM `assignment`.`tvs motors`;
  
#Droping table if exists
DROP TABLE IF EXISTS `assignment`.`master`;

#Creating tables
CREATE TABLE `assignment`.`master` (
  `Date` DATE NOT NULL,
  `Bajaj` FLOAT(7,2) NOT NULL,
  `TCS` FLOAT(7,2) NOT NULL,
  `TVS` FLOAT(7,2) NOT NULL,
  `Infosys` FLOAT(7,2) NOT NULL,
  `Eicher` FLOAT(7,2) NOT NULL,
  `Hero` FLOAT(7,2) NOT NULL,
  PRIMARY KEY (`Date`));
  
#Inserting Data
INSERT INTO `assignment`.`master` (
  `Date`, `Bajaj`,`TCS`,`TVS`,`Infosys`,`Eicher`,`Hero`)
  SELECT `ba`.`Date`,`ba`.`Close Price`,`tc`.`Close Price`,`tv`.`Close Price`,`if`.`Close Price`,`em`.`Close Price`,`hm`.`Close Price` 
  FROM `assignment`.`bajaj auto` `ba`,`assignment`.`eicher motors` `em`,`assignment`.`Infosys` `if`,
  `assignment`.`hero motocorp` `hm`,`assignment`.`tcs` `tc`,`assignment`.`tvs motors` `tv` WHERE
  `ba`.`Date` = `em`.`Date` and `ba`.`Date` = `if`.`Date` and `ba`.`Date` = `hm`.`Date` and
  `ba`.`Date` = `tc`.`Date` and `ba`.`Date` = `tv`.`Date`;
  
  
#Droping Table if exist
DROP TABLE IF EXISTS `assignment`.`bajaj2`;
DROP TABLE IF EXISTS `assignment`.`eicher2`;
DROP TABLE IF EXISTS `assignment`.`hero2`;
DROP TABLE IF EXISTS `assignment`.`infosys2`;
DROP TABLE IF EXISTS `assignment`.`tcs2`;
DROP TABLE IF EXISTS `assignment`.`tvs2`;

#Creating tables
CREATE TABLE `assignment`.`bajaj2` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `Signal` VARCHAR(4),
  PRIMARY KEY (`Date`));

CREATE TABLE `assignment`.`eicher2` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `Signal` VARCHAR(4),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`hero2` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `Signal` VARCHAR(4),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`infosys2` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `Signal` VARCHAR(4),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`tcs2` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `Signal` VARCHAR(4),
  PRIMARY KEY (`Date`));
  
 CREATE TABLE `assignment`.`tvs2` (
  `Date` DATE NOT NULL,
  `Close Price` FLOAT(7,2) NOT NULL,
  `Signal` VARCHAR(4),
  PRIMARY KEY (`Date`));
  
#Inserting data
 INSERT INTO `assignment`.`bajaj2` (
 `Date`,`Close Price`,`Signal`)
 SELECT `Date`,`Close Price`, 
 (CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY' WHEN `20 Day MA` < `50 Day MA` THEN 'SELL' ELSE 'HOLD' END) 
 FROM `assignment`.`bajaj1` WHERE `50 DAY MA` IS NOT NULL;
 
 INSERT INTO `assignment`.`eicher2` (
 `Date`,`Close Price`,`Signal`)
 SELECT `Date`,`Close Price`, 
 (CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY' WHEN `20 Day MA` < `50 Day MA` THEN 'SELL' ELSE 'HOLD' END) 
 FROM `assignment`.`eicher1` WHERE `50 DAY MA` IS NOT NULL;
 
 INSERT INTO `assignment`.`hero2` (
 `Date`,`Close Price`,`Signal`)
 SELECT `Date`,`Close Price`, 
 (CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY' WHEN `20 Day MA` < `50 Day MA` THEN 'SELL' ELSE 'HOLD' END) 
 FROM `assignment`.`hero1` WHERE `50 DAY MA` IS NOT NULL;
 
 INSERT INTO `assignment`.`infosys2` (
 `Date`,`Close Price`,`Signal`)
 SELECT `Date`,`Close Price`, 
 (CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY' WHEN `20 Day MA` < `50 Day MA` THEN 'SELL' ELSE 'HOLD' END) 
 FROM `assignment`.`infosys1` WHERE `50 DAY MA` IS NOT NULL;
 
 INSERT INTO `assignment`.`tcs2` (
 `Date`,`Close Price`,`Signal`)
 SELECT `Date`,`Close Price`, 
 (CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY' WHEN `20 Day MA` < `50 Day MA` THEN 'SELL' ELSE 'HOLD' END) 
 FROM `assignment`.`tcs1` WHERE `50 DAY MA` IS NOT NULL;
 
 INSERT INTO `assignment`.`tvs2` (
 `Date`,`Close Price`,`Signal`)
 SELECT `Date`,`Close Price`, 
 (CASE WHEN `20 Day MA` > `50 Day MA` THEN 'BUY' WHEN `20 Day MA` < `50 Day MA` THEN 'SELL' ELSE 'HOLD' END) 
 FROM `assignment`.`tvs1` WHERE `50 DAY MA` IS NOT NULL;
 
  
#Creating functions
delimiter $$

CREATE FUNCTION signal_for_bajaj( stock_date DATE)

RETURNS VARCHAR(4)

DETERMINISTIC

BEGIN

DECLARE stock_signal VARCHAR(4);

DECLARE short_ma FLOAT(7,2);

DECLARE long_ma FLOAT(7,2);

SELECT `20 Day MA`, `50 Day MA` INTO short_ma, long_ma FROM `assignment`.`bajaj1` WHERE `DATE` = stock_date;

IF (short_ma > long_ma) THEN

SET stock_signal = 'BUY';

ELSEIF (short_ma < long_ma) THEN

SET stock_signal = 'SELL';

ELSE

SET stock_signal = 'HOLD';

END IF;

return stock_signal;

end

$$

delimiter ;
  