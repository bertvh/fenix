<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@ page import="net.sourceforge.fenixedu.presentationTier.TagLib.sop.v3.TimeTableType" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<html:xhtml/>

<em><bean:message bundle="EXTERNAL_SUPERVISION_RESOURCES" key="externalSupervision"/></em>
<h2><bean:message bundle="EXTERNAL_SUPERVISION_RESOURCES" key="title.showTimetable.viewTimetable"/></h2>

<p>
	<html:link page="/viewStudent.do?method=showStats" paramId="personId" paramName="student" paramProperty="person.externalId">
		<bean:message key="link.back" bundle="EXTERNAL_SUPERVISION_RESOURCES"/>
	</html:link>
</p>

<%-- Person and Student short info --%>
<p class="mvert2">
	<span class="showpersonid">
	<bean:message key="label.student" bundle="ACADEMIC_OFFICE_RESOURCES"/>: 
		<fr:view name="student" schema="student.show.personAndStudentInformation.short">
			<fr:layout name="flow">
				<fr:property name="labelExcluded" value="true"/>
			</fr:layout>
		</fr:view>
	</span>
</p>

<bean:define id="infoLessons" name="infoLessons"/>
<div class="mtop15">
	<app:gerarHorario name="infoLessons" type="<%= TimeTableType.CLASS_TIMETABLE %>" application="<%= request.getContextPath() %>"/>
</div> 
