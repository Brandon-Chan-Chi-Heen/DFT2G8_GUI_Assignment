/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.Customers;
import Models.Orders;
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
 * @author heeju
 */
public class OrderHistoryController extends HttpServlet {
    @PersistenceContext EntityManager em;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer ID = Integer.parseInt(request.getParameter("customerID")); 
            Customers customers = em.find(Customers.class, ID);
            session.setAttribute("orderList", customers);
            List<Orders> o = new ArrayList<>();
            Query displayOrders = em.createNamedQuery("Orders.findAll");
            List<Orders> orderList = displayOrders.getResultList();
            session.setAttribute("orderList", orderList);
            for (int i = 0; i < orderList.size(); i++) {
                if(customers.getCustomerId().equals(orderList.get(i).getCustomerId().getCustomerId())){
                    if(orderList.get(i).getStatus().equals("delivered")){
                        o.add(orderList.get(i));
                    }
                }
            }
            session.setAttribute("customersOrderHistory", o);
            response.sendRedirect(request.getContextPath() + "/Client/OrderHistorySection.jsp");
        }catch (Exception ex) {
            ex.printStackTrace();
        }
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
