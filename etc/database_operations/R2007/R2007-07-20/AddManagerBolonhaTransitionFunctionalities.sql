--  SQL file representing changes to the functionalities model
--  Generated at Fri Jul 20 19:24:55 WEST 2007
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Updating existing functionalities
-- 

--  ID: 14 UUID: '436a0eab-5fa1-4d9e-b485-47b79f208d3e'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 2 WHERE own.`UUID` = '436a0eab-5fa1-4d9e-b485-47b79f208d3e';

--  ID: 20 UUID: 'f0ce9502-abeb-4f54-96e8-0aafa607d119'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 3 WHERE own.`UUID` = 'f0ce9502-abeb-4f54-96e8-0aafa607d119';

--  ID: 24 UUID: '333ed836-75a1-42b9-82ca-bd73ddc696bb'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 5 WHERE own.`UUID` = '333ed836-75a1-42b9-82ca-bd73ddc696bb';

--  ID: 84 UUID: '0d2bd673-9a1c-475b-95fc-09a9538cfc19'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 6 WHERE own.`UUID` = '0d2bd673-9a1c-475b-95fc-09a9538cfc19';

--  ID: 109 UUID: '30e296b0-c117-4ba8-adec-dabf1fe98c7f'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 7 WHERE own.`UUID` = '30e296b0-c117-4ba8-adec-dabf1fe98c7f';

--  ID: 132 UUID: 'c6809d14-868d-47dc-974a-b0953ff1170a'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 8 WHERE own.`UUID` = 'c6809d14-868d-47dc-974a-b0953ff1170a';

--  ID: 135 UUID: '4e133362-ab11-432d-8c1d-ab17cf967025'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 9 WHERE own.`UUID` = '4e133362-ab11-432d-8c1d-ab17cf967025';

--  ID: 147 UUID: '100665ef-9ac1-457b-97b5-f17f63410c54'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 10 WHERE own.`UUID` = '100665ef-9ac1-457b-97b5-f17f63410c54';

--  ID: 154 UUID: '3cda1e13-980f-467f-afb9-1238b02e8337'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 11 WHERE own.`UUID` = '3cda1e13-980f-467f-afb9-1238b02e8337';

--  ID: 158 UUID: '97dd4070-1107-4efe-b798-56531be0a995'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 12 WHERE own.`UUID` = '97dd4070-1107-4efe-b798-56531be0a995';

--  ID: 162 UUID: '3dc8b39b-d0b0-4233-8f0e-7388b1f16770'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 13 WHERE own.`UUID` = '3dc8b39b-d0b0-4233-8f0e-7388b1f16770';

--  ID: 165 UUID: 'a4d83e41-689a-4b8b-bfc7-acc0fd530040'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 14 WHERE own.`UUID` = 'a4d83e41-689a-4b8b-bfc7-acc0fd530040';

--  ID: 173 UUID: '1b3a09b7-e04f-47b7-8298-bb5ffeff489d'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 15 WHERE own.`UUID` = '1b3a09b7-e04f-47b7-8298-bb5ffeff489d';

--  ID: 200 UUID: '8dfee1bd-dbf7-45b0-ae2b-d8136998106b'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 19 WHERE own.`UUID` = '8dfee1bd-dbf7-45b0-ae2b-d8136998106b';

--  ID: 18844 UUID: 'eed02d28-7445-4263-ade3-523af17545b3'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 17 WHERE own.`UUID` = 'eed02d28-7445-4263-ade3-523af17545b3';

--  ID: 23525 UUID: '390da578-6e41-4cdd-9602-76f246658885'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 4 WHERE own.`UUID` = '390da578-6e41-4cdd-9602-76f246658885';

--  ID: 115867 UUID: 'a7316c48-3212-4d55-9b94-87d572980551'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 18 WHERE own.`UUID` = 'a7316c48-3212-4d55-9b94-87d572980551';

--  ID: 214077 UUID: '2d4e42c6-b536-40ff-b696-98952883574c'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`ORDER_IN_MODULE` = 16 WHERE own.`UUID` = '2d4e42c6-b536-40ff-b696-98952883574c';

-- 
--  Inserting new functionalities
-- 

--  ID: 250893 UUID: '98992e03-b176-4241-afa1-2914c4065988'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT '98992e03-b176-4241-afa1-2914c4065988', 'net.sourceforge.fenixedu.domain.functionalities.Module', 1, `ID_INTERNAL`, `ID_INTERNAL`, NULL, 'pt20:Transição de Bolonha', NULL, NULL, '', '/', 1, 1, NULL, 1, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '4d6686aa-9e47-4a47-a08a-a37d69f94eb5';

--  ID: 250894 UUID: 'acd4095c-7735-4c39-bbbc-b2f1721ba7bc'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT 'acd4095c-7735-4c39-bbbc-b2f1721ba7bc', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt30:Planos de Equivalência Globais', NULL, NULL, '/degreeCurricularPlan/equivalencyPlan.do?method=showPlan', NULL, 1, 1, NULL, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '98992e03-b176-4241-afa1-2914c4065988';

--  ID: 251088 UUID: 'd81be16a-b779-4a4f-ae06-4621e819abfe'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT 'd81be16a-b779-4a4f-ae06-4621e819abfe', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt29:Planos de Equivalência Locais', NULL, NULL, '/degreeCurricularPlan/studentEquivalencyPlan.do?method=showPlan', NULL, 1, 1, NULL, 1, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '98992e03-b176-4241-afa1-2914c4065988';

--  ID: 251288 UUID: '09ff0559-db02-4882-9c0e-5bce50842a3e'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT '09ff0559-db02-4882-9c0e-5bce50842a3e', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt18:Currículo do Aluno', NULL, NULL, '/bolonhaTransitionManagement.do?method=prepareChooseStudent', NULL, 1, 1, NULL, 2, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '98992e03-b176-4241-afa1-2914c4065988';

COMMIT;
