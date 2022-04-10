/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import models.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * @author Ng Ming Zhe
 */
public class ServerSearchOrders extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String by = request.getParameter("search-order-by");
        String keyword = request.getParameter("search-order-key");
        Query query = null;
        try {
            if (keyword.equals("") || keyword == null) {
                query = em.createNamedQuery("Orders.findAll");
            } else {
                if (by.equals("orderId")) {
                    int id = Integer.parseInt(keyword);
                    query = em.createNamedQuery("Orders.findByOrderId").setParameter("orderId", id);
                } else if (by.equals("orderDate")) {
                    Date date = new SimpleDateFormat("yyyy-MM-dd").parse(keyword);
                    query = em.createNamedQuery("Orders.findByOrderDate").setParameter("orderDate", date);
                } else if (by.equals("status")) {
                    query = em.createNamedQuery("Orders.findByStatus").setParameter("status", keyword);
                }
            }

            List<Orders> ordersList = query.getResultList();
            session.setAttribute("ordersList", ordersList);
            session.setAttribute("searchOrder", by);
            session.setAttribute("searchOrderKey", keyword);
            response.sendRedirect("orders.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error.html");
        }
    }

}
