/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Customer;

import Models.Customers;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author lenovo
 */
public class AddCustomer extends HttpServlet {

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

        String fullname = (String) request.getParameter("fullname");
        List<String> fullnameStatus = Arrays.asList(NO_CHANGE, "");

        String email = (String) request.getParameter("email");
        List<String> emailStatus = Arrays.asList(NO_CHANGE, "");

        String password = (String) request.getParameter("password");
        String confirmPassword = (String) request.getParameter("confirmPassword");
        List<String> passwordStatus = Arrays.asList(NO_CHANGE, "");

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

        p = Pattern.compile("^[a-zA-Z\\s]*$");
        if (fullname != null) {
            m = p.matcher(fullname);
            if (m.matches() && !fullname.isEmpty()) {
                fullnameStatus.set(0, VALUE_CHANGED);
                fullnameStatus.set(1, "Successfully changed");
            } else {
                fullnameStatus.set(0, INPUT_ERROR);
                fullnameStatus.set(1, "Invalid Full Name");
            }
        }

        p = Pattern.compile("^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$");
        if (email != null) {
            m = p.matcher(email);
            if (m.matches() && !email.isEmpty()) {
                emailStatus.set(0, VALUE_CHANGED);
                emailStatus.set(1, "Successfully changed");
            } else {
                emailStatus.set(0, INPUT_ERROR);
                emailStatus.set(1, "Invalid Email");
            }
        }

        if (password != null) {
            if (confirmPassword != null && !password.isEmpty() && !confirmPassword.isEmpty()) {
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

        boolean allValidValues = usernameStatus.get(0).equals(VALUE_CHANGED)
                && emailStatus.get(0).equals(VALUE_CHANGED)
                && passwordStatus.get(0).equals(VALUE_CHANGED)
                && fullnameStatus.get(0).equals(VALUE_CHANGED);

        Customers customer = new Customers();
        customer.setUsername(username == null ? "" : username);
        customer.setFullname(fullname == null ? "" : fullname);
        customer.setEmail(email == null ? "" : email);
        customer.setPassword(password == null ? "" : fullname);
        if (allValidValues) {
            try {
                utx.begin();
                mgr.persist(customer);
                utx.commit();
                response.sendRedirect(request.getContextPath() + "/CustomerController");
                return;
            } catch (Exception e) {
            }
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("usernameStatus", usernameStatus);
            request.setAttribute("fullname", fullname);
            request.setAttribute("emailStatus", emailStatus);
            request.setAttribute("passwordStatus", passwordStatus);
        }

        request.getRequestDispatcher("/backend/Customer/add_customer.jsp").forward(request, response);
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
