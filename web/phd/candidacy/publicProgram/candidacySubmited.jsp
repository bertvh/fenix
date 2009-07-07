<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<html:xhtml/>

<%-- ### Title #### --%>
<div class="breadcumbs">
	<a href="http://www.ist.utl.pt">IST</a> &gt;
	<a href="http://www.ist.utl.pt/en/html/ist-epfl/">IST-EPFL</a> &gt;
	<bean:message key="title.submit.application" bundle="CANDIDATE_RESOURCES"/>
</div>

<h1><bean:message key="label.phd.public.candidacy" bundle="PHD_RESOURCES" /></h1>

<p><span class="success0"><bean:message key="message.application.submited.success" bundle="PHD_RESOURCES"/>.</span></p>

<%-- Add information about candidacy period --%>

<bean:define id="maximumDaysToEditCandidacy" name="maximumDaysToEditCandidacy" />
<p><em><bean:message key="message.application.submited.success2" arg0="<%= maximumDaysToEditCandidacy.toString() %>" bundle="PHD_RESOURCES"/></em></p>

<p><bean:message key="message.ist.conditions.note" bundle="CANDIDATE_RESOURCES"/></p>