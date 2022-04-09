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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        List<Staff> staffList;

        try {
            int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
            String sort = (String) request.getParameter("sort");
            String col = (String) request.getParameter("col");
            String search = (String) request.getParameter("search");
            String col_search = (String) request.getParameter("col_search");
            boolean sorted = false;

            List<String> colList = Arrays.asList("staffId", "username", "email", "contactNo");
            //sort stuffs
            if (col != null && sort != null && colList.contains(col)) {
                sort = sort.equals("ASC") ? "ASC" : "DESC";
                sorted = true;
            }

            // disabled for now
            if (false && search != null && !search.isEmpty()) {
                if (!colList.contains(col_search)) {
                    col_search = colList.get(1); // default username
                }

                String query = "SELECT s FROM Staff s WHERE s." + col_search + " = :" + col_search;
                if (sorted) {
                    query += String.format(" ORDER BY s.%s %s", col_search,sort);
                }
                staffList = (List<Staff>) mgr.createQuery(query).getResultList();
            } else {
                staffList = (List<Staff>) mgr.createNamedQuery("Staff.findAll").getResultList();
            }
            request.setAttribute("staffList", staffList);
            request.setAttribute("col", col);
            request.setAttribute("sort", sort);
            request.setAttribute("search", search);
            request.setAttribute("col_search", col_search);
            request.setAttribute("pageNo", pageNo);
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
        int staffId;
        try {
            staffId = Integer.parseInt(request.getParameter("staffId"));
        } catch(Exception e){
            request.setAttribute("deleteError", "Invalid Staff Id");
            request.getRequestDispatcher("/backend/staff/view_staff.jsp").forward(request, response);
            return;
        }
        
        try{
            Staff staff = mgr.find(Staff.class, staffId);
            utx.begin();
            mgr.remove(staff);
            utx.commit();
        } catch( Exception e){
            request.setAttribute("deleteError", "Error Removing Record from database");
            request.getRequestDispatcher("/backend/staff/view_staff.jsp").forward(request, response);
        }
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
