package net.sourceforge.fenixedu.domain;

import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.space.AllocatableSpace;
import net.sourceforge.fenixedu.domain.student.Registration;

public class WrittenEvaluationEnrolment extends WrittenEvaluationEnrolment_Base {

    public WrittenEvaluationEnrolment() {
        super();
        setRootDomainObject(RootDomainObject.getInstance());
    }

    public WrittenEvaluationEnrolment(WrittenEvaluation writtenEvaluation, Registration registration) {
        this();
        this.setWrittenEvaluation(writtenEvaluation);
        this.setStudent(registration);
    }

    public WrittenEvaluationEnrolment(WrittenEvaluation writtenEvaluation, Registration registration, AllocatableSpace room) {
        this();
        this.setWrittenEvaluation(writtenEvaluation);
        this.setStudent(registration);
        this.setRoom(room);
    }

    public void delete() {
        if (this.getRoom() != null) {
            throw new DomainException("error.notAuthorizedUnEnrollment");
        }

        this.setWrittenEvaluation(null);
        this.setStudent(null);

        removeRootDomainObject();
        super.deleteDomainObject();
    }

    public boolean isForExecutionPeriod(final ExecutionSemester executionSemester) {
        for (final ExecutionCourse executionCourse : getWrittenEvaluation().getAssociatedExecutionCourses()) {
            if (executionCourse.getExecutionPeriod() == executionSemester) {
                return true;
            }
        }
        return false;
    }

}
