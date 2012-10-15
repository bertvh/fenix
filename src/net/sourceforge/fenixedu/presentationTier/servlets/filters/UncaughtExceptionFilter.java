package net.sourceforge.fenixedu.presentationTier.servlets.filters;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import net.kencochrane.sentry.RavenClient;
import net.kencochrane.sentry.RavenUtils;
import net.sourceforge.fenixedu._development.PropertiesManager;
import net.sourceforge.fenixedu.dataTransferObject.support.SupportRequestBean;
import net.sourceforge.fenixedu.domain.functionalities.AbstractFunctionalityContext;
import net.sourceforge.fenixedu.injectionCode.AccessControl;
import net.sourceforge.fenixedu.presentationTier.util.ExceptionInformation;
import pt.ist.fenixWebFramework.security.UserView;

public class UncaughtExceptionFilter implements Filter {
    private RavenClient sentry = null;

    @Override
    public void init(FilterConfig arg0) throws ServletException {
	String sentryUrl = PropertiesManager.getProperty("sentry.url");
	if (sentryUrl != null) {
	    System.out.println("Turning on Sentry: " + sentryUrl);
	    sentry = new RavenClient(sentryUrl);
	}
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) {

	try {

	    filterChain.doFilter(request, response);

	} catch (Throwable e) {
	    if (request.getAttribute("requestBean") == null) {

		SupportRequestBean requestBean = SupportRequestBean.generateExceptionBean(AccessControl.getPerson());

		if (AbstractFunctionalityContext.getCurrentContext((HttpServletRequest) request) != null) {
		    requestBean.setRequestContext(AbstractFunctionalityContext.getCurrentContext((HttpServletRequest) request)
			    .getSelectedTopLevelContainer());
		}
		request.setAttribute("requestBean", requestBean);
		request.setAttribute("exceptionInfo",
			ExceptionInformation.buildUncaughtExceptionInfo((HttpServletRequest) request, e));
	    }

	    if (sentry != null) {
		try {
		    String culprit = UserView.hasUser() ? UserView.getUser().getUsername() : null;
		    sentry.captureException("" + e.getMessage(), RavenUtils.getTimestampLong(), "root", 50, culprit, e);
		} catch (Throwable t) {
		    t.printStackTrace();
		}
	    }
	    e.printStackTrace();
	    throw new RuntimeException(e);
	}
    }
}
