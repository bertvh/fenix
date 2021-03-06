<%@page contentType="text/html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>
<html:xhtml/>

<html:messages id="message" message="true">
	<span class="error">
		<bean:write name="message" filter="false"/>
	</span>
</html:messages>


<logic:present name="departmentCreditsBean">

	<fr:form action="/managePersonFunctionsShared.do?method=showDepartmentPersonFunctions">
		<fr:edit id="departmentCreditsBean" name="departmentCreditsBean">
			<fr:schema bundle="TEACHER_CREDITS_SHEET_RESOURCES" type="net.sourceforge.fenixedu.domain.credits.util.DepartmentCreditsBean">
				<fr:slot name="department" key="label.department" layout="menu-select">
					<fr:property name="from" value="availableDepartments"/>
					<fr:property name="format" value="${name}"/>
				</fr:slot>
				<fr:slot name="executionSemester" key="label.execution-period" layout="menu-select" required="true">
					<fr:property name="providerClass" value="net.sourceforge.fenixedu.presentationTier.renderers.providers.ExecutionSemestersProvider" />
					<fr:property name="format" value="${executionYear.year} - ${semester}º semestre" />
					<fr:property name="nullOptionHidden" value="true" />
				</fr:slot>
			</fr:schema>
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle5 thlight mtop15" />
				<fr:property name="columnClasses" value=",,tdclear tderror1" />
			</fr:layout>
			<fr:destination name="cancel" path="/exportCredits.do?method=exportDepartmentPersonFunctions" />
		</fr:edit>
		<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit" styleClass="invisible"><bean:message key="label.view" bundle="TEACHER_CREDITS_SHEET_RESOURCES" /></html:submit>
		<html:cancel><bean:message key="label.export" bundle="APPLICATION_RESOURCES" /></html:cancel>
	</fr:form>
	<logic:notEmpty name="departmentCreditsBean" property="departmentPersonFunctions">
		<bean:define id="canShowCredits" value="false" type="java.lang.String"/>
		<logic:present name="canViewCredits">
			<bean:define id="canShowCredits" name="canViewCredits" type="java.lang.String"/>
		</logic:present>
		<table class="tstyle2 thlight thleft mtop05 mbottom05">
			<tr>
				<th><bean:message key="label.teacher.id" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				<th><bean:message key="label.name" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				<th><bean:message key="label.managementPosition.position" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				<th><bean:message key="label.managementPosition.unit" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				<th><bean:message key="label.beginDate" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				<th><bean:message key="label.endDate" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				<logic:equal name="canShowCredits" value="true">
					<th><bean:message key="label.percentage" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
					<th><bean:message key="label.managementPosition.credits" bundle="TEACHER_CREDITS_SHEET_RESOURCES"/></th>
				</logic:equal>
			</tr>
			<logic:iterate id="personFunction" name="departmentCreditsBean" property="departmentPersonFunctions">
				<tr>
					<td><bean:write name="personFunction" property="person.username"/></td>
					<td><bean:write name="personFunction" property="person.name"/></td>
					<td><bean:write name="personFunction" property="function.name"/></td>
					<td><bean:write name="personFunction" property="function.unit.presentationName"/></td>
					<td><bean:write name="personFunction" property="beginDate"/></td>
					<td><bean:write name="personFunction" property="endDate"/></td>
					<logic:equal name="canShowCredits" value="true">
						<% if(personFunction instanceof net.sourceforge.fenixedu.domain.organizationalStructure.PersonFunctionShared){ %>
							<td align="center"><bean:write name="personFunction" property="percentage"/></td>
						<% } else { %>
							<td align="center">-</td>
						<% }%>
						<%-- --%>
						<td><bean:write name="personFunction" property="credits"/></td>
					</logic:equal>
					<logic:notEqual name="canShowCredits" value="true">
						<td/><td/>
					</logic:notEqual>
				</tr>
			</logic:iterate>
		</table>
	</logic:notEmpty>
</logic:present>