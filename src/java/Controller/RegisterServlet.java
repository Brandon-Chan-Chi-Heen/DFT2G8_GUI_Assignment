/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;



import Models.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Henry
 */
public class RegisterServlet extends HttpServlet {

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
    
        Query checkUserNameExist = em.createNamedQuery("Customers.findByUsername").setParameter("username", userName);
        List<Customers> checkUserName = checkUserNameExist.getResultList();
        if(userName.isEmpty()){
            errors.add("Your <b>User Name</b> cannot be empty!");
        } else if(userName.length() > 30){
            errors.add("Your <b>User Name</b> must be less than 30 characters!");
        }else if(userName.length() < 5){
            errors.add("Your <b>User Name</b> must be at least 5 characters!");
        }else if(!checkUserName.isEmpty()){
            errors.add("<b>User name</b> exists in our database, no duplicate <b>user name</b> allowed!");
        }
            
         if(name.isEmpty()){
            errors.add("Your <b>name</b> cannot be empty!");
        } else if(name.length() > 40){
            errors.add("Your <b>name</b> must be less than 40 characters!");
        }else if(name.length() < 5){
            errors.add("Your <b>Name</b> must be at least 5 characters!");
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
        }
               
        
        //If there are errors.
        if (!errors.isEmpty()) {
            Customers c = new Customers();
            
            c.setUsername(request.getParameter("username"));
            c.setPassword(request.getParameter("password"));
            c.setFullname(request.getParameter("name"));
            c.setEmail(request.getParameter("e-mail"));
            
            
            String errorList = "<ul>";       
            for (String error : errors) {
                errorList += "<li>" + error + "</li>";
            }
            errorList += "</ul>";
            
            
            request.setAttribute("errorMsg", errorList);
            request.setAttribute("customer", c);           
            request.getRequestDispatcher("Client/register.jsp").forward(request, response);
        } else {
            try {
                Customers addCustomer = new Customers(userName, password, email, name);            
                utx.begin();
                em.persist(addCustomer);
                utx.commit();
                request.setAttribute("successMessage", "Registration done, please login to continue.");
                request.getRequestDispatcher("Client/login.jsp").forward(request, response);
            } catch (Exception ex) {
                out.println(ex.getMessage());
            } finally {
                out.close();
            }
        }

    }

}
