/*
 * Created on May 25, 2003
 *  
 */

package net.sourceforge.fenixedu.presentationTier.TagLib.sop.examsMapNew;

import java.util.Calendar;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.jsp.PageContext;

import net.sourceforge.fenixedu.dataTransferObject.InfoCurricularCourseScope;
import net.sourceforge.fenixedu.dataTransferObject.InfoExam;
import net.sourceforge.fenixedu.dataTransferObject.InfoExecutionCourse;
import net.sourceforge.fenixedu.presentationTier.TagLib.sop.examsMapNew.renderers.ExamsMapSlotContentRenderer;

/*
 * @author Luis Cruz & Sara Ribeiro
 *  
 */

public class ExamsMapForRoomRenderer implements IExamsMapRenderer {

    private String[] daysOfWeek = { "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado" };

    private int numberOfWeks;

    private ExamsMap examsMap;

    private ExamsMapSlotContentRenderer examsMapSlotContentRenderer;

    private String user;

    public ExamsMapForRoomRenderer(ExamsMap examsMap, ExamsMapSlotContentRenderer examsMapSlotContentRenderer, String typeUser) {
        setExamsMap(examsMap);
        setExamsMapSlotContentRenderer(examsMapSlotContentRenderer);
        numberOfWeks = examsMap.getDays().size() / 6;
        setUser(typeUser);
    }

    @Override
    public StringBuilder render(Locale locale, PageContext pageContext) {
        StringBuilder strBuffer = new StringBuilder("");
        ResourceBundle bundle = ResourceBundle.getBundle("resources.PublicDegreeInformation", locale);
        strBuffer.append("<table class='examMapContainer' cellspacing='0' cellpadding='3' width='95%'>");
        strBuffer.append("<tr>");
        strBuffer.append("<td>");
        renderExamsMapForRoom(strBuffer, pageContext, bundle);
        strBuffer.append("</td>");
        strBuffer.append("</tr>");
        strBuffer.append("</table>");

        if (getUser() != null && !getUser().equals("sop")) {
            renderExamsTableForRoom(strBuffer);
        }
        strBuffer.append("<br />");

        return strBuffer;
    }

    private void renderExamsMapForRoom(StringBuilder strBuffer, PageContext pageContext, ResourceBundle bundle) {
        strBuffer.append("<table class='examMap' cellspacing='0' cellpadding='3' width='95%'>");

        strBuffer.append("<tr>");
        renderHeader(strBuffer);
        strBuffer.append("</tr>");

        for (int week = 0; week < numberOfWeks; week++) {
            strBuffer.append("<tr>");
            renderLabelsForRowOfDays(strBuffer, week, pageContext, bundle);
            strBuffer.append("</tr>\r\n");
            strBuffer.append("<tr>");
            renderExamsForRowOfDays(strBuffer, week, pageContext);
            strBuffer.append("</tr>\r\n");
        }

        strBuffer.append("</table>");

        strBuffer.append("<br style=\"page-break-after:always;\" />");
    }

    private void renderExamsForRowOfDays(StringBuilder strBuffer, int week, PageContext pageContext) {
        for (int slot = 0; slot < daysOfWeek.length; slot++) {
            ExamsMapSlot examsMapSlot = (ExamsMapSlot) examsMap.getDays().get(week * daysOfWeek.length + slot);

            String classCSS = "exam_cell_content";
            if (examsMapSlot.getDay().get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY) {
                classCSS += "_first";
            }

            if (week == numberOfWeks - 1) {
                classCSS += "_bottom";
            }
            strBuffer.append("<td ").append("class='").append(classCSS).append("'>");

            strBuffer.append(examsMapSlotContentRenderer.renderDayContents(
                    (ExamsMapSlot) examsMap.getDays().get(week * daysOfWeek.length + slot), examsMap, user, pageContext));

            strBuffer.append("</td>");
        }
    }

