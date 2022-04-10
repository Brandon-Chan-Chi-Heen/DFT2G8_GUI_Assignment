/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customers;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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

    @PersistenceContext
    EntityManager em;

//    private CustomerDA cd;
//
//    @Override
//    public void init() throws ServletException {
//        cd = new CustomerDA();
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            Query checkLogin = em.createQuery("SELECT c FROM Customers c WHERE c.username = :username AND c.password = :password")
                    .setParameter("username", userName).setParameter("password", password);
            List<Customers> customerList = checkLogin.getResultList();
            if (!customerList.isEmpty()) {
                Query getCustomers = em.createNamedQuery("Customers.findByUsername").setParameter("username", userName);
                Customers c = (Customers) getCustomers.getSingleResult();
                HttpSession session = request.getSession();
                session.setAttribute("customer", c);
//                request.getRequestDispatcher("Client/CustomerViewProduct.jsp").forward(request, response);
                response.sendRedirect("Client/CustomerViewProduct.jsp");
            } else {
                request.setAttribute("errorMessage", "Data not Found, Click on Register button.");
                request.getRequestDispatcher("Client/login.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
