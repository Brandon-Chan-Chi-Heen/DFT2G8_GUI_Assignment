/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Customer;

import Models.Customers;
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
public class EditCustomerController extends HttpServlet {

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
            out.println("<title>Servlet EditCustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCustomerController at " + request.getContextPath() + "</h1>");
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
        int customerId;
        boolean invalidCustomerId = false;
        Customers customer;
        try {
            customerId = Integer.parseInt((String) request.getParameter("edit_customer_id"));
            customer = (Customers) mgr.createNamedQuery("Customers.findByCustomerId")
                    .setParameter("customerId", customerId)
                    .getSingleResult();
            if (customer != null) {
                // result found, can edit
                request.setAttribute("customer", customer);
            }
        } catch (NumberFormatException e) {
            invalidCustomerId = true;
        }

        if (invalidCustomerId) {
            // redirect user
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>No Customer Selected to edit</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script>\n"
                        + "                    alert(`No record selected or invalid Customer Id, Please select first.\n"
                        + "                         Enter To Continue`); \n"
                        + "                    window.location='./CustomerController';\n"
                        + "                </script>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
        }
        request.getRequestDispatcher("/backend/Customer/edit_customer.jsp").forward(request, response);
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
        int customerId = Integer.parseInt(request.getParameter("customerId"));

        String username = (String) request.getParameter("username");
        List<String> usernameStatus = Arrays.asList(NO_CHANGE, "");
        String fullname = (String) request.getParameter("fullname");
        List<String> fullnameStatus = Arrays.asList(NO_CHANGE, "");
        
        String email = (String) request.getParameter("email");
        List<String> emailStatus = Arrays.asList(NO_CHANGE, "");

        String password = (String) request.getParameter("password");
        String confirmPassword = (String) request.getParameter("confirmPassword");
        List<String> passwordStatus = Arrays.asList(NO_CHANGE, "");

        

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
        
        if (fullname != null && !fullname.isEmpty()) {
            m = p.matcher(fullname);
            if (m.matches()) {
                fullnameStatus.set(0, VALUE_CHANGED);
                fullnameStatus.set(1, "Successfully changed");
            } else {
                fullnameStatus.set(0, INPUT_ERROR);
                fullnameStatus.set(1, "Invalid Full Name");
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

        Customers customerFromDB = (Customers) mgr.createNamedQuery("Customers.findByCustomerId").setParameter("customerId", customerId).getSingleResult();
        boolean updateRecord = false;
        if (usernameStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            customerFromDB.setUsername(username);
        }
        if (fullnameStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            customerFromDB.setFullname(fullname);
        }
        if (passwordStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            customerFromDB.setPassword(password);
        }
        if (emailStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            customerFromDB.setEmail(email);
        }
        if (updateRecord) {
            try {
                utx.begin();
                mgr.merge(customerFromDB);
                utx.commit();
            } catch (Exception e) {
            }
        }
        customerFromDB = (Customers) mgr.createNamedQuery("Customers.findByCustomerId").setParameter("customerId", customerId).getSingleResult();
        request.setAttribute("customer", customerFromDB);
        request.setAttribute("usernameStatus", usernameStatus);
        request.setAttribute("emailStatus", emailStatus);
        request.setAttribute("passwordStatus", passwordStatus);
        request.setAttribute("fullnameStatus", fullnameStatus);
        request.getRequestDispatcher("/backend/Customer/edit_customer.jsp").forward(request, response);
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
