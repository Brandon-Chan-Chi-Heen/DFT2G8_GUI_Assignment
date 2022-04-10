/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import models.OrderDetail;
import models.Orders;
import models.Product;

/**
 *
 * @author Ng Ming Zhe
 */
public class ServerGenerateProductSalesReport extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

            Date startDate = df.parse(request.getParameter("product_start_date"));
            Date endDate = df.parse(request.getParameter("product_end_date"));
            Query query = em.createQuery("SELECT o FROM Orders o WHERE o.orderDate BETWEEN :startDate AND :endDate")
                    .setParameter("startDate", startDate)
                    .setParameter("endDate", endDate);
            List<Orders> ordersList = query.getResultList();

            if (ordersList.isEmpty() == false) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                query = em.createNamedQuery("Product.findByProductId").setParameter("productId", productId);
                List<Product> p = query.getResultList();

                if (p.size() != 0) {

                    query = em.createNamedQuery("OrderDetail.findAll", OrderDetail.class);
                    List<OrderDetail> orderDetailList = query.getResultList();
                    List<OrderDetail> o = new ArrayList<OrderDetail>();

                    for (int i = 0; i < orderDetailList.size(); i++) {

                        for (int x = 0; x < ordersList.size(); x++) {
                            if (orderDetailList.get(i).getOrderId().equals(ordersList.get(x))) {
                                if (orderDetailList.get(i).getProductId().equals(p.get(0))) {
                                    o.add(orderDetailList.get(i));
                                }
                            }
                        }
                    }

                    double total = 0;
                    for (OrderDetail detail : o) {
                        total += detail.getSubtotal().doubleValue();

                    }

                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MMM yyyy HH:mm:ss");
                    LocalDateTime generateOn = LocalDateTime.now();

                    session.setAttribute("productSales", o);
                    session.setAttribute("productName", p.get(0).getProductName());
                    session.setAttribute("productTotal",total);
                    session.setAttribute("productId",p.get(0).getProductId());
                    session.setAttribute("salesStartDate", df.format(startDate));
                    session.setAttribute("salesEndDate", df.format(endDate));
                    session.setAttribute("productSalesReportOn", dtf.format(generateOn));
                }

            }
            response.sendRedirect("productSalesReport.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServerGenerateProductSalesReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServerGenerateProductSalesReport at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
