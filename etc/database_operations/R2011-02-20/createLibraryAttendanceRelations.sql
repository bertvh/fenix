alter table `LIBRARY_CARD` add `CARD_NUMBER` text;
create table `SPACES_HAVE_ATTENDANCE_HISTORY` (`OID_SPACE` bigint unsigned, `OID_SPACE_ATTENDANCES` bigint unsigned, primary key (OID_SPACE, OID_SPACE_ATTENDANCES), index (OID_SPACE), index (OID_SPACE_ATTENDANCES)) type=InnoDB, character set latin1;
create table `SPACE_ATTENDANCES` (`OID` bigint unsigned, `RESPONSIBLE_FOR_EXIT_IST_USERNAME` text, `EXIT_TIME` timestamp NULL default NULL, `ENTRANCE_TIME` timestamp NULL default NULL, `PERSON_IST_USERNAME` text, `RESPONSIBLE_FOR_ENTRANCE_IST_USERNAME` text, `ID_INTERNAL` int(11) NOT NULL auto_increment, primary key (ID_INTERNAL), index (OID)) type=InnoDB, character set latin1;
create table `SPACES_HAVE_ATTENDANCES` (`OID_SPACE` bigint unsigned, `OID_SPACE_ATTENDANCES` bigint unsigned, primary key (OID_SPACE, OID_SPACE_ATTENDANCES), index (OID_SPACE), index (OID_SPACE_ATTENDANCES)) type=InnoDB, character set latin1;