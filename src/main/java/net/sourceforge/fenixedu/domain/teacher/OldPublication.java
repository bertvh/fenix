/*
 * Created on 22/Nov/2003
 *
 */
package net.sourceforge.fenixedu.domain.teacher;

import net.sourceforge.fenixedu.dataTransferObject.teacher.InfoOldPublication;
import net.sourceforge.fenixedu.domain.RootDomainObject;
import net.sourceforge.fenixedu.domain.Teacher;

/**
 * @author Leonor Almeida
 * @author Sergio Montelobo
 * 
 */
public class OldPublication extends OldPublication_Base {

    public OldPublication() {
        super();
        setRootDomainObject(RootDomainObject.getInstance());
    }

    public void delete() {
        removeTeacher();
        removeRootDomainObject();
        super.deleteDomainObject();
    }

    public void edit(InfoOldPublication infoOldPublication, Teacher teacher) {

        if ((infoOldPublication == null) || (teacher == null)) {
            throw new NullPointerException();
        }

        this.setLastModificationDate(infoOldPublication.getLastModificationDate());
        this.setOldPublicationType(infoOldPublication.getOldPublicationType());
        this.setPublication(infoOldPublication.getPublication());
        this.setTeacher(teacher);

    }

    @Deprecated
    public java.util.Date getLastModificationDate() {
        org.joda.time.DateTime dt = getLastModificationDateDateTime();
        return (dt == null) ? null : new java.util.Date(dt.getMillis());
    }

    @Deprecated
    public void setLastModificationDate(java.util.Date date) {
        if (date == null) {
            setLastModificationDateDateTime(null);
        } else {
            setLastModificationDateDateTime(new org.joda.time.DateTime(date.getTime()));
        }
    }

}
