package net.sourceforge.fenixedu.presentationTier.Action.coordinator.candidacy.secondCycle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map.Entry;
import java.util.ResourceBundle;
import java.util.SortedSet;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sourceforge.fenixedu.domain.Coordinator;
import net.sourceforge.fenixedu.domain.Degree;
import net.sourceforge.fenixedu.domain.DegreeCurricularPlan;
import net.sourceforge.fenixedu.domain.ExecutionDegree;
import net.sourceforge.fenixedu.domain.ExecutionInterval;
import net.sourceforge.fenixedu.domain.ExecutionSemester;
import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.domain.candidacyProcess.CandidacyProcess;
import net.sourceforge.fenixedu.domain.candidacyProcess.IndividualCandidacyProcess;
import net.sourceforge.fenixedu.domain.candidacyProcess.secondCycle.SecondCycleCandidacyProcess;
import net.sourceforge.fenixedu.domain.candidacyProcess.secondCycle.SecondCycleIndividualCandidacyProcess;
import net.sourceforge.fenixedu.domain.period.SecondCycleCandidacyPeriod;
import net.sourceforge.fenixedu.injectionCode.AccessControl;
import net.sourceforge.fenixedu.presentationTier.Action.candidacy.CandidacyProcessDA;
import net.sourceforge.fenixedu.presentationTier.Action.masterDegree.coordinator.CoordinatedDegreeInfo;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pt.ist.fenixWebFramework.struts.annotations.Forward;
import pt.ist.fenixWebFramework.struts.annotations.Forwards;
import pt.ist.fenixWebFramework.struts.annotations.Mapping;
import pt.ist.fenixWebFramework.struts.annotations.Tile;
import pt.ist.fenixframework.pstm.AbstractDomainObject;
import pt.utl.ist.fenix.tools.util.excel.Spreadsheet;
import pt.utl.ist.fenix.tools.util.excel.Spreadsheet.Row;
import pt.utl.ist.fenix.tools.util.excel.SpreadsheetXLSExporter;
import pt.utl.ist.fenix.tools.util.i18n.Language;

@Mapping(path = "/caseHandlingSecondCycleCandidacyProcess", module = "coordinator",
        formBeanClass = SecondCycleCandidacyProcessDA.SecondCycleCandidacyProcessForm.class)
@Forwards({ @Forward(name = "intro", path = "/coordinator/candidacy/secondCycle/mainCandidacyProcess.jsp",
        tileProperties = @Tile(title = "private.coordinator.management.courses.applicationprocesses.2ndcycle")) })
public class SecondCycleCandidacyProcessDA extends CandidacyProcessDA {

    static public class SecondCycleCandidacyProcessForm extends CandidacyProcessForm {
        private String selectedProcessId;

        public String getSelectedProcessId() {
            return selectedProcessId;
        }

        public void setSelectedProcessId(String selectedProcessId) {
            this.selectedProcessId = selectedProcessId;
        }
    }

    @Override
    protected Class getProcessType() {
        return SecondCycleCandidacyProcess.class;
    }

    @Override
    protected Class getChildProcessType() {
        return SecondCycleIndividualCandidacyProcess.class;
    }

    @Override
    protected Class getCandidacyPeriodType() {
        return SecondCycleCandidacyPeriod.class;
    }

