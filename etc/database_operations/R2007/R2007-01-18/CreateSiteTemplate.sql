ALTER TABLE `SITE` 
	ADD COLUMN `KEY_TEMPLATE` INTEGER,
	ADD COLUMN `SITE_TYPE` VARCHAR(255);

ALTER TABLE `ACCESSIBLE_ITEM`
	ADD COLUMN `KEY_FUNCTIONALITY` INTEGER;
ALTER TABLE `ACCESSIBLE_ITEM` 
	MODIFY COLUMN `NAME` TEXT;
