/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.Customers;
import Models.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Henry
 */
public class ProcessPayment extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productOrderId = Integer.parseInt(request.getParameter("productOrderId"));
        int productOrderQty = Integer.parseInt(request.getParameter("productOrderQty"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        HttpSession session = request.getSession();

        Query query = em.createNamedQuery("Product.findByProductId").setParameter("productId", productOrderId);
        Query query2 = em.createNamedQuery("Customers.findByCustomerId").setParameter("customerId", customerId);
        Customers c = (Customers) query2.getSingleResult();
        List<Product> productOrderArr = (List<Product>) query.getResultList();
        List<Product> productArr = session.getAttribute("productOrderArr") == null ? new ArrayList<Product>() : (List<Product>) session.getAttribute("productOrderArr");
        List<Integer> orderQty = session.getAttribute("orderQty") == null ? new ArrayList<Integer>() : (List<Integer>) session.getAttribute("orderQty");

        session.setAttribute("customer", c);

        productArr.add(productOrderArr.get(0));
        session.setAttribute("productOrderArr", productArr);

        orderQty.add(productOrderQty);
        session.setAttribute("orderQty", orderQty);
        response.sendRedirect("Client/checkOut.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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