/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.Comment;
import Models.Customers;
import Models.Product;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author heeju
 */
public class CommentController extends HttpServlet {
    @Resource UserTransaction utx;
    @PersistenceContext EntityManager em;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer ratings = Integer.parseInt(request.getParameter("rate"));
            String comments = request.getParameter("comments");
            
            Integer customerID1 = Integer.parseInt(request.getParameter("customerID"));
            Customers customers1 = em.find(Customers.class, customerID1);
            
            Integer productID1 = Integer.parseInt(request.getParameter("productID"));
            Product product1 = em.find(Product.class, productID1);
            
            if((ratings >= 1 && ratings <= 5) && (!comments.isEmpty())){
                Comment comment = new Comment(comments, ratings, customers1, product1);
                utx.begin();
                em.persist(comment);
                utx.commit();
            }
            
            Query query = em.createNamedQuery("Product.findByProductId");
            List<Product> product = (List<Product>)query.setParameter("productId",productID1).getResultList();
            session.setAttribute("product",product);   

            Query query2 = em.createNamedQuery("Customers.findByCustomerId").setParameter("customerId",customerID1);
            Customers c = (Customers) query2.getSingleResult();
            session.setAttribute("customer", c);
            
            Query query3 = em.createNamedQuery("Comment.findAll");
            List<Comment> commentList = query3.getResultList();
            session.setAttribute("commentList",commentList);
            response.sendRedirect("Client/Product.jsp");
        } catch (Exception ex) {
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
