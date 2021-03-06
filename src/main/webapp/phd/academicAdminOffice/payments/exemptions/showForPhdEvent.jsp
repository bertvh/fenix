<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<html:xhtml />

	<em><bean:message key="label.payments" bundle="ACADEMIC_OFFICE_RESOURCES"/></em>
	<h2><bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="label.payments.exemptions" /></h2>

	<logic:messagesPresent message="true">
		<ul class="nobullet list2">
			<html:messages id="messages" message="true" bundle="APPLICATION_RESOURCES">
				<li><span class="error0"><bean:write name="messages" /></span></li>
			</html:messages>
		</ul>
	</logic:messagesPresent>
	
	<p class="mtop15 mbottom05"><strong><bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="label.payments.person" /></strong></p>
	<fr:view name="person" schema="person.view-with-name-and-idDocumentType-and-documentIdNumber">
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle2 thlight thright mtop05" />
			<fr:property name="rowClasses" value="tdhl1,," />
		</fr:layout>
	</fr:view>
	
	<h3>
		<app:labelFormatter name="event" property="description">
			<app:property name="enum" value="ENUMERATION_RESOURCES"/>
			<app:property name="application" value="APPLICATION_RESOURCES"/>
		</app:labelFormatter>
	</h3>

	<bean:define id="personId" name="person" property="externalId" />
	<bean:define id="eventId" name="event" property="externalId" />
	<p class="mbottom05"><strong><bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="label.payments.exemptions"/></strong></p>

	<logic:notEmpty name="event" property="phdEventExemption">
	
		<bean:define id="phdEventExemption" name="event" property="phdEventExemption" />

		<fr:view name="phdEventExemption">

			<fr:schema bundle="PHD_RESOURCES" type="net.sourceforge.fenixedu.domain.phd.debts.PhdEventExemption">
				<fr:slot name="description" />
				<fr:slot name="value" />
				<fr:slot name="exemptionJustification.dispatchDate" key="label.net.sourceforge.fenixedu.domain.phd.debts.PhdEventExemption.exemptionJustification.dispatchDate"/>
				<fr:slot name="reason" />
			</fr:schema>
		
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle4 mtop05" />
			</fr:layout>
		</fr:view>

		<bean:define id="phdEventExemptionId" name="phdEventExemption" property="externalId" />
		<html:link action="<%="/exemptionsManagement.do?method=deleteExemption&amp;exemptionId=" + phdEventExemptionId %>">
			<bean:message bundle="ACADEMIC_OFFICE_RESOURCES"  key="label.delete"/>
		</html:link>
		
	</logic:notEmpty>

	<logic:empty name="event" property="phdEventExemption">
		<p>
			<em>
				<bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="label.payments.exemptions.noExemptions" />
			</em>
		</p>
		<p>
			<html:link action="<%="/exemptionsManagement.do?method=prepareCreatePhdEventExemption&amp;personId=" + personId + "&amp;eventId=" + eventId %>">
				<bean:message bundle="ACADEMIC_OFFICE_RESOURCES"  key="label.create"/>
			</html:link>
		</p>
	</logic:empty>

	<bean:define id="personId" name="person" property="externalId" />
	<fr:form action="<%="/exemptionsManagement.do?method=showEventsToApplyExemption&amp;personId=" + personId%>">
		<p class="mtop15">
			<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit">
				<bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="button.back" />
			</html:submit>
		</p>
	</fr:form>
