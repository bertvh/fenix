package net.sourceforge.fenixedu.domain.student;

import net.sourceforge.fenixedu.dataTransferObject.student.ExternalRegistrationDataBean;
import net.sourceforge.fenixedu.domain.RootDomainObject;
import net.sourceforge.fenixedu.domain.organizationalStructure.Unit;
import net.sourceforge.fenixedu.domain.organizationalStructure.UnitUtils;

import org.apache.commons.lang.StringUtils;

/**
 * 
 * @author - Shezad Anavarali (shezad@ist.utl.pt)
 * 
 */
public class ExternalRegistrationData extends ExternalRegistrationData_Base {

    public ExternalRegistrationData(Registration registration) {
        super();
        setRootDomainObject(RootDomainObject.getInstance());
        setRegistration(registration);
    }

    public void edit(ExternalRegistrationDataBean externalRegistrationDataBean) {

        Unit institution = externalRegistrationDataBean.getInstitution();
        if (institution == null && !StringUtils.isEmpty(externalRegistrationDataBean.getInstitutionName())) {
            institution = UnitUtils.readExternalInstitutionUnitByName(externalRegistrationDataBean.getInstitutionName());
            if (institution == null) {
                institution = Unit.createNewNoOfficialExternalInstitution(externalRegistrationDataBean.getInstitutionName());
            }
        }

        setInstitution(institution);
        setCoordinatorName(externalRegistrationDataBean.getCoordinatorName());
    }

    public void delete() {
        removeRootDomainObject();
        removeInstitution();
        removeRegistration();
        super.deleteDomainObject();
    }
}