    @Override
    protected SecondCycleCandidacyProcess getProcess(HttpServletRequest request) {
        return (SecondCycleCandidacyProcess) super.getProcess(request);
    }

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        CoordinatedDegreeInfo.setCoordinatorContext(request);
        return super.execute(mapping, actionForm, request, response);
    }

    List<ExecutionInterval> readExecutionIntervalFilteredByCoordinatorTeam(final HttpServletRequest request) {
        final List<ExecutionInterval> returnExecutionIntervals = new ArrayList<ExecutionInterval>();

        final List<ExecutionInterval> executionIntervals =
                ExecutionInterval.readExecutionIntervalsWithCandidacyPeriod(getCandidacyPeriodType());

        DegreeCurricularPlan degreeCurricularPlan = getDegreeCurricularPlan(request);
        for (ExecutionInterval interval : executionIntervals) {
            final ExecutionYear executionYear =
                    (interval instanceof ExecutionYear) ? (ExecutionYear) interval : ((ExecutionSemester) interval)
                            .getExecutionYear();
            final ExecutionDegree executionDegree = degreeCurricularPlan.getExecutionDegreeByYear(executionYear);

            if (executionDegree == null) {
                continue;
            }

            for (Coordinator coordinator : executionDegree.getCoordinatorsList()) {
                if (coordinator.getPerson() == AccessControl.getPerson()) {
                    returnExecutionIntervals.add(interval);
                    break;
                }
            }
        }

        return returnExecutionIntervals;
    }

    @Override
    protected void setStartInformation(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) {
        if (!hasExecutionInterval(request)) {
            final List<ExecutionInterval> executionIntervals = readExecutionIntervalFilteredByCoordinatorTeam(request);
            request.setAttribute("executionIntervals", executionIntervals);

            if (executionIntervals.size() == 1) {
                final ExecutionInterval executionInterval = executionIntervals.get(0);
                final List<SecondCycleCandidacyProcess> candidacyProcesses = getCandidacyProcesses(executionInterval);

                if (candidacyProcesses.size() == 1) {
                    setCandidacyProcessInformation(request, candidacyProcesses.get(0));
                    setCandidacyProcessInformation(actionForm, getProcess(request));
                    request.setAttribute("candidacyProcesses", candidacyProcesses);
                    return;
                }
            }

            request.setAttribute("canCreateProcess", canCreateProcess(getProcessType().getName()));
            request.setAttribute("executionIntervals", executionIntervals);

        } else {
            final ExecutionInterval executionInterval = getExecutionInterval(request);
            final SecondCycleCandidacyProcess candidacyProcess = getCandidacyProcess(request, executionInterval);

            if (candidacyProcess != null) {
                setCandidacyProcessInformation(request, candidacyProcess);
                setCandidacyProcessInformation(actionForm, getProcess(request));
            } else {
                final List<SecondCycleCandidacyProcess> candidacyProcesses = getCandidacyProcesses(executionInterval);

                if (candidacyProcesses.size() == 1) {
                    setCandidacyProcessInformation(request, candidacyProcesses.get(0));
                    setCandidacyProcessInformation(actionForm, getProcess(request));
                    request.setAttribute("candidacyProcesses", candidacyProcesses);
                    return;
                }

                request.setAttribute("canCreateProcess", canCreateProcess(getProcessType().getName()));
                request.setAttribute("executionIntervals", readExecutionIntervalFilteredByCoordinatorTeam(request));
            }
            request.setAttribute("candidacyProcesses", getCandidacyProcesses(executionInterval));
        }
    }

    private List<ExecutionInterval> getExecutionIntervalsWithCandidacyPeriod() {
        return ExecutionInterval.readExecutionIntervalsWithCandidacyPeriod(getCandidacyPeriodType());
    }

    private List<SecondCycleCandidacyProcess> getCandidacyProcesses(final ExecutionInterval executionInterval) {
        final List<SecondCycleCandidacyProcess> result = new ArrayList<SecondCycleCandidacyProcess>();
        for (final SecondCycleCandidacyPeriod period : executionInterval.getSecondCycleCandidacyPeriods()) {
            result.add(period.getSecondCycleCandidacyProcess());
        }
        return result;
    }

    @Override
    public ActionForward listProcessAllowedActivities(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) {
        setCandidacyProcessInformation(request, getProcess(request));
        setCandidacyProcessInformation(form, getProcess(request));
        request.setAttribute("candidacyProcesses", getCandidacyProcesses(getProcess(request).getCandidacyExecutionInterval()));
        return introForward(mapping);
    }

    private void setCandidacyProcessInformation(final ActionForm actionForm, final SecondCycleCandidacyProcess process) {
        final SecondCycleCandidacyProcessForm form = (SecondCycleCandidacyProcessForm) actionForm;
        form.setSelectedProcessId(process.getExternalId());
        form.setExecutionIntervalId(process.getCandidacyExecutionInterval().getExternalId());
    }

    @Override
    protected ActionForward introForward(ActionMapping mapping) {
        return mapping.findForward("intro");
    }

    @Override
    protected SecondCycleCandidacyProcess getCandidacyProcess(final HttpServletRequest request,
            final ExecutionInterval executionInterval) {

        final String selectedProcessId = getStringFromRequest(request, "selectedProcessId");
        if (selectedProcessId != null) {
            for (final SecondCycleCandidacyPeriod candidacyPeriod : executionInterval.getSecondCycleCandidacyPeriods()) {
                if (candidacyPeriod.getSecondCycleCandidacyProcess().getExternalId().equals(selectedProcessId)) {
                    return candidacyPeriod.getSecondCycleCandidacyProcess();
                }
            }
        }
        return null;
    }

    public ActionForward prepareExecutePrintCandidacies(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment; filename=" + getReportFilename());

        final ServletOutputStream writer = response.getOutputStream();
        writeReport(getProcess(request), writer);
        writer.flush();
        response.flushBuffer();
        return null;
    }

    private void writeReport(final SecondCycleCandidacyProcess process, final ServletOutputStream writer) throws IOException {
        final List<Spreadsheet> spreadsheets = new ArrayList<Spreadsheet>();
        for (final Entry<Degree, SortedSet<SecondCycleIndividualCandidacyProcess>> entry : process
                .getValidSecondCycleIndividualCandidaciesByDegree().entrySet()) {
            spreadsheets.add(buildReport(entry.getKey(), entry.getValue()));
        }
        new SpreadsheetXLSExporter().exportToXLSSheets(writer, spreadsheets);
    }

    private Spreadsheet buildReport(final Degree degree, final SortedSet<SecondCycleIndividualCandidacyProcess> name) {
        final Spreadsheet spreadsheet = new Spreadsheet(degree.getSigla(), getHeader());

        for (final SecondCycleIndividualCandidacyProcess process : name) {
            final Row row = spreadsheet.addRow();
            row.setCell(process.getPersonalDetails().getName());
            row.setCell(process.getPrecedentDegreeInformation().getConclusionGrade());
            row.setCell(process.getCandidacyProfessionalExperience());
            row.setCell(process.getPrecedentDegreeInformation().getDegreeAndInstitutionName());
            row.setCell(process.getCandidacyAffinity());
            row.setCell(process.getCandidacyDegreeNature());
            row.setCell(process.getCandidacyGrade());
            row.setCell(process.getCandidacyInterviewGrade() != null ? process.getCandidacyInterviewGrade() : " ");
            row.setCell(process.getCandidacySeriesGrade());
            if (process.isCandidacyAccepted() || process.isCandidacyRejected()) {
                row.setCell(ResourceBundle.getBundle("resources/EnumerationResources", Language.getLocale()).getString(
                        process.getCandidacyState().getQualifiedName()));
            } else {
                row.setCell(" ");
            }
        }

        return spreadsheet;
    }

    private List<Object> getHeader() {
        final ResourceBundle bundle = ResourceBundle.getBundle("resources/ApplicationResources", Language.getLocale());
        final List<Object> result = new ArrayList<Object>();
        result.add(bundle.getString("label.name"));
        result.add(bundle.getString("label.candidacy.mfc"));
        result.add(bundle.getString("label.candidacy.professionalExperience"));
        result.add(bundle.getString("label.candidacy.degree.and.school"));
        result.add(bundle.getString("label.candidacy.affinity"));
        result.add(bundle.getString("label.candidacy.degreeNature"));
        result.add(bundle.getString("label.candidacy.grade"));
        result.add(bundle.getString("label.candidacy.interviewGrade"));
        result.add(bundle.getString("label.candidacy.seriesGrade"));
        result.add(bundle.getString("label.candidacy.result"));
        return result;
    }

    static public class SecondCycleCandidacyDegreeBean extends CandidacyDegreeBean {
        private String notes;

        public SecondCycleCandidacyDegreeBean(final SecondCycleIndividualCandidacyProcess process) {
            setPersonalDetails(process.getPersonalDetails());
            setDegree(process.getCandidacySelectedDegree());
            setState(process.getCandidacyState());
            setRegistrationCreated(process.hasRegistrationForCandidacy());
            setNotes(process.getCandidacyNotes());
        }

        public String getNotes() {
            return notes;
        }

        private void setNotes(String notes) {
            this.notes = notes;
        }
    }

    @Override
    protected List<CandidacyDegreeBean> createCandidacyDegreeBeans(HttpServletRequest request) {
        final SecondCycleCandidacyProcess process = getProcess(request);
        final List<CandidacyDegreeBean> candidacyDegreeBeans = new ArrayList<CandidacyDegreeBean>();
        for (final SecondCycleIndividualCandidacyProcess child : process.getAcceptedSecondCycleIndividualCandidacies()) {
            candidacyDegreeBeans.add(new SecondCycleCandidacyDegreeBean(child));
        }
        Collections.sort(candidacyDegreeBeans);
        return candidacyDegreeBeans;
    }

    @Override
    protected List<IndividualCandidacyProcess> getChildProcesses(final CandidacyProcess process, HttpServletRequest request) {
        List<IndividualCandidacyProcess> processes = process.getChildProcesses();
        List<IndividualCandidacyProcess> selectedDegreesIndividualCandidacyProcesses =
                new ArrayList<IndividualCandidacyProcess>();
        DegreeCurricularPlan degreeCurricularPlan = getDegreeCurricularPlan(request);

        for (IndividualCandidacyProcess child : processes) {
            if (((SecondCycleIndividualCandidacyProcess) child).getSelectedDegrees().contains(degreeCurricularPlan.getDegree())) {
                selectedDegreesIndividualCandidacyProcesses.add(child);
            }
        }

        return selectedDegreesIndividualCandidacyProcesses;
    }

    public DegreeCurricularPlan getDegreeCurricularPlan(HttpServletRequest request) {
        final String degreeCurricularPlanOID = CoordinatedDegreeInfo.findDegreeCurricularPlanID(request);
        request.setAttribute("degreeCurricularPlanID", degreeCurricularPlanOID);

        if (degreeCurricularPlanOID != null) {
            return AbstractDomainObject.fromExternalId(degreeCurricularPlanOID);
        }

        return null;
    }

    @Override
    protected Spreadsheet buildIndividualCandidacyReport(Spreadsheet spreadsheet,
            IndividualCandidacyProcess individualCandidacyProcess) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected void setCandidacyProcessInformation(final HttpServletRequest request, final CandidacyProcess process) {
        super.setCandidacyProcessInformation(request, process);
        request.setAttribute("executionIntervals", readExecutionIntervalFilteredByCoordinatorTeam(request));
    }

}
