<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<tiles:insert definition="df.layout.two-column.posGrad" beanName="" flush="true">
  <tiles:put name="title" value="Secretaria de Pós-Graduação187" />
  <tiles:put name="serviceName" value="Secretaria de Pós-Graduação" />
  <tiles:put name="navLocal" value="/masterDegreeAdministrativeOffice/thesis/thesisMenu.jsp"  />
  <tiles:put name="navGeral" value="/masterDegreeAdministrativeOffice/commonNavGeralPosGraduacao.jsp" />
  <tiles:put name="body-context" value="/commons/blank.jsp"/>  
  <tiles:put name="body" value="/masterDegreeAdministrativeOffice/thesis/visualizeMasterDegreeProof_bd.jsp" />
  <tiles:put name="footer" value="/copyright.jsp" />
</tiles:insert>
