package lk.ijse.CMS.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.CMS.dao.CmplainDAO;
import lk.ijse.CMS.model.Complaint;
import lk.ijse.CMS.model.User;

import java.io.IOException;

@WebServlet("/complaints")
public class ComplaintServlet extends HttpServlet {
    private CmplainDAO complaintDAO;

    public void init() {
        complaintDAO = new CmplainDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {

                case "uedit":

                    int idUed = Integer.parseInt(request.getParameter("id"));
                    Complaint eComp = complaintDAO.getComLoadU(idUed);
//                    request.setAttribute("complaint", eComp);
                    request.setAttribute("complaint", eComp);

                    request.getRequestDispatcher("empComplainFrom.jsp").forward(request, response);
                    break;


                case "edit":


                    int idToEdit = Integer.parseInt(request.getParameter("id"));
                    Complaint existingComplaint = complaintDAO.getCompUp(idToEdit);

                    request.setAttribute("complaint", existingComplaint);

                    request.getRequestDispatcher("adminComplainFrom.jsp").forward(request, response);

                    break;

                case "delete":

                   int idDel = Integer.parseInt(request.getParameter("id"));
                    complaintDAO.deleteComp(idDel);
                    response.sendRedirect("dashboard");
                    break;


                case "add":
                    request.getRequestDispatcher("empComplainFrom.jsp").forward(request, response);
                    break;




                default:
                    response.sendRedirect("dashboard");
                    break;
            }
        } catch (NumberFormatException e) {

            response.sendRedirect("dashboard?error=invalid_id");
            e.printStackTrace();
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if ("create".equals(action)) {

            String title = request.getParameter("title");
            String description = request.getParameter("description");

            Complaint newComplaint = new Complaint();
            newComplaint.setTitle(title);
            newComplaint.setDescription(description);
            newComplaint.setUserId(user.getId());

            complaintDAO.addComplaint(newComplaint);

        } else if ("update".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            String remarks = request.getParameter("remarks");


            Complaint complaintToUpdate = new Complaint();
            complaintToUpdate.setId(id);
            complaintToUpdate.setStatus(status);
            complaintToUpdate.setRemarks(remarks);


            complaintDAO.updateComp(complaintToUpdate);
        }else  if ("eupdate".equals(action)) {

            int idUed = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            Complaint compUpdateEmp = new Complaint();
            compUpdateEmp.setId(idUed);
            compUpdateEmp.setTitle(title);
            compUpdateEmp.setDescription(description);

            System.out.println("Updating complaint for employee: " + compUpdateEmp);
            complaintDAO.updateCompEmp(compUpdateEmp);
        }

        response.sendRedirect("dashboard");
    }


}
