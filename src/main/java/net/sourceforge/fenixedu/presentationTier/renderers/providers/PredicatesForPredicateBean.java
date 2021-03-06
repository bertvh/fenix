package net.sourceforge.fenixedu.presentationTier.renderers.providers;

import net.sourceforge.fenixedu.presentationTier.Action.teacher.tests.PredicateBean;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;

public class PredicatesForPredicateBean implements DataProvider {

    @Override
    public Object provide(Object source, Object currentValue) {
        PredicateBean predicateBean = (PredicateBean) source;

        return predicateBean.getPredicates();
    }

    @Override
    public Converter getConverter() {
        return null;
    }

}
