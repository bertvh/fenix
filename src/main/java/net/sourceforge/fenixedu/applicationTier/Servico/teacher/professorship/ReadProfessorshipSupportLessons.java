/*
 * Created on Nov 23, 2003 by jpvl
 *  
 */
package net.sourceforge.fenixedu.applicationTier.Servico.teacher.professorship;

import java.util.ArrayList;
import java.util.List;

import net.sourceforge.fenixedu.applicationTier.Filtro.credits.CreditsServiceWithTeacherIdArgumentAuthorization;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.NotAuthorizedException;
import net.sourceforge.fenixedu.dataTransferObject.InfoProfessorship;
import net.sourceforge.fenixedu.dataTransferObject.teacher.professorship.InfoSupportLesson;
import net.sourceforge.fenixedu.dataTransferObject.teacher.professorship.ProfessorshipSupportLessonsDTO;
import net.sourceforge.fenixedu.domain.ExecutionCourse;
import net.sourceforge.fenixedu.domain.Professorship;
import net.sourceforge.fenixedu.domain.SupportLesson;
import net.sourceforge.fenixedu.domain.Teacher;
import pt.ist.fenixWebFramework.services.Service;
import pt.ist.fenixframework.pstm.AbstractDomainObject;

/**
 * @author jpvl
 */
public class ReadProfessorshipSupportLessons {

    protected ProfessorshipSupportLessonsDTO run(String teacherId, String executionCourseId) throws FenixServiceException {

        final ProfessorshipSupportLessonsDTO professorshipSupportLessonsDTO = new ProfessorshipSupportLessonsDTO();

        final Teacher teacher = AbstractDomainObject.fromExternalId(teacherId);
        final ExecutionCourse executionCourse = AbstractDomainObject.fromExternalId(executionCourseId);
        final Professorship professorship = (teacher != null) ? teacher.getProfessorshipByExecutionCourse(executionCourse) : null;

        professorshipSupportLessonsDTO.setInfoProfessorship(InfoProfessorship.newInfoFromDomain(professorship));

        final List<InfoSupportLesson> infoSupportLessons =
                new ArrayList<InfoSupportLesson>(professorship.getSupportLessonsCount());
        for (final SupportLesson supportLesson : professorship.getSupportLessonsSet()) {
            infoSupportLessons.add(InfoSupportLesson.newInfoFromDomain(supportLesson));
        }
        professorshipSupportLessonsDTO.setInfoSupportLessonList(infoSupportLessons);

        return professorshipSupportLessonsDTO;
    }

    // Service Invokers migrated from Berserk

    private static final ReadProfessorshipSupportLessons serviceInstance = new ReadProfessorshipSupportLessons();

    @Service
    public static ProfessorshipSupportLessonsDTO runReadProfessorshipSupportLessons(String teacherId, String executionCourseId)
            throws FenixServiceException, NotAuthorizedException {
        CreditsServiceWithTeacherIdArgumentAuthorization.instance.execute(teacherId);
        return serviceInstance.run(teacherId, executionCourseId);
    }

}