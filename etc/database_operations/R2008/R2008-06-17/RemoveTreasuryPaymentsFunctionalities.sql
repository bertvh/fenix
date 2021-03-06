SET AUTOCOMMIT = 0;

START TRANSACTION;

DELETE FROM CONTENT WHERE CONTENT_ID = 'b625859525c43f4b0016a15fd9db9fc1:c2151da6-181a-45f6-8443-04519bc1537f' ;

DELETE FROM CONTENT WHERE CONTENT_ID = 'b625859525c43f4b0016a15fd9db9fc1:6e93b673-f363-4c9e-89e1-9cb0683a80cc' ;

DELETE FROM CONTENT WHERE CONTENT_ID = 'b625859525c43f4b0016a15fd9db9fc1' ;

DELETE FROM NODE WHERE CONTENT_ID = 'e4add0c2f1f24b0cdf67701b3c4bb2a4:b625859525c43f4b0016a15fd9db9fc1' ;

DELETE FROM NODE WHERE CONTENT_ID = 'b625859525c43f4b0016a15fd9db9fc1:c2151da6-181a-45f6-8443-04519bc1537f' ;

DELETE FROM NODE WHERE CONTENT_ID = 'b625859525c43f4b0016a15fd9db9fc1:6e93b673-f363-4c9e-89e1-9cb0683a80cc' ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


DROP TABLE UUID_TEMP_TABLE;

UPDATE NODE SET NODE_ORDER=0,ASCENDING=1,VISIBLE=1,CONTENT_ID='3cc0ecf4-b897-48d7-925c-af865f028b9b:776f77d3-d868-49cc-a23d-02462365806b',KEY_CHILD=1,KEY_PARENT=2,KEY_ROOT_DOMAIN_OBJECT=1,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '3cc0ecf4-b897-48d7-925c-af865f028b9b:776f77d3-d868-49cc-a23d-02462365806b'  ;

DELETE FROM NODE WHERE CONTENT_ID = 'a8c7a3d0-8929-4f59-ab89-e0adeee1b3d0:6e93b673-f363-4c9e-89e1-9cb0683a80cc' ;

DELETE FROM EXECUTION_PATH WHERE CONTENT_ID = 'c2151da6-181a-45f6-8443-04519bc1537f' ;

DELETE FROM EXECUTION_PATH WHERE CONTENT_ID = '6e93b673-f363-4c9e-89e1-9cb0683a80cc' ;

DELETE FROM NODE WHERE CONTENT_ID = 'a8c7a3d0-8929-4f59-ab89-e0adeee1b3d0:c2151da6-181a-45f6-8443-04519bc1537f' ;

DELETE FROM NODE WHERE CONTENT_ID = '3cc0ecf4-b897-48d7-925c-af865f028b9b:a8c7a3d0-8929-4f59-ab89-e0adeee1b3d0' ;

DELETE FROM CONTENT WHERE CONTENT_ID = 'a8c7a3d0-8929-4f59-ab89-e0adeee1b3d0' ;

DELETE FROM CONTENT WHERE CONTENT_ID = 'c2151da6-181a-45f6-8443-04519bc1537f' ;

DELETE FROM CONTENT WHERE CONTENT_ID = '6e93b673-f363-4c9e-89e1-9cb0683a80cc' ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(1,'776f77d3-d868-49cc-a23d-02462365806b','3cc0ecf4-b897-48d7-925c-af865f028b9b:776f77d3-d868-49cc-a23d-02462365806b') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(2,'3cc0ecf4-b897-48d7-925c-af865f028b9b','3cc0ecf4-b897-48d7-925c-af865f028b9b:776f77d3-d868-49cc-a23d-02462365806b') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;



COMMIT;
