package Controller;

import Model.Customers;
import Model.Product;
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

public class FindProductsCategory extends HttpServlet {
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
        
        int categoryId = Integer.parseInt(request.getParameter("CategoryId"));
        int subCategoryId = Integer.parseInt(request.getParameter("SubCategoryId"));
        int customerId = Integer.parseInt(request.getParameter("CustomerId"));
        
        try{
            HttpSession session = request.getSession();
            session.setAttribute("categoryId", categoryId);
            session.setAttribute("subCategoryId", subCategoryId);
            
            Query query = em.createQuery("SELECT p FROM Product p WHERE p.categoryId.categoryId = :categoryId AND p.subcategoryId.subcategoryId = :subcategoryId");
            List<Product> productFindList = (List<Product>)query.setParameter("categoryId", categoryId).setParameter("subcategoryId", subCategoryId).getResultList();
            
            Query query2 = em.createNamedQuery("Customers.findByCustomerId").setParameter("customerId",customerId);
            Customers c = (Customers) query2.getSingleResult();
            session.setAttribute("customer", c);
            
            session.setAttribute("productFindList", productFindList);

            response.sendRedirect("Client/ProductsCategory.jsp");
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
