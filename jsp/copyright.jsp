<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/taglibs-datetime.tld" prefix="dt" %>
<p>
	Copyright <dt:format pattern="yyyy"><dt:currentTime/></dt:format>
	 - <bean:message key="institution.name" bundle="GLOBAL_RESOURCES"/>
	<img alt="" height="7" src="<%= request.getContextPath() %>/images/blue_square.gif" width="15" />
	<bean:message key="message.footer.help" bundle="GLOBAL_RESOURCES"/>:
	<bean:message key="institution.email.support" bundle="GLOBAL_RESOURCES"/>
</p>