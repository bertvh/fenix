alter table GRANT_CONTRACT add column KEY_GRANT_INSURANCE int(11);

select concat('update GRANT_CONTRACT set GRANT_CONTRACT.KEY_GRANT_INSURANCE = ',
		GRANT_INSURANCE.ID_INTERNAL,
		' where GRANT_CONTRACT.ID_INTERNAL = ',
		GRANT_CONTRACT.ID_INTERNAL, ';') as "" from GRANT_CONTRACT inner join GRANT_INSURANCE on GRANT_INSURANCE.KEY_GRANT_CONTRACT = GRANT_CONTRACT.ID_INTERNAL;