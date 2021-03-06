package net.sourceforge.fenixedu.domain.util.email;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.RootDomainObject;

public abstract class ReplyTo extends ReplyTo_Base {

    public static final Comparator<ReplyTo> COMPARATOR_BY_ADDRESS = new Comparator<ReplyTo>() {

        @Override
        public int compare(final ReplyTo replyTo1, final ReplyTo replyTo2) {
            return COMPARATOR_BY_ID.compare(replyTo1, replyTo2);
            // No longer possible because we need the current user to check
            // this...
            // return
            // replyTo1.getReplyToAddress().compareTo(replyTo2.getReplyToAddress());
        }

    };

    public ReplyTo() {
        super();
        setRootDomainObject(RootDomainObject.getInstance());
    }

    public void safeDelete() {
        for (final Message message : getMessagesSet()) {
            removeMessages(message);
        }
        if (getSender() == null) {
            delete();
        }
    }

    public void delete() {
        removeSender();
        removeRootDomainObject();
        deleteDomainObject();
    }

    public abstract String getReplyToAddress(final Person person);

    public abstract String getReplyToAddress();

    public Collection<? extends ReplyTo> asCollection() {
        return Collections.singletonList(this);
    }

}
