<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<html:xhtml/>

<em><bean:message key="label.candidacies" bundle="APPLICATION_RESOURCES"/></em>
<h2><bean:write name="process" property="displayName" /></h2>

<html:messages id="message" message="true" bundle="APPLICATION_RESOURCES">
	<span class="error0"> <bean:write name="message" /> </span>
	<br />
</html:messages>
<h3 class="mtop15 mbottom025">Escolher Curso</h3>
<bean:define id="processId" name="process" property="externalId" />
<fr:form action='<%="/caseHandlingSecondCycleIndividualCandidacyProcess.do?processId=" + processId.toString() %>'>
	<html:hidden property="method" value="prepareExecuteIntroduceCandidacyResult" />
	<fr:edit name="secondCycleIndividualCandidacyResultBean">
	<fr:schema type="net.sourceforge.fenixedu.domain.candidacyProcess.secondCycle.SecondCycleIndividualCandidacyResultBean" bundle="APPLICATION_RESOURCES">
		<fr:slot name="degree" layout="menu-select-postback" >
			<fr:property name="from" value="degrees"></fr:property>
			<fr:property name="format" value="${name}" />
		</fr:slot>
	</fr:schema>
	<fr:layout name="tabular-editable">
				<fr:property name="classes" value="tstyle4 thlight thright mtop025"/>
		        <fr:property name="columnClasses" value="width12em,,tdclear tderror1"/>
	</fr:layout>
	</fr:edit>
</fr:form>

<logic:present name="secondCycleIndividualCandidacyResultBean" property="degree">
<fr:form action='<%="/caseHandlingSecondCycleIndividualCandidacyProcess.do?processId=" + processId.toString() %>'>
 	<html:hidden property="method" value="executeIntroduceCandidacyResult" />

	<fr:edit id="secondCycleIndividualCandidacyResultBean" name="secondCycleIndividualCandidacyResultBean" visible="false" />

	<logic:notEmpty name="secondCycleIndividualCandidacyResultBean" property="candidacyProcess">
		<h3 class="mtop15 mbottom025">Resultados de Seriação</h3>
		<fr:edit id="secondCycleIndividualCandidacyResultBean.manage"
			name="secondCycleIndividualCandidacyResultBean"
			schema="SecondCycleIndividualCandidacyResultBean.introduce.result.coordinator">
			<fr:layout name="tabular-editable">
				<fr:property name="classes" value="tstyle4 thlight thright mtop025"/>
		        <fr:property name="columnClasses" value="width12em,,tdclear tderror1"/>
			</fr:layout>
			<fr:destination name="invalid" path='<%= "/caseHandlingSecondCycleIndividualCandidacyProcess.do?method=executeIntroduceCandidacyResultInvalid&amp;processId=" + processId.toString() %>' />
		</fr:edit>
		
		<html:submit><bean:message key="label.submit" bundle="APPLICATION_RESOURCES" /></html:submit>
	</logic:notEmpty>
	<html:cancel onclick="this.form.method.value='listProcessAllowedActivities';return true;"><bean:message key="label.back" bundle="APPLICATION_RESOURCES" /></html:cancel>
	
</fr:form>
</logic:present>
