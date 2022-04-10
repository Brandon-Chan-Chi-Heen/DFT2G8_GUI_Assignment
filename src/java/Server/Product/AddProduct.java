/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Product;

import Models.Product;
import Models.Priviledge;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author lenovo
 */
public class AddProduct extends HttpServlet {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaff at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String NO_CHANGE = "0", VALUE_CHANGED = "1", INPUT_ERROR = "2";

        String productName = (String) request.getParameter("productName");
        List<String> productNameStatus = Arrays.asList(NO_CHANGE, "");

        String description = (String) request.getParameter("description");
        List<String> descriptionStatus = Arrays.asList(NO_CHANGE, "");

        int quantity = Integer.parseInt((String) request.getParameter("quantity"));
        List<String> quantityStatus = Arrays.asList(NO_CHANGE, "");

        double price = Double.parseDouble((String) request.getParameter("price"));
        List<String> priceStatus = Arrays.asList(NO_CHANGE, "");

        Pattern p = Pattern.compile("^[a-zA-Z\\s]*$");
        Matcher m;
        if (productName != null) {
            m = p.matcher(productName);
            if (m.matches() && !productName.isEmpty()) {
                productNameStatus.set(0, VALUE_CHANGED);
                productNameStatus.set(1, "Successfully changed");
            } else {
                productNameStatus.set(0, INPUT_ERROR);
                productNameStatus.set(1, "Invalid Product Name");
            }
        }

        if (description != null) {
            if (!description.isEmpty()) {
                descriptionStatus.set(0, VALUE_CHANGED);
                descriptionStatus.set(1, "Successfully changed");
            } else {
                descriptionStatus.set(0, INPUT_ERROR);
                descriptionStatus.set(1, "Description cannot be empty");
            }
        }

        if (quantity > 0) {
            quantityStatus.set(0, VALUE_CHANGED);
            quantityStatus.set(1, "Ok!");
        } else {
            quantityStatus.set(0, INPUT_ERROR);
            quantityStatus.set(1, "Quantity must be more than 0");
        }

        if (price > 0) {
            priceStatus.set(0, VALUE_CHANGED);
            priceStatus.set(1, "Ok!");
        } else {
            priceStatus.set(0, INPUT_ERROR);
            priceStatus.set(1, "Price must be more than 0");
        }

        boolean allValidValues = productNameStatus.get(0).equals(VALUE_CHANGED)
                && descriptionStatus.get(0).equals(VALUE_CHANGED)
                && quantityStatus.get(0).equals(VALUE_CHANGED)
                && priceStatus.get(0).equals(VALUE_CHANGED);

        Product product = new Product();
        product.setProductName(productName == null ? "" : productName);
        product.setDescription(description == null ? "" : description);
        product.setQuantity(quantity);
        product.setPrice(BigDecimal.valueOf(price));
        if (allValidValues) {
            try {
                utx.begin();
                mgr.persist(product);
                utx.commit();
                response.sendRedirect(request.getContextPath() + "/ProductController");
                return;
            } catch (Exception e) {
            }
        } else {
            request.setAttribute("product", product);
            request.setAttribute("productNameStatus", productNameStatus);
            request.setAttribute("descriptionStatus", descriptionStatus);
            request.setAttribute("quantityStatus", quantityStatus);
            request.setAttribute("priceStatus", priceStatus);
        }

        request.getRequestDispatcher("/backend/Product/add_product.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
