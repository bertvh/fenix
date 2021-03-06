RENAME TABLE PERSON_PROFESSIONAL_DATA TO GIAF_PROFESSIONAL_DATA;

alter table `GIAF_PROFESSIONAL_DATA` add `TERMINATION_SITUATION_DATE` text, add `TERMINATION_SITUATION_GIAF_ID` text, add `OID_TERMINATION_SITUATION` bigint unsigned, add `OID_PERSON_PROFESSIONAL_DATA` bigint unsigned, add index (OID_PERSON_PROFESSIONAL_DATA), add index (OID_TERMINATION_SITUATION);
alter table `GIAF_PROFESSIONAL_DATA` add `GIAF_PERSON_IDENTIFICATION` text;

update FF$DOMAIN_CLASS_INFO set DOMAIN_CLASS_NAME='net.sourceforge.fenixedu.domain.personnelSection.contracts.GiafProfessionalData' where DOMAIN_CLASS_NAME='net.sourceforge.fenixedu.domain.personnelSection.contracts.PersonProfessionalData';

CREATE TABLE PERSON_PROFESSIONAL_DATA (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID` bigint(20) DEFAULT NULL,
  `OID_PERSON` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) type=InnoDB, character set latin1;

insert into FF$DOMAIN_CLASS_INFO(DOMAIN_CLASS_NAME, DOMAIN_CLASS_ID)
select 'net.sourceforge.fenixedu.domain.personnelSection.contracts.PersonProfessionalData', max(DOMAIN_CLASS_ID) + 1
from FF$DOMAIN_CLASS_INFO;

insert into PERSON_PROFESSIONAL_DATA(OID_PERSON)
select OID_PERSON
from GIAF_PROFESSIONAL_DATA;

select @xpto:=null;
select @xpto:=FF$DOMAIN_CLASS_INFO.DOMAIN_CLASS_ID from FF$DOMAIN_CLASS_INFO where FF$DOMAIN_CLASS_INFO.DOMAIN_CLASS_NAME = 'net.sourceforge.fenixedu.domain.personnelSection.contracts.PersonProfessionalData';
update PERSON_PROFESSIONAL_DATA set OID = (@xpto << 32) + ID_INTERNAL;


update PARTY set OID_PERSON_PROFESSIONAL_DATA=(select OID from PERSON_PROFESSIONAL_DATA where PERSON_PROFESSIONAL_DATA.OID_PERSON=PARTY.OID);
update GIAF_PROFESSIONAL_DATA set OID_PERSON_PROFESSIONAL_DATA=(select OID from PERSON_PROFESSIONAL_DATA where GIAF_PROFESSIONAL_DATA.OID_PERSON=PERSON_PROFESSIONAL_DATA.OID_PERSON);
update GIAF_PROFESSIONAL_DATA set GIAF_PERSON_IDENTIFICATION=(select lpad(EMPLOYEE.EMPLOYEE_NUMBER,6,0) from EMPLOYEE inner join PARTY on PARTY.OID_EMPLOYEE=EMPLOYEE.OID inner join PERSON_PROFESSIONAL_DATA on PERSON_PROFESSIONAL_DATA.OID_PERSON=PARTY.OID where GIAF_PROFESSIONAL_DATA.OID_PERSON=PERSON_PROFESSIONAL_DATA.OID_PERSON);

alter table `PERSON_FUNCTIONS_ACCUMULATION` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);
alter table `PERSON_PROFESSIONAL_CONTRACT` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);
alter table `PERSON_PROFESSIONAL_EXEMPTION` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);
alter table `PERSON_CONTRACT_SITUATION` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);
alter table `PERSON_PROFESSIONAL_CATEGORY` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);
alter table `PERSON_PROFESSIONAL_RELATION` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);
alter table `PERSON_PROFESSIONAL_REGIME` change `OID_PERSON_PROFESSIONAL_DATA` `OID_GIAF_PROFESSIONAL_DATA` bigint unsigned, add index (OID_GIAF_PROFESSIONAL_DATA);

drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_FUNCTIONS_ACCUMULATION;
drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_PROFESSIONAL_CONTRACT;
drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_PROFESSIONAL_EXEMPTION;
drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_CONTRACT_SITUATION;
drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_PROFESSIONAL_CATEGORY;
drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_PROFESSIONAL_RELATION;
drop index OID_PERSON_PROFESSIONAL_DATA on PERSON_PROFESSIONAL_REGIME;

alter table `GIAF_PROFESSIONAL_DATA` drop column OID_PERSON;