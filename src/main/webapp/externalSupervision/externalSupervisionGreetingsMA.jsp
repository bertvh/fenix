<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<html:xhtml/>

<em><bean:message bundle="EXTERNAL_SUPERVISION_RESOURCES" key="externalSupervision"/></em>
<h2><bean:message bundle="EXTERNAL_SUPERVISION_RESOURCES" key="title.MA"/></h2>

<table>
	<tr>
		<td><p class="width400px"><br/><bean:message bundle="EXTERNAL_SUPERVISION_RESOURCES" key="greetings.MA"/></p></td>
		<td><img src="<%= request.getContextPath() + "/images/academia_militar1.gif" %>" class="width50pc"/></td>
	</tr>
</table>