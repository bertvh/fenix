package net.sourceforge.fenixedu.domain.contacts;

import java.util.Comparator;

import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.organizationalStructure.Party;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;

public class MobilePhone extends MobilePhone_Base {

    public static Comparator<MobilePhone> COMPARATOR_BY_NUMBER = new Comparator<MobilePhone>() {
        @Override
        public int compare(MobilePhone contact, MobilePhone otherContact) {
            final String number = contact.getNumber();
            final String otherNumber = otherContact.getNumber();
            int result = 0;
            if (number != null && otherNumber != null) {
                result = number.compareTo(otherNumber);
            } else if (number != null) {
                result = 1;
            } else if (otherNumber != null) {
                result = -1;
            }
            return (result == 0) ? COMPARATOR_BY_TYPE.compare(contact, otherContact) : result;
        }
    };

    public static MobilePhone createMobilePhone(Party party, String number, PartyContactType type, Boolean isDefault,
            Boolean visibleToPublic, Boolean visibleToStudents, Boolean visibleToTeachers, Boolean visibleToEmployees,
            Boolean visibleToAlumni) {
        MobilePhone result = null;
        if (!StringUtils.isEmpty(number)) {
            result =
                    new MobilePhone(party, type, visibleToPublic, visibleToStudents, visibleToTeachers, visibleToEmployees,
                            visibleToAlumni, isDefault, number);
        }
        return result;
    }

    public static MobilePhone createMobilePhone(Party party, String number, PartyContactType type, boolean isDefault) {
        for (MobilePhone phone : party.getMobilePhones()) {
            if (phone.getNumber().equals(number)) {
                return phone;
            }
        }
        return (!StringUtils.isEmpty(number)) ? new MobilePhone(party, type, isDefault, number) : null;
    }

    protected MobilePhone() {
        super();
        new PhoneValidation(this);
    }

    protected MobilePhone(final Party party, final PartyContactType type, final boolean defaultContact, final String number) {
        this();
        super.init(party, type, defaultContact);
        checkParameters(number);
        super.setNumber(number);
    }

    protected MobilePhone(final Party party, final PartyContactType type, final boolean visibleToPublic,
            final boolean visibleToStudents, final boolean visibleToTeachers, final boolean visibleToEmployees,
            final boolean visibleToAlumni, final boolean defaultContact, final String number) {
        this();
        super.init(party, type, visibleToPublic, visibleToStudents, visibleToTeachers, visibleToEmployees, visibleToAlumni,
                defaultContact);
        checkParameters(number);
        super.setNumber(number);
    }

    private void checkParameters(final String number) {
        if (StringUtils.isEmpty(number)) {
            throw new DomainException("error.contacts.Phone.invalid.number");
        }
    }

    @Override
    public boolean isMobile() {
        return true;
    }

    public void edit(final String number) {
        if (!StringUtils.equals(getNumber(), number)) {
            super.setNumber(number);
            if (!waitsValidation()) {
                new PhoneValidation(this);
            }
            setLastModifiedDate(new DateTime());
        }
    }

    @Override
    public String getPresentationValue() {
        return getNumber();
    }

    public boolean hasNumber() {
        return getNumber() != null && !getNumber().isEmpty();
    }

    @Override
    public boolean hasValue(String value) {
        return hasNumber() && getNumber().equals(value);
    }

    @Override
    public void logCreate(Person person) {
        logCreateAux(person, "label.partyContacts.MobilePhone");
    }

    @Override
    public void logEdit(Person person, boolean propertiesChanged, boolean valueChanged, boolean createdNewContact, String newValue) {
        logEditAux(person, propertiesChanged, valueChanged, createdNewContact, newValue, "label.partyContacts.MobilePhone");
    }

    @Override
    public void logDelete(Person person) {
        logDeleteAux(person, "label.partyContacts.MobilePhone");
    }

    @Override
    public void logValid(Person person) {
        logValidAux(person, "label.partyContacts.MobilePhone");
    }

    @Override
    public void logRefuse(Person person) {
        logRefuseAux(person, "label.partyContacts.MobilePhone");
    }
}
