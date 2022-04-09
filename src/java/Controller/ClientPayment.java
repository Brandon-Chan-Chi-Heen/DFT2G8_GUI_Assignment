/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.Customers;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;  
import Models.Product;
import Models.Orders;
import Models.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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


public class ClientPayment extends HttpServlet {

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
        String patternCardNumber = "/^([0-9]{4}\\\\\\\\s){3}[0-9]{4}$/";
        String patternCVV = "^[0-9]{3,4}$";
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");
        Orders order = new Orders();
        String customerId = customer.getCustomerId().toString();
        BigDecimal bdValue = new BigDecimal("63745");

        PrintWriter out = response.getWriter();
  
        if (cardName.isEmpty()) {
            errors.add("Your <b>card name</b> cannot be empty!");
        } else if (cardName.length() > 40) {
            errors.add("Your <b>card name</b> must be less than 40 characters!");
        } else if (!pregMatch(patternCardName, cardName)) {
            errors.add("There are invalid letters in <b>Card name</b>!");
        } 
        
        if (cardNumber.isEmpty()) {
            errors.add("Your <b>card number</b> cannot be empty!");
        } else if (cardNumber.length() > 20) {
            errors.add("Your <b>card number</b> must be less than 19 characters!");
        } else if (!pregMatch(patternCardNumber, cardNumber)) {
            errors.add("There are invalid letters in <b>Card number</b>! Format: 1111 1111 1111 1111");
        }
        
        if (CVVNumber.isEmpty()) {
            errors.add("Your <b>CVV number</b> cannot be empty!");
        } else if (!pregMatch(patternCVV, CVVNumber)) {
            errors.add("There are invalid letters in <b>CVV number</b>!");
        }

        //If there are errors.
        if (!errors.isEmpty()) {
            String errorList = "<ul>";
            for (String error : errors) {
                errorList += "<li>" + error + "</li>";
            }
            errorList += "</ul>";
            request.setAttribute("errorMsg", errorList);
            if (!addressError.isEmpty()) {
                request.setAttribute("addressErrorMsg", addressError);
            }
            order.setShippingAddress(shippingAddress);
             request.setAttribute("order", order);
            request.getRequestDispatcher("/Client/Order/checkOut.jsp").forward(request, response);
        } else {
            try {
//                Orders addAddress = new Orders(bdValue, date, "pending", );
//                utx.begin();
//                em.persist(addAddress);
//                utx.commit();
                request.setAttribute("successMessage", "Registration done, please login to continue.");
                request.getRequestDispatcher("/Client/LoginRegistration/login.jsp").forward(request, response);
            } catch (Exception ex) {
                out.println(ex.getMessage());
            } finally {
                out.close();
            }
        }
        
        
        

    }

}
