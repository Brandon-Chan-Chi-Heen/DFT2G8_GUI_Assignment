/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entity.CustomerDA;
import entity.Customer;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Henry
 */

public class LoginServlet extends HttpServlet {

    private CustomerDA cd;

    @Override
    public void init() throws ServletException {
        cd = new CustomerDA();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");
      
        try {
            Customer c = cd.checkLogin(userName, password);
            if (c != null) {
                HttpSession session = request.getSession();
                session.setAttribute("customer", c);
                request.getRequestDispatcher("secureCustomer/welcome.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Data not Found, Click on Register button.");
                request.getRequestDispatcher("secureCustomer/login.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

 
}
