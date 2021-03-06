<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>

<!-- createGraduationStandaloneGratuityPR.jsp -->

<h2><bean:message
	key="label.payments.postingRules.createGraduationGratuityPostingRule"
	bundle="MANAGER_RESOURCES" /></h2>

<br />

<logic:messagesPresent message="true">
	<ul class="nobullet list6">
		<html:messages id="messages" message="true"
			bundle="APPLICATION_RESOURCES">
			<li><span class="error0"><bean:write name="messages" /></span></li>
		</html:messages>
	</ul>
</logic:messagesPresent>



<fr:edit id="createPostingRuleBean" name="createPostingRuleBean"
	schema="CreateGratuityPostingRuleBean.edit"
	action="/postingRules.do?method=createGraduationGratuityPR">
	<fr:layout name="tabular">
		<fr:property name="classes" value="tstyle4 thlight thcenter mtop05" />
		<fr:destination name="invalid" path="/postingRules.do?method=prepareCreateGraduationGratuityPRInvalid" />
		<fr:destination name="cancel" path="/postingRules.do?method=manageGraduationRules"/>
		<fr:destination name="changeExecutionYearPostback" path="/postingRules.do?method=prepareCreateGraduationGratuityPRPostback"/>
	</fr:layout>
</fr:edit>


