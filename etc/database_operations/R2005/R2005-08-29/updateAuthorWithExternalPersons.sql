select concat('update AUTHOR set AUTHOR.KEY_PERSON = ',
	PERSON.ID_INTERNAL,
	' where AUTHOR.ID_INTERNAL = ',
	AUTHOR.ID_INTERNAL,
	';') as ""
from PERSON
	inner join AUTHOR on AUTHOR.ID_INTERNAL = PERSON.DOCUMENT_ID_NUMBER
where PERSON.USERNAME like 'author%';
