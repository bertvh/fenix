ALTER TABLE COUNTRY DROP KEY U1;

alter table COUNTRY add column COUNTRY_NATIONALITY longtext;

update COUNTRY set NATIONALITY = '__xpto__' where NATIONALITY is null or NATIONALITY = '';
update COUNTRY set COUNTRY.COUNTRY_NATIONALITY = concat('pt', length(replace(COUNTRY.NATIONALITY, "__xpto__", "")), ':', replace(COUNTRY.NATIONALITY, "__xpto__", "")); 
update COUNTRY set COUNTRY_NATIONALITY = NULL WHERE COUNTRY_NATIONALITY = "pt0:en0:";
update COUNTRY set COUNTRY_NATIONALITY = replace(COUNTRY.COUNTRY_NATIONALITY, "pt0:", "");
update COUNTRY set COUNTRY_NATIONALITY = replace(COUNTRY.COUNTRY_NATIONALITY, "en0:", "");

alter table COUNTRY add key `U1` (`NAME`,`NATIONALITY`,`CODE`);
alter table COUNTRY drop column NATIONALITY;

update COUNTRY set COUNTRY_NATIONALITY = "pt10:PORTUGUESAen10:PORTUGUESE" where COUNTRY_NATIONALITY = "pt10:PORTUGUESA";
update COUNTRY set COUNTRY_NATIONALITY = "pt29:PORTUGUESA NATURAL DOS ACORESen22:PORTUGUESE FROM ACORES" where COUNTRY_NATIONALITY = "pt29:PORTUGUESA NATURAL DOS ACORES";
update COUNTRY set COUNTRY_NATIONALITY = "pt29:PORTUGUESA NATURAL DA MADEIRAen23:PORTUGUESE FROM MADEIRA" where COUNTRY_NATIONALITY = "pt29:PORTUGUESA NATURAL DA MADEIRA";
update COUNTRY set COUNTRY_NATIONALITY = "pt33:PORTUGUESA NATURAL DO ESTRANGEIROen22:NATURALIZED PORTUGUESE" where COUNTRY_NATIONALITY = "pt33:PORTUGUESA NATURAL DO ESTRANGEIRO";
update COUNTRY set COUNTRY_NATIONALITY = "pt41:PORTUGUESA NATURAL DE MACAU E TIMOR LESTEen37:PORTUGUESE FROM MACAU AND TIMOR LESTE" where COUNTRY_NATIONALITY = "pt41:PORTUGUESA NATURAL DE MACAU E TIMOR LESTE";
update COUNTRY set COUNTRY_NATIONALITY = "pt8:FRANCESAen6:FRENCH" where COUNTRY_NATIONALITY = "pt8:FRANCESA";
update COUNTRY set COUNTRY_NATIONALITY = "pt8:ITALIANAen7:ITALIAN" where COUNTRY_NATIONALITY = "pt8:ITALIANA";
update COUNTRY set COUNTRY_NATIONALITY = "pt9:BRITÂNICAen7:BRITISH" where COUNTRY_NATIONALITY = "pt9:BRITÂNICA";
