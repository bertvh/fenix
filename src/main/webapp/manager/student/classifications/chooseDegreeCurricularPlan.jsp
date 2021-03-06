<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<html:form action="/createClassificationsForStudents">
	<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.method" property="method" value="createClassifications"/>
	
	<h2><bean:message key="label.manager.limits" bundle="MANAGER_RESOURCES"  /></h2>
	
	<table>
		<tr>
			<td><bean:message key="label.manager.entryGradeLimits" bundle="MANAGER_RESOURCES"  />:</td>
			<td>
				<logic:iterate id="entryGradeLimit" name="createClassificationsForm" property="entryGradeLimits" indexId="i" >	
					<logic:notEqual name="i" value="0"> , </logic:notEqual>
					<html:text bundle="HTMLALT_RESOURCES" altKey="text.entryGradeLimits" property="entryGradeLimits" value='<%= entryGradeLimit.toString() %>' size="4" />%
				</logic:iterate>
			<td>
		</tr>
		<tr>
			<td><bean:message key="label.manager.approvationRatioLimits" bundle="MANAGER_RESOURCES"  />:</td>
			<td>
				<logic:iterate id="approvationRatioLimit" name="createClassificationsForm" property="approvationRatioLimits" indexId="i" >	
					<logic:notEqual name="i" value="0"> , </logic:notEqual>
					<html:text bundle="HTMLALT_RESOURCES" altKey="text.approvationRatioLimits" property="approvationRatioLimits" value='<%= approvationRatioLimit.toString() %>' size="4" />%
				</logic:iterate>
			</td>
		</tr>
		<tr>
			<td><bean:message key="label.manager.arithmeticMeanLimits" bundle="MANAGER_RESOURCES"  />:</td>
			<td>
				<logic:iterate id="arithmeticMeanLimit" name="createClassificationsForm" property="arithmeticMeanLimits" indexId="i" >	
					<logic:notEqual name="i" value="0"> , </logic:notEqual>
					<html:text bundle="HTMLALT_RESOURCES" altKey="text.arithmeticMeanLimits" property="arithmeticMeanLimits" value='<%= arithmeticMeanLimit.toString() %>' size="4" />%
				</logic:iterate>	
			</td>
		</tr>
	</table>
	
	<br/><br/>
	<h2><bean:message key="label.manager.degreeCurricularPlans" bundle="MANAGER_RESOURCES"  /></h2>
		
	<logic:present name="degreeCurricularPlans">
		<table>
			<logic:iterate id="degreeCurricularPlan" name="degreeCurricularPlans">
				<logic:equal name="degreeCurricularPlan" property="infoDegree.degreeType.name" value="DEGREE" >
					<tr>
						<td><html:radio bundle="HTMLALT_RESOURCES" altKey="radio.degreeCurricularPlanID" property="degreeCurricularPlanID" idName="degreeCurricularPlan" value="externalId" /></td>
						<td><bean:write name="degreeCurricularPlan" property="name" /></td>
						<td><bean:write name="degreeCurricularPlan" property="infoDegree.nome" /></td>
					</tr>
				</logic:equal>
			</logic:iterate>
		</table>
		<p/>
		<html:submit>
			<bean:message key="button.createClassifications" bundle="MANAGER_RESOURCES"  />
		</html:submit>
	</logic:present>
	
</html:form>
