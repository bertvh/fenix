package net.sourceforge.fenixedu.domain.accounting.postingRules.candidacy;

import java.util.Collections;
import java.util.List;

import net.sourceforge.fenixedu.dataTransferObject.accounting.EntryDTO;
import net.sourceforge.fenixedu.domain.accounting.EntryType;
import net.sourceforge.fenixedu.domain.accounting.Event;
import net.sourceforge.fenixedu.domain.accounting.EventType;
import net.sourceforge.fenixedu.domain.accounting.PaymentCodeType;
import net.sourceforge.fenixedu.domain.accounting.ServiceAgreementTemplate;
import net.sourceforge.fenixedu.domain.accounting.events.candidacy.SecondCycleIndividualCandidacyEvent;
import net.sourceforge.fenixedu.domain.candidacyProcess.secondCycle.SecondCycleIndividualCandidacy;
import net.sourceforge.fenixedu.util.Money;

import org.joda.time.DateTime;

public class SecondCycleIndividualCandidacyPR extends SecondCycleIndividualCandidacyPR_Base {

    protected SecondCycleIndividualCandidacyPR() {
        super();
    }

    public SecondCycleIndividualCandidacyPR(final DateTime startDate, final DateTime endDate,
            final ServiceAgreementTemplate serviceAgreementTemplate, final Money fixedAmount) {
        this();
        init(EntryType.SECOND_CYCLE_INDIVIDUAL_CANDIDACY_FEE, EventType.SECOND_CYCLE_INDIVIDUAL_CANDIDACY, startDate, endDate,
                serviceAgreementTemplate, fixedAmount);
    }

    @Override
    public SecondCycleIndividualCandidacyPR edit(final Money fixedAmount) {
        deactivate();
        return new SecondCycleIndividualCandidacyPR(new DateTime().minus(1000), null, getServiceAgreementTemplate(), fixedAmount);
    }

    @Override
    protected Money doCalculationForAmountToPay(Event event, DateTime when, boolean applyDiscount) {
        SecondCycleIndividualCandidacyEvent secondCycleEvent = (SecondCycleIndividualCandidacyEvent) event;
        return super.doCalculationForAmountToPay(event, when, applyDiscount).multiply(
                ((SecondCycleIndividualCandidacy) secondCycleEvent.getIndividualCandidacy()).getSelectedDegrees().size());
    }

    @Override
    protected Money subtractFromExemptions(Event event, DateTime when, boolean applyDiscount, Money amountToPay) {
        final SecondCycleIndividualCandidacyEvent candidacyEvent = (SecondCycleIndividualCandidacyEvent) event;

        if (candidacyEvent.hasSecondCycleIndividualCandidacyExemption()) {
            return Money.ZERO;
        }

        return amountToPay;
    }

    @Override
    public PaymentCodeType calculatePaymentCodeTypeFromEvent(Event event, DateTime when, boolean applyDiscount) {
        return PaymentCodeType.SECOND_CYCLE_INDIVIDUAL_CANDIDACY_PROCESS;
    }

    @Override
    public List<EntryDTO> calculateEntries(Event event, DateTime when) {
        final Money totalAmountToPay = calculateTotalAmountToPay(event, when);
        final Money payedAmount = event.getPayedAmount(when);
        return Collections.singletonList(new EntryDTO(getEntryType(), event, totalAmountToPay, payedAmount, totalAmountToPay,
                event.getDescriptionForEntryType(getEntryType()), totalAmountToPay.subtract(payedAmount)));
    }

    @Override
    protected void checkIfCanAddAmount(Money amountToPay, final Event event, final DateTime when) {
    }

}
