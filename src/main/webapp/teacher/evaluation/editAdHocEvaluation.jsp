<%@ taglib uri="/WEB-INF/jsf_core.tld" prefix="f"%>
<%@ taglib uri="/WEB-INF/jsf_tiles.tld" prefix="ft"%>
<%@ taglib uri="/WEB-INF/html_basic.tld" prefix="h"%>

<ft:tilesView definition="df.teacher.evaluation-management" attributeName="body-inline">
	<f:loadBundle basename="resources/HtmlAltResources" var="htmlAltBundle"/>

	<f:loadBundle basename="resources/ApplicationResources" var="bundle"/>
	
		<h:form>
			<h:inputHidden binding="#{adHocEvaluationManagementBackingBean.executionCourseIdHidden}" />

			<h:outputText value="<em>#{bundle['message.evaluationElements']}</em>" escape="false" />
			<h:outputFormat value="<h2>#{bundle['link.edit.adHocEvaluation']}</h2/>" escape="false"/>
			<%-- ERROR MESSAGE --%>
			<h:outputText styleClass="error" rendered="#{!empty adHocEvaluationManagementBackingBean.errorMessage}"
				value="#{bundle[adHocEvaluationManagementBackingBean.errorMessage]}<br/>" escape="false" />
			
			<h:panelGrid columns="2" styleClass="tstyle5" columnClasses="aright,,"  rowClasses=",,,valigntop">
				<h:panelGroup>
					<h:outputText value="* " style="color: red"/>
					<h:outputText value="#{bundle['label.net.sourceforge.fenixedu.domain.AdHocEvaluation.name']}: " />
				</h:panelGroup>	
				<h:panelGroup>
					<h:inputText alt="#{htmlAltBundle['inputText.name']}" id="name" required="true" maxlength="100" size="35" value="#{adHocEvaluationManagementBackingBean.name}" />			
					<h:message for="name" styleClass="error"/>
				</h:panelGroup>
				<h:panelGroup>
					<h:outputText value="* " style="color: #c00"/>
					<h:outputText value="#{bundle['label.net.sourceforge.fenixedu.domain.AdHocEvaluation.gradeScale']}:" escape="false"/>
				</h:panelGroup>
				<h:selectOneMenu value="#{adHocEvaluationManagementBackingBean.gradeScale}">
					<f:selectItems value="#{adHocEvaluationManagementBackingBean.gradeScaleOptions}"/>
				</h:selectOneMenu>
				<h:outputText value="#{bundle['label.net.sourceforge.fenixedu.domain.AdHocEvaluation.description']}: " />
				<h:inputTextarea rows="4" cols="40" value="#{adHocEvaluationManagementBackingBean.description}" />
			</h:panelGrid>			

			<h:outputText value="* " style="color: red" escape="false"/>
			<h:outputText value="#{bundle['label.neededFields']}"/>

			<h:outputText value="<br/><br/>" escape="false" />			
			<h:inputHidden id="adHocEvaluationID" value="#{adHocEvaluationManagementBackingBean.adHocEvaluationID}" />
			<h:commandButton alt="#{htmlAltBundle['commandButton.submit']}"  action="#{adHocEvaluationManagementBackingBean.editAdHocEvaluation}"
				styleClass="inputbutton" value="#{bundle['button.submit']}" />
			<h:commandButton alt="#{htmlAltBundle['commandButton.cancel']}" immediate="true" action="adHocEvaluationsIndex"
				styleClass="inputbutton" value="#{bundle['button.cancel']}"/>
		</h:form>
</ft:tilesView>