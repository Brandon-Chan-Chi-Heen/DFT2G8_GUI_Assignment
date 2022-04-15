package Controller;

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

public class RetrieveProducts extends HttpServlet {
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
        try{
            HttpSession session = request.getSession();
            Query query = em.createNamedQuery("Product.findAll");
            List<Product> productList = (List<Product>) query.getResultList();
            session.setAttribute("productList",productList);
            
            Query query2 = em.createNamedQuery("Product.findAll2");
            List<Product> topProductList = (List<Product>) query2.getResultList();
            session.setAttribute("topProductList",topProductList);
            
            Query query3 = em.createNamedQuery("Product.findAll3");
            List<Product> latestProductList = (List<Product>) query3.getResultList();
            session.setAttribute("latestProductList",latestProductList);
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
