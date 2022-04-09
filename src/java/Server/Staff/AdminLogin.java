/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Staff;

import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
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
public class AdminLogin extends HttpServlet {

    @PersistenceContext
    EntityManager em;
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
        return;
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
        response.sendRedirect("/backend/adminlogin.jsp");
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

        String adminID = (String) request.getParameter("adminID");
        String password = (String) request.getParameter("password");
        Pattern p = Pattern.compile("^[a-zA-Z0-9]*$");
        Matcher m = p.matcher(adminID);
        boolean validAdminID = false;
        if (!adminID.isEmpty() && m.matches()) {
            validAdminID = true;
        }

        boolean emptyPassword = true;
        if (!password.isEmpty()) {
            emptyPassword = false;
        }

        boolean validData = !emptyPassword && validAdminID;
        if (validData) {
            int tableAdminID = Integer.parseInt(adminID);
            Staff staff = em.find(Staff.class, tableAdminID);

            if (staff != null) {
                if (staff.getStaffId().equals(tableAdminID) && staff.getPassword().equals(password)) {
                    session.setAttribute("adminID", adminID);
                    session.setAttribute("username", staff.getUsername());
                    String userID = (String) session.getAttribute("userID");
                    if (userID != null && !userID.isEmpty()) {
                        session.removeAttribute("userID");
                    }
                    response.sendRedirect(request.getContextPath() + "/backend/index.jsp");
        //            RequestDispatcher r = request.getRequestDispatcher("/backend/index.jsp");
        //            r.forward(request, response);
                    return;
                }
            }
        }

        request.setAttribute("validAdminID", validAdminID);
        request.setAttribute("adminID", adminID);
        request.setAttribute("emptyPassword", emptyPassword);
        request.setAttribute("validAdminID", validAdminID);
        RequestDispatcher r = request.getRequestDispatcher("/backend/adminlogin.jsp");
        r.include(request, response);
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
