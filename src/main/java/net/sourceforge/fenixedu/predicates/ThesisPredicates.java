package net.sourceforge.fenixedu.predicates;

import net.sourceforge.fenixedu.domain.DegreeCurricularPlan;
import net.sourceforge.fenixedu.domain.Enrolment;
import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.accessControl.academicAdministration.AcademicAuthorizationGroup;
import net.sourceforge.fenixedu.domain.accessControl.academicAdministration.AcademicOperationType;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.domain.thesis.Thesis;
import net.sourceforge.fenixedu.injectionCode.AccessControl;
import net.sourceforge.fenixedu.injectionCode.AccessControlPredicate;

public class ThesisPredicates {

    public static final AccessControlPredicate<Thesis> waitingConfirmation = new AccessControlPredicate<Thesis>() {

        @Override
        public boolean evaluate(Thesis thesis) {
            return thesis.isWaitingConfirmation() || isScientificCouncil.evaluate(thesis);
        }

    };

    public static final AccessControlPredicate<Thesis> isScientificCouncil = new AccessControlPredicate<Thesis>() {

        @Override
        public boolean evaluate(Thesis thesis) {
            return AccessControl.getPerson().hasRole(RoleType.SCIENTIFIC_COUNCIL);
        }

    };

    public static final AccessControlPredicate<Thesis> isScientificCouncilOrCoordinatorAndNotOrientatorOrCoorientator =
            new AccessControlPredicate<Thesis>() {

                @Override
                public boolean evaluate(Thesis thesis) {
                    return isScientificCouncil.evaluate(thesis) || thesis.isCoordinatorAndNotOrientator();
                }

            };

    public static final AccessControlPredicate<Thesis> student = new AccessControlPredicate<Thesis>() {

        @Override
        public boolean evaluate(Thesis thesis) {
            Person person = AccessControl.getPerson();

            return person.getStudent() == thesis.getStudent() && thesis.isWaitingConfirmation();
        }

    };

    public static final AccessControlPredicate<Thesis> studentOrAcademicAdministrativeOfficeOrScientificCouncil =
            new AccessControlPredicate<Thesis>() {

                @Override
                public boolean evaluate(Thesis thesis) {
                    Person person = AccessControl.getPerson();
                    return (person.getStudent() == thesis.getStudent() && thesis.isWaitingConfirmation())
                            || (AcademicAuthorizationGroup.getProgramsForOperation(person,
                                    AcademicOperationType.MANAGE_MARKSHEETS).contains(thesis.getDegree()))
                            || person.hasRole(RoleType.SCIENTIFIC_COUNCIL);
                }

            };

    public static final AccessControlPredicate<Thesis> isScientificCommission = new AccessControlPredicate<Thesis>() {

        @Override
        public boolean evaluate(final Thesis thesis) {
            final Enrolment enrolment = thesis.getEnrolment();
            final ExecutionYear executionYear = enrolment.getExecutionYear();
            final DegreeCurricularPlan degreeCurricularPlan = enrolment.getDegreeCurricularPlanOfDegreeModule();
            return degreeCurricularPlan.isScientificCommissionMember(executionYear);
        }

    };

    public static final AccessControlPredicate<Thesis> isScientificCommissionOrScientificCouncil =
            new AccessControlPredicate<Thesis>() {

                @Override
                public boolean evaluate(final Thesis thesis) {
                    return isScientificCommission.evaluate(thesis) || isScientificCouncil.evaluate(thesis);
                }

            };

}
