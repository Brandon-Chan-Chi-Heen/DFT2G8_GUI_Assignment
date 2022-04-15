package Controller;

import Models.*;
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

public class TempAddOrderedProduct extends HttpServlet {
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
        
        int productOrderId = Integer.parseInt(request.getParameter("productOrderId"));
        int productOrderQty = Integer.parseInt(request.getParameter("productOrderQty"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        
        try{
            HttpSession session = request.getSession();
            session.setAttribute("productOrderId", productOrderId);
            session.setAttribute("productOrderQty", productOrderQty);
            
            Query query = em.createNamedQuery("Product.findByProductId").setParameter("productId",productOrderId);
            Query query2 = em.createNamedQuery("Customers.findByCustomerId").setParameter("customerId",customerId);
            Customers c = (Customers) query2.getSingleResult();
            List<Product> productOrderArr = (List<Product>)query.getResultList();
            List<Product> productArr = session.getAttribute("productOrderArr") == null ? new ArrayList<Product>() : (List<Product>)session.getAttribute("productOrderArr");
            List<Integer> orderQty = session.getAttribute("orderQty") == null ? new ArrayList<Integer>() : (List<Integer>)session.getAttribute("orderQty");
            
            session.setAttribute("customer", c);
            
            productArr.add(productOrderArr.get(0));
            session.setAttribute("productOrderArr", productArr);
          
            orderQty.add(productOrderQty);
            session.setAttribute("orderQty", orderQty);
            
            if(customerId != 0){
                response.sendRedirect("Client/Order.jsp");  
            } 
            else{
                response.sendRedirect("Client/login.jsp");  
            }
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
