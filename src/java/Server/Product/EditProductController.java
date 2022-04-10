/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server.Product;

import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author lenovo
 */
public class EditProductController extends HttpServlet {

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
            out.println("<title>Servlet EditStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditStaffController at " + request.getContextPath() + "</h1>");
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
        int productId;
        boolean invalidProductId = false;
        Product product;
        try {
            productId = Integer.parseInt((String) request.getParameter("edit_product_id"));
            product = (Product) mgr.createNamedQuery("Product.findByProductId")
                    .setParameter("productId", productId)
                    .getSingleResult();
            if (product != null) {
                // result found, can edit
                request.setAttribute("product", product);
            }
        } catch (NumberFormatException e) {
            invalidProductId = true;
        }

        if (invalidProductId) {
            // redirect user
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>No Product Selected to edit</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script>\n"
                        + "                    alert(`No record selected or invalid Product Id, Please select first.\n"
                        + "                         Enter To Continue`); \n"
                        + "                    window.location='./ProductController';\n"
                        + "                </script>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
        }
        request.getRequestDispatcher("/backend/Product/edit_product.jsp").forward(request, response);
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
        int productId = Integer.parseInt(request.getParameter("productId"));

        String productName = (String) request.getParameter("productName");
        List<String> productNameStatus = Arrays.asList(NO_CHANGE, "");

        String description = (String) request.getParameter("description");
        List<String> descriptionStatus = Arrays.asList(NO_CHANGE, "");

        int quantity = Integer.parseInt((String) request.getParameter("quantity"));
        List<String> quantityStatus = Arrays.asList(NO_CHANGE, "");

        double price = Double.parseDouble((String) request.getParameter("price"));
        List<String> priceStatus = Arrays.asList(NO_CHANGE, "");

        if (productName != null) {
            if (!productName.isEmpty()) {
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

        Product productFromDB = (Product) mgr.createNamedQuery("Product.findByProductId").setParameter("productId", productId).getSingleResult();
        boolean updateRecord = false;
        if (productNameStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            productFromDB.setProductName(productName);
        }
        if (descriptionStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            productFromDB.setDescription(description);
        }
        if (quantityStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            productFromDB.setQuantity(quantity);
        }
        if (priceStatus.get(0).equals(VALUE_CHANGED)) {
            updateRecord = true;
            productFromDB.setPrice(BigDecimal.valueOf(price));
        }
        if (updateRecord) {
            try {
                utx.begin();
                mgr.merge(productFromDB);
                utx.commit();
            } catch (Exception e) {
            }
        }
        productFromDB = (Product) mgr.createNamedQuery("Product.findByProductId").setParameter("productId", productId).getSingleResult();
        request.setAttribute("product", productFromDB);
        request.setAttribute("productNameStatus", productNameStatus);
        request.setAttribute("descriptionStatus", descriptionStatus);
        request.setAttribute("quantityStatus", quantityStatus);
        request.setAttribute("priceStatus", priceStatus);
        request.getRequestDispatcher("/backend/Product/edit_product.jsp").forward(request, response);
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
