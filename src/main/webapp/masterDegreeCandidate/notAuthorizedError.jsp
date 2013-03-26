<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert definition="df.layout.two-column" beanName="" flush="true">
  <tiles:put name="title" value="Candidatos de Mestrado" />
  <tiles:put name="serviceName" value="Portal de Candidatos a Pós-Graduações" />
  <tiles:put name="navGeral" value="/commons/blank.jsp" />
  <tiles:put name="navGeral" value="/masterDegreeCandidate/commonNavGeralCandidate.jsp" />
  <tiles:put name="body-context" value="/commons/blank.jsp"/>  
  <tiles:put name="body" value="/masterDegreeCandidate/notAuthorizedError_bd.jsp" />
  <tiles:put name="footer" value="/copyright.jsp" />
</tiles:insert>