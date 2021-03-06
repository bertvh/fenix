
alter table `ASSIDUOUSNESS_CLOSED_DAY` add column `HOLIDAY_BALANCE` bigint(20);
alter table `ASSIDUOUSNESS_CLOSED_DAY` add column `IS_CORRECTION` tinyint(1) NOT NULL DEFAULT 0;
alter table `ASSIDUOUSNESS_CLOSED_DAY` add column `LAST_MODIFIED_DATE` timestamp NULL default NULL;
alter table `ASSIDUOUSNESS_CLOSED_DAY` add column `OID_CORRECTED_ON_CLOSED_MONTH` bigint(20);
alter table `ASSIDUOUSNESS_CLOSED_DAY` add column `SATURDAY_BALANCE` bigint(20);
alter table `ASSIDUOUSNESS_CLOSED_DAY` add column `SUNDAY_BALANCE` bigint(20);

alter table `ASSIDUOUSNESS_CLOSED_MONTH` add column `IS_CORRECTION` tinyint(1) NOT NULL DEFAULT 0;
alter table `ASSIDUOUSNESS_CLOSED_MONTH` add column `LAST_MODIFIED_DATE` timestamp NULL default NULL;
alter table `ASSIDUOUSNESS_CLOSED_MONTH` add column `OID_CORRECTED_ON_CLOSED_MONTH` bigint(20);

alter table `ASSIDUOUSNESS_EXTRA_WORK` add column `IS_CORRECTION` tinyint(1) NOT NULL DEFAULT 0;
alter table `ASSIDUOUSNESS_EXTRA_WORK` add column `LAST_MODIFIED_DATE` timestamp NULL default NULL;
alter table `ASSIDUOUSNESS_EXTRA_WORK` add column `OID_CORRECTED_ON_CLOSED_MONTH` bigint(20);

alter table `ASSIDUOUSNESS_EXTRA_WORK` change COLUMN NIGHT_EXTRA_WORK_DAYS NIGHT_EXTRA_WORK_DAYS int(2) NOT NULL DEFAULT 0;

alter table `CLOSED_MONTH_JUSTIFICATION` add column `IS_CORRECTION` tinyint(1) NOT NULL DEFAULT 0;
alter table `CLOSED_MONTH_JUSTIFICATION` add column `LAST_MODIFIED_DATE` timestamp NULL default NULL;
alter table `CLOSED_MONTH_JUSTIFICATION` add column `OID_CORRECTED_ON_CLOSED_MONTH` bigint(20);

alter table `CLOSED_MONTH` add column `CLOSED_FOR_BALANCE_DATE` timestamp NULL default NULL;

alter table ASSIDUOUSNESS_CLOSED_MONTH drop column EFECTIVE_WORKED_TIME;

