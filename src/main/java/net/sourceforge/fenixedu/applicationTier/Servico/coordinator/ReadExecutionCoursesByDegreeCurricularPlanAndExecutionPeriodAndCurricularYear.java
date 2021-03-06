/*
 * Created on Oct 20, 2005
 *  by jdnf
 */
package net.sourceforge.fenixedu.applicationTier.Servico.coordinator;

import java.util.ArrayList;
import java.util.List;

import net.sourceforge.fenixedu.applicationTier.Filtro.ResourceAllocationManagerAuthorizationFilter;
import net.sourceforge.fenixedu.applicationTier.Filtro.coordinator.DegreeCurricularPlanAuthorizationFilter;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.NotAuthorizedException;
import net.sourceforge.fenixedu.domain.CurricularCourse;
import net.sourceforge.fenixedu.domain.CurricularYear;
import net.sourceforge.fenixedu.domain.DegreeCurricularPlan;
import net.sourceforge.fenixedu.domain.ExecutionCourse;
import net.sourceforge.fenixedu.domain.ExecutionSemester;
import pt.ist.fenixWebFramework.services.Service;
import pt.ist.fenixframework.pstm.AbstractDomainObject;

public class ReadExecutionCoursesByDegreeCurricularPlanAndExecutionPeriodAndCurricularYear {

    public List<ExecutionCourse> run(String degreeCurricularPlanID, String executionPeriodID, String curricularYearID)
            throws FenixServiceException {

        final ExecutionSemester executionSemester = AbstractDomainObject.fromExternalId(executionPeriodID);
        if (executionSemester == null) {
            throw new FenixServiceException("error.no.executionPeriod");
        }

        final DegreeCurricularPlan degreeCurricularPlan = AbstractDomainObject.fromExternalId(degreeCurricularPlanID);
        if (degreeCurricularPlan == null) {
            throw new FenixServiceException("error.coordinator.noDegreeCurricularPlan");
        }

        CurricularYear curricularYear = null;
        if (curricularYearID != null) {
            curricularYear = AbstractDomainObject.fromExternalId(curricularYearID);
            if (curricularYear == null) {
                throw new FenixServiceException("error.no.curYear");
            }
        }

        final List<ExecutionCourse> result = new ArrayList<ExecutionCourse>();
        for (final ExecutionCourse executionCourse : executionSemester.getAssociatedExecutionCourses()) {
            if (belongToDegreeCurricularPlanAndCurricularYear(executionCourse, degreeCurricularPlan, curricularYear)) {
                result.add(executionCourse);
            }
        }
        return result;
    }

    private boolean belongToDegreeCurricularPlanAndCurricularYear(final ExecutionCourse executionCourse,
            final DegreeCurricularPlan degreeCurricularPlan, final CurricularYear curricularYear) {

        for (final CurricularCourse curricularCourse : executionCourse.getAssociatedCurricularCourses()) {
            if (curricularCourse.hasScopeInGivenSemesterAndCurricularYearInDCP(curricularYear, degreeCurricularPlan,
                    executionCourse.getExecutionPeriod())) {
                return true;
            }
        }
        return false;
    }

    // Service Invokers migrated from Berserk

    private static final ReadExecutionCoursesByDegreeCurricularPlanAndExecutionPeriodAndCurricularYear serviceInstance =
            new ReadExecutionCoursesByDegreeCurricularPlanAndExecutionPeriodAndCurricularYear();

    @Service
    public static List<ExecutionCourse> runReadExecutionCoursesByDegreeCurricularPlanAndExecutionPeriodAndCurricularYear(
            String degreeCurricularPlanID, String executionPeriodID, String curricularYearID) throws FenixServiceException,
            NotAuthorizedException {
        try {
            DegreeCurricularPlanAuthorizationFilter.instance.execute(degreeCurricularPlanID);
            return serviceInstance.run(degreeCurricularPlanID, executionPeriodID, curricularYearID);
        } catch (NotAuthorizedException ex1) {
            try {
                ResourceAllocationManagerAuthorizationFilter.instance.execute();
                return serviceInstance.run(degreeCurricularPlanID, executionPeriodID, curricularYearID);
            } catch (NotAuthorizedException ex2) {
                throw ex2;
            }
        }
    }

}