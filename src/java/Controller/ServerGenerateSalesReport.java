/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.MathContext;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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

/**
 *
 * @author Ng Ming Zhe
 */
public class ServerGenerateSalesReport extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

            Date startDate = df.parse(request.getParameter("start_date"));
            Date endDate = df.parse(request.getParameter("end_date"));
            Query query = em.createQuery("SELECT o FROM Orders o WHERE o.orderDate BETWEEN :startDate AND :endDate")
                    .setParameter("startDate", startDate)
                    .setParameter("endDate", endDate);
            List<Orders> ordersList = query.getResultList();

            if (ordersList.isEmpty() == false) {

                Query query2 = em.createNamedQuery("OrderDetail.findAll", OrderDetail.class);
                List<OrderDetail> orderDetailList = query2.getResultList();
                List<OrderDetail> o = new ArrayList<OrderDetail>();

                for (int i = 0; i < orderDetailList.size(); i++) {

                    for (int x = 0; x < ordersList.size(); x++) {
                        if (orderDetailList.get(i).getOrderId().equals(ordersList.get(x))) {
                            o.add(orderDetailList.get(i));

                        }
                    }
                }

                double total = 0;

                for (OrderDetail detail : o) {
                    total += detail.getSubtotal().doubleValue();

                }

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MMM yyyy HH:mm:ss");
                LocalDateTime generateOn = LocalDateTime.now();

                session.setAttribute("total", total);
                session.setAttribute("orderDetailList", o);
                session.setAttribute("startDate", df.format(startDate));
                session.setAttribute("endDate", df.format(endDate));
                session.setAttribute("salesReportOn", dtf.format(generateOn));
            } else {

                String found = "No result(s) found!";
                session.setAttribute("found", found);

            }
            response.sendRedirect("./backend/Report/salesReport.jsp");

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
            out.println("<title>Servlet GenerateReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerateReport at " + request.getContextPath() + "</h1>");
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
