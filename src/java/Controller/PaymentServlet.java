/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.*;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter; 
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.transaction.UserTransaction;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Henry
 */


public class PaymentServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    public static boolean pregMatch(String pattern, String content){
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(content);
        boolean b = m.matches();
        return b;
    }

    public boolean isAlpha(String name) {
        return name.matches("[a-zA-Z]+");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        ArrayList<String> errors = new ArrayList<String>();
        ArrayList<String> addressError = new ArrayList<String>();
        Date date = new Date();
        String shippingAddress = request.getParameter("shippingAddress");
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        String CVVNumber = request.getParameter("CVVNumber");
        String patternCardName = "[a-zA-Z]+";
        String patternCardNumber = "/^([0-9]{4}\\s){3}[0-9]{4}$/";
        String patternCVV = "^[0-9]{3,4}$";
        Staff staff = new Staff();
        HttpSession session = request.getSession();
        
        staff.setStaffId(1);
        
        Customers c = (Customers) session.getAttribute("customer");
        List<Product> productOrderArr = (List<Product>) session.getAttribute("productAllOrdered");
        List<Integer> productQty = (List<Integer>) session.getAttribute("productAllQty");
        
        String subtotal = session.getAttribute("subtotal").toString();
        BigDecimal total = new BigDecimal(subtotal);
              
        PrintWriter out = response.getWriter();

        c.setCustomerId(c.getCustomerId());
        

        if (cardName.isEmpty()) {
            errors.add("Your <b>card name</b> cannot be empty!");
        } else if (cardName.length() > 40) {
            errors.add("Your <b>card name</b> must be less than 40 characters!");
        } 
        
        if (cardNumber.isEmpty()) {
            errors.add("Your <b>card number</b> cannot be empty!");
        } else if (cardNumber.length() > 20) {
            errors.add("Your <b>card number</b> must be less than 19 characters!");
        } 
        
        if (CVVNumber.isEmpty()) {
            errors.add("Your <b>CVV number</b> cannot be empty!");
        }

        //If there are errors.
        if (!errors.isEmpty()) {
            String errorList = "<ul>";
            for (String error : errors) {
                errorList += "<li>" + error + "</li>";
            }
            errorList += "</ul>";
            request.setAttribute("errorMsg", errorList);
                                    
              response.sendRedirect("Client/checkOut.jsp");
        } else {
            try {
                
                Orders addOrders = new Orders(total, shippingAddress, date, "pending", c);
                utx.begin();
                em.persist(addOrders);
                utx.commit();
                
                
           
                Query orderId = em.createNamedQuery("Orders.findByOrderId").setParameter("orderId", addOrders.getOrderId());
                List<Orders> orderResult = orderId.getResultList();
                
                for (int i = 0; i < productOrderArr.size(); i++) {
                    OrderDetail addOrderDetails = new OrderDetail(productQty.get(i), total, orderResult.get(0), productOrderArr.get(i), staff);
                    utx.begin();
                    em.persist(addOrderDetails);
                    utx.commit();
                }


                session.removeAttribute("productOrderArr");
               response.sendRedirect("Client/paymentSuccessful.jsp");
            } catch (Exception ex) {
                out.println(ex.getMessage());
            } finally {
                out.close();
            }
        }
        
        
    }

}