<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>	
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<logic:present name="infoSiteStudentTestFeedback">
	<center><h2><bean:message key="message.studentTest.sent"/></h2></center>
	<bean:define id="responseNumber" name="infoSiteStudentTestFeedback" property="responseNumber"/>
	<bean:define id="notResponseNumber" name="infoSiteStudentTestFeedback" property="notResponseNumber"/>
	<bean:define id="errors" name="infoSiteStudentTestFeedback" property="errors"/>
	<div class="infoop2">
		<bean:message key="message.exportChecksumReport"/>
	</div>
	<table>
		<tr>
			<td><b><bean:message key="label.student.name"/></b></td>
			<td><bean:write name="infoSiteStudentTestFeedback" property="studentTestLog.student.person.name"/></td>
		</tr>
		<tr>
			<td><b><bean:message key="label.numberWord"/></b></td>
			<td><bean:write name="infoSiteStudentTestFeedback" property="studentTestLog.student.number"/></td>
		</tr>
		<tr>
			<td><b><bean:message key="label.distributedTest"/></b></td>
			<td><bean:write name="infoSiteStudentTestFeedback" property="studentTestLog.distributedTest.title"/>
			(<bean:write name="infoSiteStudentTestFeedback" property="studentTestLog.distributedTest.externalId"/>)</td>
		</tr>
		<tr>
			<td><b><bean:message key="label.thesis.file.name.uploadTime"/></b></td>
			<td><bean:write name="infoSiteStudentTestFeedback" property="studentTestLog.dateFormatted"/></td>
		</tr>
		<tr>
			<td><b><bean:message key="label.validationCode"/></b></td>
			<td><bean:write name="infoSiteStudentTestFeedback" property="studentTestLog.checksum"/></td>
		</tr>
		<tr>
			<td><b><bean:message key="message.studentQuestionsAnsweredNumber"/></b></td>
			<td><bean:write name="responseNumber"/></td>
		</tr>
		<tr>
			<td><b><bean:message key="message.studentQuestionsNotAnsweredNumber"/></b></td>
			<td><bean:write name="notResponseNumber"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<bean:define id="logId" name="infoSiteStudentTestFeedback" property="studentTestLog.externalId"/>
				<html:link page="<%="/studentTests.do?method=exportChecksum&logId="+logId.toString()%>">
					<bean:message key="message.studentTestLog.checksumReport" />
				</html:link>
			</td>
		</tr>
		<logic:iterate id="error" name="errors">
			<tr><td><span class="error"><!-- Error messages go here --><bean:write name="error"/></span></td></tr>
		</logic:iterate>
	</table>
	
	<html:form action="/studentTests">
	<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.method" property="method" value="testsFirstPage"/>
	<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.objectCode" property="objectCode" value="<%=(pageContext.findAttribute("objectCode")).toString()%>"/>
	<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.testCode" property="testCode" value="<%=(pageContext.findAttribute("testCode")).toString()%>"/>
	<logic:notEmpty name="infoSiteStudentTestFeedback" property="studentTestQuestionList">
		<bean:define id="studentTestQuestionList" name="infoSiteStudentTestFeedback" property="studentTestQuestionList"/>
		<logic:iterate id="testQuestion" name="studentTestQuestionList" type="net.sourceforge.fenixedu.domain.onlineTests.StudentTestQuestion"/>
		<bean:define id="distributedTest" name="testQuestion" property="distributedTest" type="net.sourceforge.fenixedu.domain.onlineTests.DistributedTest"/>
		<bean:define id="testCode" value="<%=(pageContext.findAttribute("testCode")).toString()%>"/>
		<br/>
		<br/>
		<center>
			<h2><bean:write name="distributedTest" property="title"/></h2>
			<b><bean:write name="distributedTest" property="testInformation"/></b>	
		</center>
		<%request.setAttribute("studentTestQuestionList", studentTestQuestionList);%>
		<jsp:include page="showStudentTest_bd.jsp">
			<jsp:param name="pageType" value="feedback"/>
			<jsp:param name="testCode" value="<%=testCode%>"/>
	 	</jsp:include>
	</logic:notEmpty>
	<center>
		<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit" styleClass="inputbutton"><bean:message key="button.back"/></html:submit>
	</center>
	</html:form>
</logic:present>
<logic:notPresent name="infoSiteStudentTestFeedback">
	<center><h2><bean:message key="message.studentTest.notSent"/></h2></center>
</logic:notPresent>