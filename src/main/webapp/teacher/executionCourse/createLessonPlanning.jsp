<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<%@ taglib uri="/WEB-INF/enum.tld" prefix="e"%>

<logic:present name="executionCourse">

	<logic:messagesPresent message="true">
		<p>
			<span class="error0"><!-- Error messages go here -->
				<html:messages id="message" message="true">
					<bean:write name="message"/>
				</html:messages>
			</span>
		</p>
	</logic:messagesPresent>
						
	<bean:define id="showLessonPlannings">/manageExecutionCourse.do?method=lessonPlannings&executionCourseID=<bean:write name="executionCourse" property="externalId"/></bean:define>	
	<bean:define id="createLessonPlanningPath">/manageExecutionCourse.do?method=createLessonPlanning&executionCourseID=<bean:write name="executionCourse" property="externalId"/></bean:define>	

	<logic:notEmpty name="lessonPlanningBean">
		<h2><bean:message key="link.create.lessonPlanning"/></h2>
		<fr:edit id="lessonPlanningBeanID" name="lessonPlanningBean" action="<%= createLessonPlanningPath %>" type="net.sourceforge.fenixedu.dataTransferObject.gesdis.CreateLessonPlanningBean" schema="CreateLessonPlanning">	
			<fr:destination name="cancel" path="<%= showLessonPlannings %>"/>
			<fr:layout name="tabular">
	    	    <fr:property name="classes" value="tstyle5 thtop thlight thright mbottom1"/>
	    	    <fr:property name="columnClasses" value=",,tderror1 tdclear"/>
			</fr:layout>
		</fr:edit>
	</logic:notEmpty>

	<logic:empty name="lessonPlanningBean">
		<h2><bean:message key="link.edit.lessonPlanning"/></h2>		
		<fr:edit id="lessonPlanningBeanID_" name="lessonPlanning" action="<%= showLessonPlannings %>" type="net.sourceforge.fenixedu.domain.LessonPlanning" schema="EditLessonPlanning">
			<fr:destination name="cancel" path="<%= showLessonPlannings %>"/>		
			
			<fr:layout name="tabular">
    		    <fr:property name="classes" value="thtop thlight thright mbottom1"/>
		    </fr:layout>
		</fr:edit>
	</logic:empty>

</logic:present>