<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>


<logic:present role="MANAGER">
	<h2><bean:message key="title.student.curriculum"
		bundle="APPLICATION_RESOURCES" /></h2>

	<fr:hasMessages for="student-number-bean" type="conversion">
		<ul class="nobullet list6">
			<fr:messages>
				<li><span class="error0"><fr:message /></span></li>
			</fr:messages>
		</ul>
	</fr:hasMessages>


	<fr:form action="/bolonhaTransitionManagement.do?method=chooseStudent">

		<fr:edit id="student-number-bean" name="studentNumberBean"
			schema="StudentNumberBean.edit">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle4 thlight thright mtop05" />
			</fr:layout>
		</fr:edit>

		<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit">
			<bean:message bundle="APPLICATION_RESOURCES" key="label.submit" />
		</html:submit>

	</fr:form>




</logic:present>