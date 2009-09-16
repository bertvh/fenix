package net.sourceforge.fenixedu.domain.accounting.postingRules.serviceRequests;

import java.util.Collections;
import java.util.List;
import java.util.Set;

import net.sourceforge.fenixedu.dataTransferObject.accounting.AccountingTransactionDetailDTO;
import net.sourceforge.fenixedu.dataTransferObject.accounting.EntryDTO;
import net.sourceforge.fenixedu.domain.User;
import net.sourceforge.fenixedu.domain.accounting.Account;
import net.sourceforge.fenixedu.domain.accounting.AccountingTransaction;
import net.sourceforge.fenixedu.domain.accounting.EntryType;
import net.sourceforge.fenixedu.domain.accounting.Event;
import net.sourceforge.fenixedu.domain.accounting.EventType;
import net.sourceforge.fenixedu.domain.accounting.ServiceAgreementTemplate;
import net.sourceforge.fenixedu.domain.accounting.events.serviceRequests.EquivalencePlanRequestEvent;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.exceptions.DomainExceptionWithLabelFormatter;
import net.sourceforge.fenixedu.util.Money;

import org.joda.time.DateTime;

import pt.ist.fenixWebFramework.security.accessControl.Checked;

public class EquivalencePlanRequestPR extends EquivalencePlanRequestPR_Base {

    private EquivalencePlanRequestPR() {
	super();
    }

    public EquivalencePlanRequestPR(final DateTime startDate, final DateTime endDate,
	    final ServiceAgreementTemplate serviceAgreementTemplate, final Money amountPerUnit) {
	this();
	super.init(EntryType.EQUIVALENCE_PLAN_REQUEST_FEE, EventType.EQUIVALENCE_PLAN_REQUEST, startDate, endDate,
		serviceAgreementTemplate);
	setAmountPerUnit(amountPerUnit);
    }

    @Override
    public List<EntryDTO> calculateEntries(Event event, DateTime when) {
	final Money calculateAmountToPay = event.calculateAmountToPay(when);
	return Collections.singletonList(new EntryDTO(getEntryType(), event, calculateTotalAmountToPay(event, when), event
		.getPayedAmount(), calculateAmountToPay, event.getDescriptionForEntryType(getEntryType()), calculateAmountToPay));
    }

    @Override
    public Money calculateTotalAmountToPay(final Event event, final DateTime when, boolean applyDiscount) {
	final EquivalencePlanRequestEvent planRequest = (EquivalencePlanRequestEvent) event;
	return getAmountPerUnit().multiply(planRequest.getNumberOfEquivalences().intValue());
    }

    @Override
    protected Set<AccountingTransaction> internalProcess(User user, List<EntryDTO> entryDTOs, Event event, Account fromAccount,
	    Account toAccount, AccountingTransactionDetailDTO transactionDetail) {

	if (entryDTOs.size() != 1) {
	    throw new DomainException(
		    "error.accounting.postingRules.gratuity.EquivalencePlanRequestPR.invalid.number.of.entryDTOs");
	}

	checkIfCanAddAmount(entryDTOs.get(0).getAmountToPay(), event, transactionDetail.getWhenRegistered());

	return Collections.singleton(makeAccountingTransaction(user, event, fromAccount, toAccount, getEntryType(), entryDTOs
		.get(0).getAmountToPay(), transactionDetail));
    }

    private void checkIfCanAddAmount(final Money amountToPay, final Event event, final DateTime whenRegistered) {
	final Money totalFinalAmount = event.getPayedAmount().add(amountToPay);

	if (totalFinalAmount.lessThan(calculateTotalAmountToPay(event, whenRegistered))) {
	    throw new DomainExceptionWithLabelFormatter(
		    "error.accounting.postingRules.gratuity.EquivalencePlanRequestPR.amount.being.payed.must.be.equal.to.amount.in.debt",
		    event.getDescriptionForEntryType(getEntryType()));
	}
    }

    @Checked("PostingRulePredicates.editPredicate")
    public EquivalencePlanRequestPR edit(final Money amountPerUnit) {
	deactivate();
	return new EquivalencePlanRequestPR(new DateTime().minus(1000), null, getServiceAgreementTemplate(), amountPerUnit);
    }
}