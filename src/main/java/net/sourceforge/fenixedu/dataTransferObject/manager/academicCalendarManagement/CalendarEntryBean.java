package net.sourceforge.fenixedu.dataTransferObject.manager.academicCalendarManagement;

import java.io.Serializable;

import net.sourceforge.fenixedu.domain.time.calendarStructure.AcademicCalendarEntry;
import net.sourceforge.fenixedu.domain.time.calendarStructure.AcademicCalendarRootEntry;

import org.joda.time.DateTime;
import org.joda.time.DateTimeFieldType;
import org.joda.time.Partial;
import org.joda.time.YearMonthDay;

import pt.utl.ist.fenix.tools.util.i18n.MultiLanguageString;

public class CalendarEntryBean implements Serializable {

    private MultiLanguageString title;

    private MultiLanguageString description;

    private DateTime begin;

    private DateTime end;

    private Class<? extends AcademicCalendarEntry> type;

    private Partial beginDateToDisplay;

    private Partial endDateToDisplay;

    private AcademicCalendarEntry entryReference;

    private AcademicCalendarEntry templateEntryReference;

    private AcademicCalendarRootEntry selectedRootEntryReference;

    public CalendarEntryBean() {
    }

    public static CalendarEntryBean createAcademicCalendarBean(Partial begin, Partial end) {
        CalendarEntryBean bean = new CalendarEntryBean();
        bean.setBeginDateToDisplay(begin);
        bean.setEndDateToDisplay(end);
        bean.setType(AcademicCalendarRootEntry.class);
        return bean;
    }

    public static CalendarEntryBean createCalendarEntryBeanToCreateEntry(AcademicCalendarRootEntry rootEntry,
            AcademicCalendarEntry parentEntry, Partial begin, Partial end) {

        CalendarEntryBean bean = new CalendarEntryBean();
        bean.setRootEntry(rootEntry);
        bean.setEntry(parentEntry);
        bean.setBeginDateToDisplay(begin);
        bean.setEndDateToDisplay(end);
        return bean;
    }

    public static CalendarEntryBean createCalendarEntryBeanToEditEntry(AcademicCalendarRootEntry rootEntry,
            AcademicCalendarEntry entry, Partial begin, Partial end) {

        CalendarEntryBean bean = new CalendarEntryBean();

        bean.setRootEntry(rootEntry);
        bean.setEntry(entry);
        bean.setBeginDateToDisplay(begin);
        bean.setEndDateToDisplay(end);

        bean.setTemplateEntry(entry.getTemplateEntry());
        bean.setType(entry.getClass());
        bean.setTitle(entry.getTitle());
        bean.setDescription(entry.getDescription());
        bean.setBegin(entry.getBegin());
        bean.setEnd(entry.getEnd());

        return bean;
    }

    public AcademicCalendarRootEntry getAcademicCalendar() {
        return getEntry().getRootEntry();
    }

    public AcademicCalendarRootEntry getRootEntry() {
        return selectedRootEntryReference;
    }

    public void setRootEntry(AcademicCalendarRootEntry entry) {
        this.selectedRootEntryReference = entry;
    }

    public AcademicCalendarEntry getTemplateEntry() {
        return templateEntryReference;
    }

    public void setTemplateEntry(AcademicCalendarEntry entry) {
        this.templateEntryReference = entry;
    }

    public AcademicCalendarEntry getEntry() {
        return entryReference;
    }

    public void setEntry(AcademicCalendarEntry academicCalendarEntry) {
        this.entryReference = academicCalendarEntry;
    }

    public Class<? extends AcademicCalendarEntry> getType() {
        return type;
    }

    public void setType(Class<? extends AcademicCalendarEntry> type) {
        this.type = type;
    }

    public Partial getBeginDateToDisplay() {
        return beginDateToDisplay;
    }

    public void setBeginDateToDisplay(Partial beginDateToDisplay) {
        this.beginDateToDisplay = beginDateToDisplay;
    }

    public Partial getEndDateToDisplay() {
        return endDateToDisplay;
    }

    public void setEndDateToDisplay(Partial endDateToDisplay) {
        this.endDateToDisplay = endDateToDisplay;
    }

    public MultiLanguageString getTitle() {
        return title;
    }

    public void setTitle(MultiLanguageString title) {
        this.title = title;
    }

    public MultiLanguageString getDescription() {
        return description;
    }

    public void setDescription(MultiLanguageString description) {
        this.description = description;
    }

    public DateTime getBegin() {
        return begin;
    }

    public void setBegin(DateTime begin) {
        this.begin = begin;
    }

    public DateTime getEnd() {
        return end;
    }

    public void setEnd(DateTime end) {
        this.end = end;
    }

    public String getBeginPartialString() {
        return getPartialString(getBeginDateToDisplay());
    }

    public String getEndPartialString() {
        return getPartialString(getEndDateToDisplay());
    }

    public static String getPartialString(Partial partial) {
        return partial.toString("MMyyyy");
    }

    public static Partial getPartialFromString(String date) {
        Integer month = Integer.valueOf(date.substring(0, 2));
        Integer year = Integer.valueOf(date.substring(2));
        return new Partial(new DateTimeFieldType[] { DateTimeFieldType.year(), DateTimeFieldType.monthOfYear() }, new int[] {
                year.intValue(), month.intValue() });
    }

    public static Partial getPartialFromYearMonthDay(YearMonthDay day) {
        return new Partial(new DateTimeFieldType[] { DateTimeFieldType.year(), DateTimeFieldType.monthOfYear() }, new int[] {
                day.getYear(), day.getMonthOfYear() });
    }

    private static YearMonthDay getDateFromPartial(Partial partial) {
        return new YearMonthDay(partial.get(DateTimeFieldType.year()), partial.get(DateTimeFieldType.monthOfYear()), 1);
    }

    public YearMonthDay getBeginDateToDisplayInYearMonthDayFormat() {
        return getDateFromPartial(getBeginDateToDisplay());
    }

    public YearMonthDay getEndDateToDisplayInYearMonthDayFormat() {
        return getDateFromPartial(getEndDateToDisplay());
    }
}
