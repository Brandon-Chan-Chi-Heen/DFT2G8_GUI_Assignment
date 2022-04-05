/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;


import entity.CustomerDA;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Henry
 */

public class RegisterServlet extends HttpServlet {

   private CustomerDA cd;

    @Override
    public void init() throws ServletException {
        cd = new CustomerDA();
    }

    public static boolean pregMatch(String pattern, String content){
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(content);
        boolean b = m.matches();
       return b;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String cPassword = request.getParameter("password2");
        String name = request.getParameter("name");
        String email = request.getParameter("e-mail");
        ArrayList<String> errors = new ArrayList<String>();
        String patternUserName = "^[A-Za-z]\\w{5,29}$";
        String patternName = "^[a-zA-Z\\\\s]+";
        String patternPass1 = "(.*[0-9].*)";
        String patternPass2 = "(.*[A-Z].*)";
        String patternPass3 = "(.*[a-z].*)";
        String patternPass4 = "(.*[@,#,$,%].*$)";
        String patternEmail = "^(.+)@(\\S+)$";
        
        PrintWriter out = response.getWriter();
    
        if(userName.isEmpty()){
            errors.add("Your <b>User Name</b> cannot be empty!");
        } else if(userName.length() > 30){
            errors.add("Your <b>User Name</b> must be less than 30 characters!");
        }
         else if (!pregMatch(patternUserName, userName)) {
            errors.add("There are invalid letters in <b>User Name</b>!");
        }
            
         if(name.isEmpty()){
            errors.add("Your <b>name</b> cannot be empty!");
        } else if(name.length() > 40){
            errors.add("Your <b>name</b> must be less than 40 characters!");
        }
         else if (!pregMatch(patternName, name)) {
            errors.add("There are invalid letters in <b>Name</b>!");
        }
        
        
        if (password.isEmpty() || cPassword.isEmpty()) {
            errors.add("<b>Password</b> cannot be empty!");
        } else if (password.length() > 30 || password.length() < 8) {
            errors.add("<b>Password</b> must between 8 to 30 characters!");
        } else if (!pregMatch(patternPass1, password)) {
            errors.add("<b>Password</b> must contain at least 1 number!");
        } else if (!pregMatch(patternPass2, password)) {
            errors.add("<b>Password</b> must contain at least 1 capital letter!");
        } else if (!pregMatch(patternPass3, password)) {
            errors.add("<b>Password</b> must contain at least 1 lowercase letter!");
        } else if (!pregMatch(patternPass4, password)) {
            errors.add("<b>Password</b> must have atleast one special character among @#$%!");
        } else if (!cPassword.isEmpty()) {
            if (!password.equals(cPassword)) {
                errors.add("<b>Confirmed Password</b> must be the same with your Password!");
            }else{
                request.setAttribute("cPassword", request.getParameter("password"));  
            }
        }
        
        if(email.isEmpty()){
            errors.add("<b>E-mail</b> cannot be empty!");
        }else if(!pregMatch(patternEmail, password)){
            errors.add("Please type a proper <b>E-mail address</b>!");
        }
               
        
        //If there are errors.
        if (!errors.isEmpty()) {
            Customer c = new Customer();
            
            c.setUsername(request.getParameter("username"));
            c.setPassword(request.getParameter("password"));
            c.setName(request.getParameter("name"));
            c.setEmail(request.getParameter("e-mail"));
            
            String errorList = "<ul>";       
            for (String error : errors) {
                errorList += "<li>" + error + "</li>";
            }
            errorList += "</ul>";
            
            
            request.setAttribute("errorMsg", errorList);
            request.setAttribute("customer", c);           
            request.getRequestDispatcher("secureCustomer/register.jsp").forward(request, response);
        } else {
            try {
                Customer addCustomer = new Customer(userName, password, email, name);
                cd.addRecord(addCustomer);
                request.setAttribute("successMessage", "Registration done, please login to continue.");
                request.getRequestDispatcher("secureCustomer/login.jsp").forward(request, response);
            } catch (Exception ex) {
                out.println(ex.getMessage());
            } finally {
                out.close();
            }
        }

    }

}
