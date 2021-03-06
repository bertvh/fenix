package net.sourceforge.fenixedu.presentationTier.renderers.providers;

import java.util.ArrayList;
import java.util.List;

import net.sourceforge.fenixedu.presentationTier.Action.vigilancy.InformationTypeToDisplay;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;

public class InformationTypesProvider implements DataProvider {

    @Override
    public Object provide(Object source, Object currentValue) {
        List<InformationTypeToDisplay> types = new ArrayList<InformationTypeToDisplay>();

        for (InformationTypeToDisplay typeToDisplay : InformationTypeToDisplay.values()) {
            types.add(typeToDisplay);
        }

        return types;
    }

    @Override
    public Converter getConverter() {
        return new Converter() {

            @Override
            public Object convert(Class type, Object value) {
                return InformationTypeToDisplay.valueOf((String) value);

            }

        };
    }

}