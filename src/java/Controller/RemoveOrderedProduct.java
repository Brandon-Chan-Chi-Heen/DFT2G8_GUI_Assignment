package Controller;

import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

public class RemoveOrderedProduct extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int productOrderId = Integer.parseInt(request.getParameter("productOrderId"));
        int productOrderQty = Integer.parseInt(request.getParameter("productOrderQty"));
        
        try{
            HttpSession session = request.getSession();
            List<Product> productAllArr = (List<Product>)session.getAttribute("productOrderArr");
            List<Integer> orderAllQty = (List<Integer>)session.getAttribute("productAllQty");
            
            List<Product> newproductAllArr = new ArrayList<Product>();
            List<Integer> neworderAllQty = new ArrayList<Integer>();
            
            for(int i=0; i<productAllArr.size();i++){
                if(productAllArr.get(i).getProductId() != productOrderId){
                    newproductAllArr.add(productAllArr.get(i));
                    neworderAllQty.add(orderAllQty.get(i));
                }
            }
            
            session.setAttribute("productOrderArr", newproductAllArr);
            session.setAttribute("orderQty", neworderAllQty);
           
            response.sendRedirect("Client/Order.jsp");
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
