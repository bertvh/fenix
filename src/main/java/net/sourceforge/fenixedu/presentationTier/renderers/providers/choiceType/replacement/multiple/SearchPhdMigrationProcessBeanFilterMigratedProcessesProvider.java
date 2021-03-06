package net.sourceforge.fenixedu.presentationTier.renderers.providers.choiceType.replacement.multiple;

import java.util.Arrays;

import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;
import pt.ist.fenixWebFramework.renderers.converters.EnumArrayConverter;

public class SearchPhdMigrationProcessBeanFilterMigratedProcessesProvider implements DataProvider {

    @Override
    public Object provide(Object source, Object currentValue) {
        return Arrays.asList(net.sourceforge.fenixedu.domain.phd.migration.SearchPhdMigrationProcessBean.FilterMigratedProcesses
                .values());
    }

    @Override
    public Converter getConverter() {
        return new EnumArrayConverter(
                net.sourceforge.fenixedu.domain.phd.migration.SearchPhdMigrationProcessBean.FilterMigratedProcesses.class);
    }

}
