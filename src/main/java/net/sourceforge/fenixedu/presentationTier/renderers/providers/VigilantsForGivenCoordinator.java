package net.sourceforge.fenixedu.presentationTier.renderers.providers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.sourceforge.fenixedu.domain.vigilancy.ExamCoordinator;
import net.sourceforge.fenixedu.domain.vigilancy.VigilantWrapper;
import net.sourceforge.fenixedu.presentationTier.Action.vigilancy.UnavailablePeriodBean;

import org.apache.commons.beanutils.BeanComparator;

import pt.ist.fenixWebFramework.rendererExtensions.converters.DomainObjectKeyConverter;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;

public class VigilantsForGivenCoordinator implements DataProvider {

    @Override
    public Object provide(Object source, Object currentValue) {

        UnavailablePeriodBean bean = (UnavailablePeriodBean) source;

        ExamCoordinator coordinator = bean.getCoordinator();

        List<VigilantWrapper> vigilantsToReturn = new ArrayList<VigilantWrapper>(coordinator.getVigilantsThatCanManage());

        Collections.sort(vigilantsToReturn, new BeanComparator("person.name"));
        return vigilantsToReturn;
    }

    @Override
    public Converter getConverter() {
        return new DomainObjectKeyConverter();
    }

}