    private void renderLabelsForRowOfDays(StringBuilder strBuffer, int week, PageContext pageContext, ResourceBundle bundle) {
        for (int slot = 0; slot < daysOfWeek.length; slot++) {
            ExamsMapSlot examsMapSlot = (ExamsMapSlot) examsMap.getDays().get(week * daysOfWeek.length + slot);

            String classCSS = "exam_cell_day";
            if (examsMapSlot.getDay().get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY) {
                classCSS += "_first";
            }

            strBuffer.append("<td ").append("class='").append(classCSS).append("'>");
            strBuffer.append(examsMapSlotContentRenderer.renderDayLabel(examsMapSlot, examsMap, user, pageContext));
            strBuffer.append("</td>");
        }
    }

    private void renderHeader(StringBuilder strBuffer) {
        for (int index = 0; index < this.daysOfWeek.length; index++) {
            StringBuilder classCSS = new StringBuilder("examMap_header");
            if (index == 0) {
                classCSS.append("_first");
            }
            strBuffer.append("<td class='").append(classCSS).append("'>\r\n").append(daysOfWeek[index]).append("</td>\r\n");
        }
    }

    private void renderExamsTableForRoom(StringBuilder strBuffer) {
        strBuffer.append("<table border='1' cellspacing='0' cellpadding='3' width='95%'>");

        renderExamsTableHeader(strBuffer);

        for (int week = 0; week < numberOfWeks; week++) {
            for (int slot = 0; slot < daysOfWeek.length; slot++) {
                ExamsMapSlot examsMapSlot = (ExamsMapSlot) examsMap.getDays().get(week * daysOfWeek.length + slot);

                for (int i = 0; i < examsMapSlot.getExams().size(); i++) {
                    strBuffer.append("<tr>");
                    InfoExam infoExam = (InfoExam) examsMapSlot.getExams().get(i);

                    strBuffer.append("<td>");
                    for (int iterEC = 0; iterEC < infoExam.getAssociatedExecutionCourse().size(); iterEC++) {
                        InfoExecutionCourse infoEC = infoExam.getAssociatedExecutionCourse().get(iterEC);
                        strBuffer.append(infoEC.getSigla());
                        // strBuffer.append("</a>");

                        strBuffer.append("<br/>");
                    }
                    strBuffer.append("</td>");
                    strBuffer.append("<td>");

                    for (int iterEC = 0; iterEC < infoExam.getAssociatedCurricularCourseScope().size(); iterEC++) {
                        InfoCurricularCourseScope infoCCS = infoExam.getAssociatedCurricularCourseScope().get(iterEC);

                        strBuffer.append(infoCCS.getInfoCurricularCourse().getInfoDegreeCurricularPlan().getName());
                        strBuffer.append(" ");
                        strBuffer.append(infoCCS.getInfoCurricularSemester().getInfoCurricularYear().getYear());
                        strBuffer.append("º ano <br/>");
                    }
                    strBuffer.append("</td>");

                    strBuffer.append("<td>" + infoExam.getSeason().getSeason() + "ª </td>");
                    strBuffer.append("<td>" + infoExam.getDate() + "</td>");
                    strBuffer.append("<td>" + infoExam.getBeginningHour() + "</td>");
                    strBuffer.append("<td>" + infoExam.getEndHour() + "</td>");

                    strBuffer.append("</tr>");
                }

            }
        }

        strBuffer.append("</table>");
        strBuffer.append("<br style=\"page-break-after:always;\" />");
    }

    private void renderExamsTableHeader(StringBuilder strBuffer) {
        strBuffer.append("<tr>");
        strBuffer.append("<td> Disciplina </td>");
        strBuffer.append("<td> Degree e Ano </td>");
        strBuffer.append("<td> Época </td>");
        strBuffer.append("<td> Data </td>");
        strBuffer.append("<td> Hora Inicio </td>");
        strBuffer.append("<td> Hora Fim </td>");
        strBuffer.append("</tr>");
    }

    /**
     * @param map
     */
    private void setExamsMap(ExamsMap map) {
        examsMap = map;
    }

    /**
     * @param renderer
     */
    private void setExamsMapSlotContentRenderer(ExamsMapSlotContentRenderer renderer) {
        examsMapSlotContentRenderer = renderer;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String string) {
        user = string;
    }

}