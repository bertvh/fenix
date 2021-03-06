CREATE TABLE `CONNECTION_RULE` (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,  
  `KEY_ACCOUNTABILITY_TYPE` int(11) default NULL,
  `KEY_ALLOWED_PARENT_PARTY_TYPE` int(11) default NULL,
  `KEY_ALLOWED_CHILD_PARTY_TYPE` int(11) default NULL,   
  PRIMARY KEY  (`ID_INTERNAL`),
  KEY `KEY_ACCOUNTABILITY_TYPE` (`KEY_ACCOUNTABILITY_TYPE`),
  KEY `KEY_ALLOWED_PARENT_PARTY_TYPE` (`KEY_ALLOWED_PARENT_PARTY_TYPE`),
  KEY `KEY_ALLOWED_CHILD_PARTY_TYPE` (`KEY_ALLOWED_CHILD_PARTY_TYPE`)
) ENGINE=InnoDB;

CREATE TABLE `ACCOUNTABILITY_TYPE` (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,  
  `TYPE` varchar(100) NOT NULL default '',  
  PRIMARY KEY  (`ID_INTERNAL`)  
) ENGINE=InnoDB;

CREATE TABLE `PARTY_TYPE` (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,  
  `TYPE` varchar(100) NOT NULL default '',  
  PRIMARY KEY  (`ID_INTERNAL`)
) ENGINE=InnoDB;

alter table `ACCOUNTABILITY` add column `KEY_ACCOUNTABILITY_TYPE` int(11) default NULL;
alter table `ACCOUNTABILITY` add key `KEY_ACCOUNTABILITY_TYPE` (`KEY_ACCOUNTABILITY_TYPE`);

alter table `PARTY` add column `KEY_PARTY_TYPE` int(11) default NULL;
alter table `PARTY` add key `KEY_PARTY_TYPE` (`KEY_PARTY_TYPE`);
