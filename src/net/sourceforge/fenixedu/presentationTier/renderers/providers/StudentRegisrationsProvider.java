package net.sourceforge.fenixedu.presentationTier.renderers.providers;

import net.sourceforge.fenixedu.dataTransferObject.student.ManageStudentStatuteBean;
import net.sourceforge.fenixedu.presentationTier.renderers.converters.DomainObjectKeyConverter;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;

public class StudentRegisrationsProvider implements DataProvider {

    public Object provide(Object source, Object currentValue) {

	return ((ManageStudentStatuteBean) source).getStudent().getRegistrations();
    }

    public Converter getConverter() {
	return new DomainObjectKeyConverter();
    }

}