/*
 * Created on 13/Mar/2003
 *
 */
package net.sourceforge.fenixedu.presentationTier.Action.exceptions;

/**
 * @author Nuno Nunes (nmsn@rnl.ist.utl.pt)
 * @author Joana Mota (jccm@rnl.ist.utl.pt)
 */
public class InvalidPasswordActionException extends FenixActionException {

    // public static String key = "error.exception.invalid.existing.password";

    public InvalidPasswordActionException(Throwable cause) {
        super(cause.getMessage(), cause);
    }

    public InvalidPasswordActionException(Object value, Throwable cause) {
        super(cause.getMessage(), value, cause);
    }

    public InvalidPasswordActionException(Object[] values, Throwable cause) {
        super(cause.getMessage(), values, cause);
    }

    /*
     * public static String getKey() { return get; }
     */

    /*
     * public static void setKey(String key) {
     * InvalidPasswordActionException.key = key; }
     */

    @Override
    public String toString() {
        String result = "[InvalidPasswordActionException\n";
        result += "property: " + this.getProperty() + "\n";
        result += "error: " + this.getError() + "\n";
        result += "cause: " + this.getCause() + "\n";
        result += "]";
        return result;
    }

}