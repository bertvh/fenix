<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="net.sourceforge.fenixedu.presentationTier.Action.resourceAllocationManager.utils.PresentationConstants" %>
<bean:define id="infoStudentCurricularPlan" name="<%= PresentationConstants.INFO_STUDENT_CURRICULAR_PLAN%>" />
<bean:define id="infoExecutionYear" name="<%= PresentationConstants.INFO_EXECUTION_YEAR %>" />
<bean:define id="certificateType" name="<%= PresentationConstants.CERTIFICATE_TYPE%>" />
tem <b><bean:write name="certificateType"/></b> no ano lectivo de <bean:write name="anoLectivo"/>, no curso de 
<bean:message name="infoStudentCurricularPlan" property="specialization.name" bundle="ENUMERATION_RESOURCES"/> em 
<bean:write name="infoStudentCurricularPlan"  property="infoDegreeCurricularPlan.infoDegree.nome"/> iniciado no ano lectivo de <bean:write name="initialExecutionYear"/>. 