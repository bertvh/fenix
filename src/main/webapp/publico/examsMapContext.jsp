<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="net.sourceforge.fenixedu.presentationTier.Action.resourceAllocationManager.utils.PresentationConstants" %>
<bean:define id="component" name="siteView" property="component"/>
<bean:define id="exeDegree" name="component" property="infoExecutionDegree" />
<logic:present name="exeDegree"  >
	<bean:define id="infoDegree" name="exeDegree" property="infoDegreeCurricularPlan.infoDegree" />
	<jsp:getProperty name="infoDegree" property="degree.presentationName" />
	<br/>
	<bean:write name="<%= PresentationConstants.EXECUTION_PERIOD%>" property="name" scope="request"/>
</logic:present>