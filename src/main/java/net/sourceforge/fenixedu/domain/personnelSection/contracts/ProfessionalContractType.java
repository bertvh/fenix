package net.sourceforge.fenixedu.domain.personnelSection.contracts;

import net.sourceforge.fenixedu.domain.RootDomainObject;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import pt.ist.fenixWebFramework.services.Service;
import pt.utl.ist.fenix.tools.util.i18n.MultiLanguageString;

public class ProfessionalContractType extends ProfessionalContractType_Base {

    public ProfessionalContractType(final String giafId, final MultiLanguageString name) {
        super();
        String[] args1 = {};
        if (giafId == null || giafId.isEmpty()) {
            throw new DomainException("", args1);
        }
        String[] args = {};
        if (name == null) {
            throw new DomainException("", args);
        }
        setRootDomainObject(RootDomainObject.getInstance());
        setGiafId(giafId);
        setName(name);
    }

    @Service
    public void edit(final MultiLanguageString name) {
        String[] args = {};
        if (name == null) {
            throw new DomainException("", args);
        }
        setName(name);
    }
}
