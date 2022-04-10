package Controller;

import Models.Comment;
import Models.Customers;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public class FindCertainProduct extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int productId = Integer.parseInt(request.getParameter("ProductId"));
        int customerId = Integer.parseInt(request.getParameter("CustomerId"));
        
        try{
            HttpSession session = request.getSession();

            Query query = em.createNamedQuery("Product.findByProductId");
            List<Product> product = (List<Product>)query.setParameter("productId",productId).getResultList();
            session.setAttribute("product",product);   

            Query query2 = em.createNamedQuery("Customers.findByCustomerId").setParameter("customerId",customerId);
            Customers c = (Customers) query2.getSingleResult();
            session.setAttribute("customer", c);
            
            Query query3 = em.createNamedQuery("Comment.findAll");
            List<Comment> commentList = query3.getResultList();
            session.setAttribute("commentList",commentList);
            
            response.sendRedirect("Client/Product.jsp");
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
