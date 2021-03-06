--  SQL file representing changes to the functionalities model
--  Generated at Wed May 30 13:02:08 WEST 2007
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Updating existing functionalities
-- 

--  ID: 26326 UUID: '96b1a0d4-6469-41b9-8de7-71caebe8f98c'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`VISIBLE` = 0 WHERE own.`UUID` = '96b1a0d4-6469-41b9-8de7-71caebe8f98c';

--  ID: 26327 UUID: 'c113952d-6c49-44c0-b30b-d56ab1d2d047'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`VISIBLE` = 0 WHERE own.`UUID` = 'c113952d-6c49-44c0-b30b-d56ab1d2d047';

--  ID: 133471 UUID: '3ea20dd8-cbe0-4100-b341-7714dd3263ec'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`VISIBLE` = 0 WHERE own.`UUID` = '3ea20dd8-cbe0-4100-b341-7714dd3263ec';

--  ID: 133474 UUID: '931438dc-b0e2-4d2a-b017-1a449adf59e3'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`VISIBLE` = 0 WHERE own.`UUID` = '931438dc-b0e2-4d2a-b017-1a449adf59e3';

--  ID: 140670 UUID: 'e9ab1a2b-cfd2-4c6d-9476-27c7c3caf4c6'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`VISIBLE` = 0 WHERE own.`UUID` = 'e9ab1a2b-cfd2-4c6d-9476-27c7c3caf4c6';

--  ID: 140671 UUID: '8481d1a7-1b95-43f6-b091-e0d582aa86e5'
UPDATE `ACCESSIBLE_ITEM` AS own SET own.`VISIBLE` = 0 WHERE own.`UUID` = '8481d1a7-1b95-43f6-b091-e0d582aa86e5';

COMMIT;
