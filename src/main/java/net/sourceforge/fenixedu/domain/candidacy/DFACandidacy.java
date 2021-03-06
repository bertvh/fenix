package net.sourceforge.fenixedu.domain.candidacy;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import net.sourceforge.fenixedu.domain.ExecutionDegree;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.accounting.Event;
import net.sourceforge.fenixedu.domain.accounting.EventType;
import net.sourceforge.fenixedu.domain.accounting.events.dfa.DFACandidacyEvent;
import net.sourceforge.fenixedu.domain.accounting.serviceAgreements.DegreeCurricularPlanServiceAgreement;
import net.sourceforge.fenixedu.domain.administrativeOffice.AdministrativeOffice;
import net.sourceforge.fenixedu.domain.util.workflow.Operation;
import net.sourceforge.fenixedu.injectionCode.AccessControl;

import org.joda.time.YearMonthDay;

import pt.utl.ist.fenix.tools.util.i18n.Language;

public class DFACandidacy extends DFACandidacy_Base {

    private static Map<String, Set<String>> stateMap;

    static {
        stateMap = new HashMap<String, Set<String>>();

        Set<String> admittedSet = new HashSet<String>();
        admittedSet.add(CandidacySituationType.ADMITTED.toString());
        admittedSet.add(CandidacySituationType.REGISTERED.toString());
        admittedSet.add(CandidacySituationType.NOT_ADMITTED.toString());
        admittedSet.add(CandidacySituationType.SUBSTITUTE.toString());
        admittedSet.add(CandidacySituationType.CANCELLED.toString());
        stateMap.put(CandidacySituationType.ADMITTED.toString(), admittedSet);

        stateMap.put(CandidacySituationType.CANCELLED.toString(), new HashSet<String>());

        Set<String> notAdmitted = new HashSet<String>();
        notAdmitted.add(CandidacySituationType.ADMITTED.toString());
        notAdmitted.add(CandidacySituationType.NOT_ADMITTED.toString());
        notAdmitted.add(CandidacySituationType.SUBSTITUTE.toString());
        notAdmitted.add(CandidacySituationType.CANCELLED.toString());
        stateMap.put(CandidacySituationType.NOT_ADMITTED.toString(), notAdmitted);

        Set<String> preCandidacy = new HashSet<String>();
        preCandidacy.add(CandidacySituationType.STAND_BY.toString());
        preCandidacy.add(CandidacySituationType.CANCELLED.toString());
        stateMap.put(CandidacySituationType.PRE_CANDIDACY.toString(), preCandidacy);

        stateMap.put(CandidacySituationType.REGISTERED.toString(), new HashSet());

        Set<String> standBy = new HashSet<String>();
        standBy.add(CandidacySituationType.STAND_BY_FILLED_DATA.toString());
        standBy.add(CandidacySituationType.STAND_BY_CONFIRMED_DATA.toString());
        standBy.add(CandidacySituationType.CANCELLED.toString());
        stateMap.put(CandidacySituationType.STAND_BY.toString(), standBy);

        Set<String> standByConfirmedData = new HashSet<String>();
        standByConfirmedData.add(CandidacySituationType.ADMITTED.toString());
        standByConfirmedData.add(CandidacySituationType.NOT_ADMITTED.toString());
        standByConfirmedData.add(CandidacySituationType.SUBSTITUTE.toString());
        standByConfirmedData.add(CandidacySituationType.CANCELLED.toString());
        stateMap.put(CandidacySituationType.STAND_BY_CONFIRMED_DATA.toString(), standByConfirmedData);

        Set<String> standByFilledData = new HashSet<String>();
        standByFilledData.add(CandidacySituationType.STAND_BY_CONFIRMED_DATA.toString());
        standByFilledData.add(CandidacySituationType.ADMITTED.toString());
        standByFilledData.add(CandidacySituationType.STAND_BY.toString());
        stateMap.put(CandidacySituationType.STAND_BY_FILLED_DATA.toString(), standByFilledData);

        Set<String> substitute = new HashSet<String>();
        substitute.add(CandidacySituationType.ADMITTED.toString());
        substitute.add(CandidacySituationType.NOT_ADMITTED.toString());
        substitute.add(CandidacySituationType.SUBSTITUTE.toString());
        stateMap.put(CandidacySituationType.SUBSTITUTE.toString(), substitute);
    }

    public DFACandidacy(Person person, ExecutionDegree executionDegree) {
        super();
        init(person, executionDegree);

        new PreCandidacySituation(this);

        addCandidacyDocuments(new CandidacyDocument("curriculum.vitae"));
        addCandidacyDocuments(new CandidacyDocument("habilitation.certificate"));
        addCandidacyDocuments(new CandidacyDocument("second.habilitation.certificate"));
        addCandidacyDocuments(new CandidacyDocument("interest.letter"));

        final AdministrativeOffice administrativeOffice = executionDegree.getDegree().getAdministrativeOffice();
        new DFACandidacyEvent(administrativeOffice, person, this);
        new DegreeCurricularPlanServiceAgreement(person, executionDegree.getDegreeCurricularPlan().getServiceAgreementTemplate());
    }

    public DFACandidacy(Person person, ExecutionDegree executionDegree, YearMonthDay startDate) {
        this(person, executionDegree);
        if (startDate != null) {
            this.setStartDate(startDate);
        }

    }

    @Override
    public String getDescription() {
        return ResourceBundle.getBundle("resources.CandidateResources", Language.getLocale()).getString("label.dfaCandidacy")
                + " - " + getExecutionDegree().getDegreeCurricularPlan().getName() + " - "
                + getExecutionDegree().getExecutionYear().getYear();
    }

    @Override
    public Set<Operation> getOperations(CandidacySituation candidacySituation) {
        return new HashSet<Operation>();
    }

    @Override
    protected void moveToNextState(CandidacyOperationType candidacyOperationType, Person person) {
        // TODO Auto-generated method stub

    }

    public void cancelEvents() {
        for (Event event : getPerson().getEventsByEventType(EventType.CANDIDACY_ENROLMENT)) {
            DFACandidacyEvent candidacyEvent = (DFACandidacyEvent) event;
            if (candidacyEvent.getCandidacy() == this) {
                candidacyEvent.cancel(AccessControl.getPerson());
            }
        }
    }

    @Override
    public Map<String, Set<String>> getStateMapping() {
        return stateMap;
    }

    @Override
    public String getDefaultState() {
        switch (this.getActiveCandidacySituation().getCandidacySituationType()) {
        case ADMITTED:
            return CandidacySituationType.REGISTERED.toString();
        case PRE_CANDIDACY:
            return CandidacySituationType.STAND_BY.toString();
        case STAND_BY:
            return CandidacySituationType.STAND_BY_FILLED_DATA.toString();
        case STAND_BY_FILLED_DATA:
            return CandidacySituationType.ADMITTED.toString();
        default:
            return null;
        }
    }

    @Override
    protected boolean checkIfDataIsFilled() {
        Person person = getPerson();
        return (person.getGender() != null && person.getExpirationDateOfDocumentIdYearMonthDay() != null
                && person.getProfession() != null && person.getMaritalStatus() != null
                && person.getDateOfBirthYearMonthDay() != null && person.getCountry() != null && person.getNameOfFather() != null
                && person.getNameOfMother() != null && person.hasDefaultPhysicalAddress() && person
                    .getInstitutionalOrDefaultEmailAddressValue() != null);
    }

}