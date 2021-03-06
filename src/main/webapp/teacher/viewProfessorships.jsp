<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ page import="net.sourceforge.fenixedu.presentationTier.Action.resourceAllocationManager.utils.PresentationConstants" %>
<tiles:insert definition="df.layout.two-column.teacher" beanName="" flush="true">
  <tiles:put name="executionCourseName" value="/teacher/executionCourseName.jsp" />
  <tiles:put name="navGeral" value="/teacher/commonNavGeralTeacher.jsp" />
  <tiles:put name="body" value="/teacher/viewProfessorships_bd.jsp" />
  <tiles:put name="navLocal" value="/teacher/professorshipnavbar.jsp" type="page"/>
  <tiles:put name="footer" value="/copyright.jsp" />
</tiles:insert>