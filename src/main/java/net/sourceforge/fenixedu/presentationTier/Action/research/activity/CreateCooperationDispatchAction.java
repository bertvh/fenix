package net.sourceforge.fenixedu.presentationTier.Action.research.activity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.research.activity.CreateResearchActivityParticipation;
import net.sourceforge.fenixedu.dataTransferObject.research.activity.ResearchCooperationCreationBean;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.presentationTier.Action.base.FenixDispatchAction;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import pt.ist.fenixWebFramework.renderers.utils.RenderUtils;
import pt.ist.fenixWebFramework.struts.annotations.Forward;
import pt.ist.fenixWebFramework.struts.annotations.Forwards;
import pt.ist.fenixWebFramework.struts.annotations.Mapping;
import pt.ist.fenixWebFramework.struts.annotations.Tile;

@Mapping(module = "researcher", path = "/activities/createCooperation", scope = "request", parameter = "method")
@Forwards(value = {
        @Forward(name = "ListActivities", path = "/activities/activitiesManagement.do?method=listActivities",
                tileProperties = @Tile(
                        title = "private.operator.personnelmanagement.managementfaculty.teacherevaluation.activities")),
        @Forward(name = "CreateCooperation", path = "/researcher/activities/createCooperationParticipation.jsp",
                tileProperties = @Tile(
                        title = "private.operator.personnelmanagement.managementfaculty.teacherevaluation.activities")) })
public class CreateCooperationDispatchAction extends FenixDispatchAction {

    public ActionForward prepareCreateCooperationParticipation(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {

        ResearchCooperationCreationBean cooperationBean = getCooperationBean(request);

        if (cooperationBean == null) {
            cooperationBean = new ResearchCooperationCreationBean();
        } else {
            cooperationBean.setCooperationUnitType(null);
            cooperationBean.setUnit(null);
            cooperationBean.setUnitName(null);
            cooperationBean.setRole(null);
        }

        request.setAttribute("cooperationTypeBean", cooperationBean);
        request.setAttribute("party", getLoggedPerson(request));

        return mapping.findForward("CreateCooperation");
    }

    public ActionForward prepareAssociateUnitToCooperation(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ResearchCooperationCreationBean cooperationBean = getCooperationBean(request);
        if (cooperationBean == null) {
            return prepareCreateCooperationParticipation(mapping, form, request, response);
        }

        if (cooperationBean.getCooperationUnitType() == null) {
            request.setAttribute("cooperationUnitBean", cooperationBean);
        } else if (!cooperationBean.isExternalParticipation()) {
            RenderUtils.invalidateViewState();
            request.setAttribute("cooperationUnitSchema", "cooperationParticipation.internalUnit");
            request.setAttribute("cooperationUnitBean", cooperationBean);
        } else {
            RenderUtils.invalidateViewState();
            request.setAttribute("cooperationUnitSchema", "cooperationParticipation.externalUnit");
            request.setAttribute("cooperationUnitBean", cooperationBean);
        }

        return mapping.findForward("CreateCooperation");
    }

    public ActionForward prepareCreateParticipation(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ResearchCooperationCreationBean cooperationBean = getCooperationBean(request);
        if (cooperationBean == null) {
            return prepareCreateCooperationParticipation(mapping, form, request, response);
        }

        /*
         * Cannot create cooperations with not existent internal units
         */
        if (!cooperationBean.isExternalParticipation() && cooperationBean.getUnit() == null) {
            addActionMessage(request, "error.researcher.ResearchActivityParticipation.unitMustBeExternal");
            request.setAttribute("cooperationUnitSchema", "cooperationParticipation.internalUnit");
            request.setAttribute("cooperationUnitBean", cooperationBean);
        } else {
            request.setAttribute("collaborationFormBean", cooperationBean);
        }

        return mapping.findForward("CreateCooperation");
    }

    public ActionForward createParticipation(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ResearchCooperationCreationBean cooperationBean = getCooperationBean(request);
        if (cooperationBean == null) {
            return prepareCreateCooperationParticipation(mapping, form, request, response);
        }

        Person person = getLoggedPerson(request);
        try {
            CreateResearchActivityParticipation.run(cooperationBean, person);
        } catch (DomainException e) {
            addActionMessage(request, e.getMessage());
            return prepareCreateCooperationParticipation(mapping, form, request, response);
        } catch (FenixServiceException e) {
            addActionMessage(request, e.getMessage());
            return prepareCreateParticipation(mapping, form, request, response);
        }

        return mapping.findForward("ListActivities");
    }

    /*
     * Gets the submited form bean, either it is a normal bean or a backup state
     * bean
     */
    public ResearchCooperationCreationBean getCooperationBean(HttpServletRequest request) {
        ResearchCooperationCreationBean bean = null;
        if (RenderUtils.getViewState() != null) {
            bean = (ResearchCooperationCreationBean) RenderUtils.getViewState().getMetaObject().getObject();
            return bean;
        }
        return bean;
    }
}