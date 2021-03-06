<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@page import="net.sourceforge.fenixedu.domain.phd.PhdIndividualProgramDocumentType"%><html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>


<bean:define id="individualProcessId" name="process" property="individualProgramProcess.externalId" />
<bean:define id="processId" name="process" property="externalId" />

<%-- ### Title #### --%>
<h2><bean:message key="label.phd.schedule.public.presentation.seminar.date" bundle="PHD_RESOURCES" /></h2>
<%-- ### End of Title ### --%>


<%--  ###  Return Links / Steps Information(for multistep forms)  ### --%>
<html:link action="<%= "/phdIndividualProgramProcess.do?method=viewProcess&processId=" + individualProcessId.toString() %>">
	<bean:message bundle="PHD_RESOURCES" key="label.back"/>
</html:link>
<br/><br/>
<%--  ### Return Links / Steps Information (for multistep forms)  ### --%>

<%--  ### Error Messages  ### --%>
<jsp:include page="/phd/errorsAndMessages.jsp" />
<%--  ### End of Error Messages  ### --%>


<%--  ### Context Information (e.g. Person Information, Registration Information)  ### --%>
<table>
  <tr style="vertical-align: top;">
    <td style="width: 55%">
    	<strong><bean:message  key="label.phd.process" bundle="PHD_RESOURCES"/></strong>
		<fr:view schema="PhdIndividualProgramProcess.view.simple" name="process" property="individualProgramProcess">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle2 thlight mtop15" />
			</fr:layout>
		</fr:view>
	</td>
    <td>
	    <strong><bean:message  key="label.phd.publicPresentationSeminarProcess" bundle="PHD_RESOURCES"/></strong>
		<fr:view schema="PublicPresentationSeminarProcess.view" name="process">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle2 thlight mtop15" />
			</fr:layout>
		</fr:view>
    </td>
  </tr>
</table>
<%--  ### End Of Context Information  ### --%>

<br/>

<%--  ### Operation Area (e.g. Create Candidacy)  ### --%>

<fr:form action="<%="/publicPresentationSeminarProcess.do?processId=" + processId.toString() %>">

	<input type="hidden" name="method" value="" />
	
	<fr:edit id="schedulePresentationDateBean" name="schedulePresentationDateBean" visible="false" />

  	<fr:edit id="schedulePresentationDateBean.generateAlert" name="schedulePresentationDateBean">
  		<fr:schema bundle="PHD_RESOURCES" type="net.sourceforge.fenixedu.domain.phd.seminar.PublicPresentationSeminarProcessBean">
  			<fr:slot name="generateAlert" layout="radio" />
  		</fr:schema>
		<fr:layout name="tabular-editable">
			<fr:property name="classes" value="tstyle5 thlight thright mtop05" />
			<fr:property name="columnClasses" value=",,tdclear tderror1" />
		</fr:layout>
  	</fr:edit>
	
	<fr:edit id="schedulePresentationDateBean"
		name="schedulePresentationDateBean"
		schema="PublicPresentationSeminarComissionDocumentBean.edit.presentationDate">
	
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle5 thlight thright mtop05" />
			<fr:property name="columnClasses" value=",,tdclear tderror1" />
		</fr:layout>
		
		<fr:destination name="invalid" path="<%="/publicPresentationSeminarProcess.do?method=prepareSchedulePresentationDateInvalid&processId=" + processId.toString() %>" />
	</fr:edit>
	
	<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit" onclick="this.form.method.value='schedulePresentationDate';"><bean:message bundle="PHD_RESOURCES" key="label.submit"/></html:submit>
	<html:cancel bundle="HTMLALT_RESOURCES" altKey="cancel.cancel" onclick="this.form.method.value='viewIndividualProgramProcess';"><bean:message bundle="PHD_RESOURCES" key="label.cancel"/></html:cancel>

</fr:form>

<%--  ### End of Operation Area  ### --%>



<%--  ### Buttons (e.g. Submit)  ### --%>

<%--  ### End of Buttons (e.g. Submit)  ### --%>
