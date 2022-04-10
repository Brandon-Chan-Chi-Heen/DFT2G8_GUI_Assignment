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
public class CustomerController extends HttpServlet {

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
        List<Customers> customerList;

        try {
            int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
            String sort = (String) request.getParameter("sort");
            String col = (String) request.getParameter("col");
            boolean sorted = false;

            List<String> colList = Arrays.asList("customerId", "username", "fullname", "email");
            //sort stuffs
            if (col != null && sort != null && colList.contains(col)) {
                sort = sort.equals("ASC") ? "ASC" : "DESC";
                sorted = true;
            }

            // search
            // is sorting by column
            if (sorted) {
                String query = String.format("SELECT c FROM Customers c ORDER BY c.%s %s", col, sort);
                customerList = (List<Customers>) mgr.createQuery(query).getResultList();
            } else {
                customerList = (List<Customers>) mgr.createNamedQuery("Customers.findAll").getResultList();
            }
            
            session.setAttribute("customerList", customerList);
            session.setAttribute("col", col);
            session.setAttribute("sort", sort);
            session.setAttribute("pageNo", pageNo);
            session.setAttribute("deleteStatus", deleteStatus);
            request.getRequestDispatcher("/backend/Customer/view_customer.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("/backend/Customer/view_customer.jsp");
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
        int customerId;
        try {
            customerId = Integer.parseInt(request.getParameter("customerId"));
            try {
                utx.begin();
                mgr.remove(mgr.find(Customers.class, customerId)); // doesnt work if i only put mgr.remove()
                utx.commit();

                deleteStatus.set(0, VALUE_CHANGED);
                deleteStatus.set(1, "Removed Record from database");
            } catch (Exception e) {
                deleteStatus.set(0, INPUT_ERROR);
                deleteStatus.set(1, "Error Removing Record from database");
            }
        } catch (Exception e) {
            deleteStatus.set(0, INPUT_ERROR);
            deleteStatus.set(1, "Invalid Product Id");
        }
        List<Customers> customerList = (List<Customers>) mgr.createNamedQuery("Customers.findAll").getResultList();
        session.setAttribute("customerList", customerList);
        request.setAttribute("deleteStatus", deleteStatus);
        request.getRequestDispatcher("/backend/Product/view_product.jsp").forward(request, response);
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
