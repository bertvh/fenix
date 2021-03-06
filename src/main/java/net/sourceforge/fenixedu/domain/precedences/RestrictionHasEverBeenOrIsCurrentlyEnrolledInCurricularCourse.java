package net.sourceforge.fenixedu.domain.precedences;

import net.sourceforge.fenixedu.domain.CurricularCourse;
import net.sourceforge.fenixedu.domain.curriculum.CurricularCourseEnrollmentType;

/**
 * @author David Santos in Jun 9, 2004
 */

public class RestrictionHasEverBeenOrIsCurrentlyEnrolledInCurricularCourse extends
        RestrictionHasEverBeenOrIsCurrentlyEnrolledInCurricularCourse_Base {

    public RestrictionHasEverBeenOrIsCurrentlyEnrolledInCurricularCourse() {
        super();
    }

    public RestrictionHasEverBeenOrIsCurrentlyEnrolledInCurricularCourse(Integer number, Precedence precedence,
            CurricularCourse precedentCurricularCourse) {
        super();

        setPrecedence(precedence);
        setPrecedentCurricularCourse(precedentCurricularCourse);
    }

    @Override
    public CurricularCourseEnrollmentType evaluate(PrecedenceContext precedenceContext) {
        CurricularCourse curricularCourse = this.getPrecedentCurricularCourse();
        CurricularCourseEnrollmentType result1 = null;
        CurricularCourseEnrollmentType result2 = null;

        if (precedenceContext.getStudentCurricularPlan().isCurricularCourseEnrolled(curricularCourse)) {
            result1 = CurricularCourseEnrollmentType.DEFINITIVE;
        } else {
            result1 = CurricularCourseEnrollmentType.NOT_ALLOWED;
        }

        result2 = super.evaluate(precedenceContext);

        return result1.or(result2);
    }
}