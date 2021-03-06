/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Staff;

import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author lenovo
 */
public class StaffController extends HttpServlet {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        final String NO_CHANGE = "0";
        List<String> deleteStatus = Arrays.asList(NO_CHANGE, "");
        List<Staff> staffList;

        try {
            int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
            String sort = (String) request.getParameter("sort");
            String col = (String) request.getParameter("col");
            boolean sorted = false;

            List<String> colList = Arrays.asList("staffId", "username", "email", "contactNo");
            //sort stuffs
            if (col != null && sort != null && colList.contains(col)) {
                sort = sort.equals("ASC") ? "ASC" : "DESC";
                sorted = true;
            }

            // search
            // is sorting by column
            if (sorted) {
                String query = String.format("SELECT s FROM Staff s ORDER BY s.%s %s", col, sort);
                staffList = (List<Staff>) mgr.createQuery(query).getResultList();
            } else {
                staffList = (List<Staff>) mgr.createNamedQuery("Staff.findAll").getResultList();
            }
            
            session.setAttribute("staffList", staffList);
            session.setAttribute("col", col);
            session.setAttribute("sort", sort);
            session.setAttribute("pageNo", pageNo);
            session.setAttribute("deleteStatus", deleteStatus);
            request.getRequestDispatcher("/backend/staff/view_staff.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("/backend/staff/view_staff.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        final String NO_CHANGE = "0", VALUE_CHANGED = "1", INPUT_ERROR = "2";
        List<String> deleteStatus = Arrays.asList(NO_CHANGE, "");
        int staffId;
        try {
            staffId = Integer.parseInt(request.getParameter("staffId"));
            try {
                utx.begin();
                mgr.remove(mgr.find(Staff.class, staffId)); // doesnt work if i only put mgr.remove()
                utx.commit();

                deleteStatus.set(0, VALUE_CHANGED);
                deleteStatus.set(1, "Removed Record from database");
            } catch (Exception e) {
                deleteStatus.set(0, INPUT_ERROR);
                deleteStatus.set(1, "Error Removing Record from database");
            }
        } catch (Exception e) {
            deleteStatus.set(0, INPUT_ERROR);
            deleteStatus.set(1, "Invalid Staff Id");
        }
        List<Staff> staffList = (List<Staff>) mgr.createNamedQuery("Staff.findAll").getResultList();
        session.setAttribute("staffList", staffList);
        request.setAttribute("deleteStatus", deleteStatus);
        request.getRequestDispatcher("/backend/staff/view_staff.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
