/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Staff;

import Models.Priviledge;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
public class AddStaff extends HttpServlet {

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
            out.println("<title>Servlet AddStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaff at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        final String NO_CHANGE = "0", VALUE_CHANGED = "1", INPUT_ERROR = "2";

        String username = (String) request.getParameter("username");
        List<String> usernameStatus = Arrays.asList(NO_CHANGE, "");
        String email = (String) request.getParameter("email");
        List<String> emailStatus = Arrays.asList(NO_CHANGE, "");

        String password = (String) request.getParameter("password");
        String confirmPassword = (String) request.getParameter("confirmPassword");
        List<String> passwordStatus = Arrays.asList(NO_CHANGE, "");

        String contactNo = (String) request.getParameter("contactNo");
        List<String> contactNoStatus = Arrays.asList(NO_CHANGE, "");

        char gender = request.getParameter("gender") != null ? request.getParameter("gender").charAt(0) : Character.MIN_VALUE;
        List<String> genderStatus = Arrays.asList(NO_CHANGE, "");

        Pattern p = Pattern.compile("^[a-zA-Z\\s]*$");
        Matcher m;
        if (username != null) {
            m = p.matcher(username);
            if (m.matches() && !username.isEmpty()) {
                usernameStatus.set(0, VALUE_CHANGED);
                usernameStatus.set(1, "Successfully changed");
            } else {
                usernameStatus.set(0, INPUT_ERROR);
                usernameStatus.set(1, "Invalid Username");
            }
        }

        p = Pattern.compile("^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$");
        if (email != null) {
            m = p.matcher(email);
            if (m.matches()  && !email.isEmpty()) {
                emailStatus.set(0, VALUE_CHANGED);
                emailStatus.set(1, "Successfully changed");
            } else {
                emailStatus.set(0, INPUT_ERROR);
                emailStatus.set(1, "Email Username");
            }
        }

        if (password != null) {
            if (confirmPassword != null && !password.isEmpty()    && !confirmPassword.isEmpty()) {
                if (password.equals(confirmPassword)) {
                    passwordStatus.set(0, VALUE_CHANGED);
                    passwordStatus.set(1, "Successfully Changed");
                } else {
                    passwordStatus.set(0, INPUT_ERROR);
                    passwordStatus.set(1, "Not same Password");
                }
            } else {
                passwordStatus.set(0, INPUT_ERROR);
                passwordStatus.set(1, "Password cannot be empty");
            }
        }

        p = Pattern.compile("[0-9]{3}-[0-9]{7,8}");
        if (contactNo != null) {
            m = p.matcher(contactNo);
            if (m.matches() && !contactNo.isEmpty()) {
                contactNoStatus.set(0, VALUE_CHANGED);
                contactNoStatus.set(1, "Successfully changed");
            } else {
                contactNoStatus.set(0, INPUT_ERROR);
                contactNoStatus.set(1, "Invalid Phone Number");
            }
        }

        if (gender != Character.MIN_VALUE) {
            if (Character.toUpperCase(gender) == 'M' || Character.toUpperCase(gender) == 'F') {
                genderStatus.set(0, VALUE_CHANGED);
                genderStatus.set(1, "Successfully changed");
            } else {
                genderStatus.set(0, INPUT_ERROR);
                genderStatus.set(1, "Invalid Gender Selected");
            }
        }

        boolean allValidValues = usernameStatus.get(0).equals(VALUE_CHANGED)
                && emailStatus.get(0).equals(VALUE_CHANGED)
                && passwordStatus.get(0).equals(VALUE_CHANGED)
                && genderStatus.get(0).equals(VALUE_CHANGED)
                && contactNoStatus.get(0).equals(VALUE_CHANGED);

        Staff staff = new Staff();
        staff.setUsername(username == null ? "" : username);
        staff.setContactNo(contactNo == null ? "" : contactNo );
        staff.setGender(gender);
        staff.setEmail(email == null ? "" : email);
        Priviledge priv = mgr.find(Priviledge.class, 3);
        staff.setPrivId(priv);
        if (allValidValues) {
            try {
                utx.begin();
                mgr.persist(staff);
                utx.commit();
                response.sendRedirect(request.getContextPath() + "/StaffController");
                return;
            } catch (Exception e) {
            }
        } else {
            request.setAttribute("staff", staff);
            request.setAttribute("usernameStatus", usernameStatus);
            request.setAttribute("emailStatus", emailStatus);
            request.setAttribute("passwordStatus", passwordStatus);
            request.setAttribute("contactNoStatus", contactNoStatus);
            request.setAttribute("genderStatus", genderStatus);
        }
        
        request.getRequestDispatcher("/backend/staff/add_staff.jsp").forward(request, response);
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
