/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ServerSearch extends HttpServlet {

    @PersistenceContext
    EntityManager em;

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
        String table = request.getParameter("search-from");
        String keyword = request.getParameter("keyword");
        Query query;
        try {
            if (table.equals("product")) {
                if (keyword == null || keyword.equals("")) {
                    query = em.createNamedQuery("Product.findAll", Product.class);
                } else {
                    query = em.createQuery("SELECT p FROM Product p WHERE p.productName LIKE '%" + keyword + "%'");
                }

                List<Product> productsList = query.getResultList();
                session.setAttribute("productsList", productsList);

            } else if (table.equals("staff")) {
                if (keyword == null || keyword.equals("")) {
                    query = em.createNamedQuery("Staff.findAll", Staff.class);
                } else {
                    int id = Integer.parseInt(keyword);
                    query = em.createNamedQuery("Staff.findByStaffId").setParameter("staffId", id);
                }

                List<Staff> staffsList = query.getResultList();
                session.setAttribute("staffsList", staffsList);

            } else if (table.equals("orderDetail")) {

                if (keyword == null || keyword.equals("")) {
                    query = em.createNamedQuery("OrderDetail.findAll", OrderDetail.class);
                    List<OrderDetail> d = query.getResultList();
                    session.setAttribute("salesRecordList", d);
                } else {
                    int id = Integer.parseInt(keyword);
                    query = em.createNamedQuery("Orders.findByOrderId").setParameter("orderId", id);
                    List<Orders> o = query.getResultList();

                    if (o.size() != 0) {
                        query = em.createQuery("SELECT o FROM OrderDetail o WHERE o.orderId= :orderId").setParameter("orderId", o.get(0));
                        List<OrderDetail> d = query.getResultList();
                        session.setAttribute("salesRecordList", d);
                    }

                }

            }

            session.setAttribute("table", table);
            session.setAttribute("keyword", keyword);
            response.sendRedirect(request.getContextPath()+"/backend/search.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./error.html");
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
            out.println("<title>Servlet Search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Search at " + request.getContextPath() + "</h1>");
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
