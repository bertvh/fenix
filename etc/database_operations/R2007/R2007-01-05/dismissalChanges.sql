ALTER TABLE CURRICULUM_MODULE ADD KEY_CREDITS int(11) default NULL;
ALTER TABLE CURRICULUM_MODULE ADD KEY KEY_CREDITS (KEY_CREDITS);

CREATE TABLE `CREDITS_DISMISSAL` (
  `ID_INTERNAL` int(11) unsigned NOT NULL auto_increment,
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL default '1',  
  `KEY_STUDENT_CURRICULAR_PLAN` int(11) NOT NULL,
  `GIVEN_CREDITS` double DEFAULT NULL,
  `GIVEN_GRADE` varchar(10) DEFAULT NULL,
  `OJB_CONCRETE_CLASS` varchar(255) NOT NULL default '',  
  PRIMARY KEY  (`ID_INTERNAL`),
  KEY `KEY_ROOT_DOMAIN_OBJECT` (`KEY_ROOT_DOMAIN_OBJECT`),
  KEY `KEY_STUDENT_CURRICULAR_PLAN` (`KEY_STUDENT_CURRICULAR_PLAN`)
) ENGINE=InnoDB;

CREATE TABLE `ENROLMENT_CREDITS` (
  `ID_INTERNAL` int(11) unsigned NOT NULL auto_increment,
  `KEY_ENROLMENT` int(11) NOT NULL,
  `KEY_CREDITS` int(11) NOT NULL,  
  PRIMARY KEY  (`ID_INTERNAL`),
  KEY `KEY_ENROLMENT` (`KEY_ENROLMENT`),
  KEY `KEY_CREDITS` (`KEY_CREDITS`)
) ENGINE=InnoDB;

