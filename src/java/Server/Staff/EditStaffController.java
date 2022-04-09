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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
public class EditStaffController extends HttpServlet {

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
            out.println("<title>Servlet EditStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditStaffController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int userId;
        boolean invalidUserId = false;
        Staff staff;
        try {
            userId = Integer.parseInt((String) request.getParameter("edit_user_id"));
            staff = (Staff) mgr.createNamedQuery("Staff.findByStaffId")
                    .setParameter("staffId", userId)
                    .getSingleResult();
            if (staff != null) {
                // result found, can edit
                request.setAttribute("staff", staff);
            }
        } catch (NumberFormatException e) {
            invalidUserId = true;
        }

        if (invalidUserId) {
            // redirect user
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>No User Selected to edit</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script>\n"
                        + "                    alert(`No record selected or invalid Staff Id, Please select first.\n"
                        + "                         Enter To Continue`); \n"
                        + "                    window.location='backend/staff/view_staff.jsp';\n"
                        + "                </script>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
        }
        request.getRequestDispatcher("/backend/staff/edit_staff.jsp").forward(request, response);
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
        int staffId = Integer.parseInt(request.getParameter("staffId"));

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

        Pattern p = Pattern.compile("^[a-zA-Z]*$");
        Matcher m;
        if (username != null && !username.isEmpty()) {
            m = p.matcher(username);
            if (m.matches()) {
                usernameStatus.set(0, VALUE_CHANGED);
                usernameStatus.set(1, "Successfully changed");
            } else {
                usernameStatus.set(0, INPUT_ERROR);
                usernameStatus.set(1, "Invalid Username");
            }
        }

        p = Pattern.compile("^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$");
        if (email != null && !email.isEmpty()) {
            m = p.matcher(email);
            if (m.matches()) {
                emailStatus.set(0, VALUE_CHANGED);
                emailStatus.set(1, "Successfully changed");
            } else {
                emailStatus.set(0, INPUT_ERROR);
                emailStatus.set(1, "Email Username");
            }
        }

        if (password != null && !password.isEmpty()) {
            if (confirmPassword != null && !confirmPassword.isEmpty()) {
                if (password.equals(confirmPassword)) {
                    passwordStatus.set(0, VALUE_CHANGED);
                    passwordStatus.set(1, "Successfully Changed");
                } else {
                    passwordStatus.set(0, INPUT_ERROR);
                    passwordStatus.set(1, "Not same Password");
                }
            } else {
                passwordStatus.set(0, INPUT_ERROR);
                passwordStatus.set(1, "Confirm Password cannot be empty");
            }
        }

        p = Pattern.compile("01[0-46-9]\\d{7,8}|0\\d{8}");
        if (contactNo != null && !contactNo.isEmpty()) {
            m = p.matcher(contactNo);
            if (m.matches()) {
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

        Staff staffFromDB = (Staff) mgr.createNamedQuery("Staff.findByStaffId").setParameter("staffId", staffId).getSingleResult();
        boolean updateRecord = false;
        if (usernameStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            staffFromDB.setUsername(username);
        }
        if (passwordStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            staffFromDB.setPassword(password);
        }
        if (genderStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            staffFromDB.setGender(gender);
        }
        if (emailStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            staffFromDB.setEmail(email);
        }
        if (contactNoStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            staffFromDB.setContactNo(contactNo);
        }
        if (updateRecord) {
            try {
                utx.begin();
                mgr.merge(staffFromDB);
                utx.commit();
            } catch (Exception e) {
            }
        }
        staffFromDB = (Staff) mgr.createNamedQuery("Staff.findByStaffId").setParameter("staffId", staffId).getSingleResult();
        request.setAttribute("staff", staffFromDB);
        request.setAttribute("usernameStatus", usernameStatus);
        request.setAttribute("emailStatus", emailStatus);
        request.setAttribute("passwordStatus", passwordStatus);
        request.setAttribute("contactNoStatus", contactNoStatus);
        request.setAttribute("genderStatus", genderStatus);
        request.getRequestDispatcher("/backend/staff/edit_staff.jsp").forward(request, response);
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
