/**
 * 
 */
package net.sourceforge.fenixedu.dataTransferObject.oldInquiries;

import net.sourceforge.fenixedu.domain.Person;

/**
 * @author - Shezad Anavarali (shezad@ist.utl.pt)
 * 
 */
public class AffiliatedTeacherDTO extends TeacherDTO {

    private Person person;

    public AffiliatedTeacherDTO(Person person) {
	this.person = person;
    }

    @Override
    public Person getTeacher() {
	return person;
    }

    @Override
    public String getName() {
	return person.getName();
    }

    @Override
    public boolean isPhotoAvailable() {
	final Person pPerson = person;
	final Boolean availablePhoto = pPerson.getAvailablePhoto();
	return availablePhoto != null && availablePhoto && pPerson.hasPersonalPhoto();
    }

    @Override
    public Integer getPersonID() {
	return person.getIdInternal();
    }
}
