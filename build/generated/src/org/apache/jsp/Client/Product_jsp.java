package org.apache.jsp.Client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.math.BigDecimal;
import Models.*;
import java.util.*;

public final class Product_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 List<Comment> commentList = (List<Comment>) session.getAttribute("commentList");
      out.write('\n');
 List<Product> product = (List<Product>) session.getAttribute("product");
      out.write('\n');
 Customers customer = (Customers) session.getAttribute("customer");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Product</title>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Roboto+Serif&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.15.3/css/all.css\" integrity=\"sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://kit.fontawesome.com/89d2bef4b8.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css\"/>\n");
      out.write("        <link href=\"./CSS/Product.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"./CSS/Navbar.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"./CSS/Footer.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"./JS/CustomerViewProduct.js\" type=\"text/javascript\" defer></script>\n");
      out.write("        <script src=\"./JS/Product.js\" type=\"text/javascript\" defer></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <section class=\"slideShow-section\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "./Components/Navbar.jsp", out, false);
      out.write("  \n");
      out.write("        </section>\n");
      out.write("        <!-- Add To Cart -->\n");
      out.write("        <section class=\"addToCart-section\">\n");
      out.write("            <div class=\"addToCart-container\">   \n");
      out.write("                <div class=\"addToCart-contents\">\n");
      out.write("                    <div class=\"addToCart-col2\">\n");
      out.write("                        <div class=\"product-img-container\">\n");
      out.write("                            <img src=\"./Images/");
      out.print( product.get(0).getImage() );
      out.write("\"/>\n");
      out.write("                        </div>\n");
      out.write("                    </div\n");
      out.write("                    <div class=\"addToCart-col2\">\n");
      out.write("                        <div class=\"product-info-display\">\n");
      out.write("                            <h1>");
      out.print( product.get(0).getProductName() );
      out.write("</h1>\n");
      out.write("                            <div class=\"ratings-display\">\n");
      out.write("                                <small>");
      out.print( product.get(0).getAverageRating() );
      out.write("</small>\n");
      out.write("                                ");
 int totalRating = product.get(0).getAverageRating().intValue(); 
      out.write("\n");
      out.write("                                ");
 BigDecimal rating = new BigDecimal(1);
      out.write("\n");
      out.write("                                ");
 if(totalRating == 0){
      out.write("\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                ");
 }else if(totalRating == 1){ 
      out.write("\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                ");
 }else if(totalRating == 2){ 
      out.write("\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                ");
 }else if(totalRating == 3){
      out.write("\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                ");
 }else if(totalRating == 4){
      out.write("\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star-o\"></i>\n");
      out.write("                                ");
 }else if(totalRating == 5){
      out.write("\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                    <i class=\"fa fa-star\"></i>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                                <small>| ");
      out.print( product.get(0).getSold() );
      out.write(" Ratings></small>\n");
      out.write("                            </div><br>\n");
      out.write("                            <small>RM");
      out.print( product.get(0).getPrice() );
      out.write("</small><br>\n");
      out.write("                            ");
 if(customer != null){ 
      out.write("\n");
      out.write("                                <form action=\"../TempAddOrderedProduct\">\n");
      out.write("                                <div class=\"quantity-container\">\n");
      out.write("                                    <p>Quantity</p>\n");
      out.write("                                    <div class=\"quantity-set-container\">\n");
      out.write("                                        <div class=\"subtract-container\">\n");
      out.write("                                            <span id=\"subtract\">-</span>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"result-container\">\n");
      out.write("                                            <input type=\"hidden\" name=\"customerId\" value=\"");
      out.print( customer.getCustomerId() );
      out.write("\">\n");
      out.write("                                            <input type=\"hidden\" name=\"productOrderId\" value=\"");
      out.print( product.get(0).getProductId() );
      out.write("\">\n");
      out.write("                                            <input type=\"hidden\" name=\"productOrderQty\" id=\"qty\">\n");
      out.write("                                            <span id=\"result\">1</span>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"addition-container\">\n");
      out.write("                                            <span id=\"addition\">+</span>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div><br>\n");
      out.write("                                <input type=\"submit\" id=\"addToCart-btn\" value=\"Add To Cart\"/>\n");
      out.write("                            </form>\n");
      out.write("                            ");
 }else{ 
      out.write("\n");
      out.write("                            <form action=\"login.jsp\">\n");
      out.write("                                <div class=\"quantity-container\">\n");
      out.write("                                    <p>Quantity</p>\n");
      out.write("                                    <div class=\"quantity-set-container\">\n");
      out.write("                                        <div class=\"subtract-container\">\n");
      out.write("                                            <span id=\"subtract\">-</span>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"result-container\">\n");
      out.write("                                            <span id=\"result\">1</span>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"addition-container\">\n");
      out.write("                                            <span id=\"addition\">+</span>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div><br>\n");
      out.write("                                <input type=\"submit\" id=\"addToCart-btn\" value=\"Add To Cart\"/>\n");
      out.write("                            </form>\n");
      out.write("                            ");
 } 
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <!-- Product Description -->\n");
      out.write("        <section class=\"productDescription-section\">\n");
      out.write("            <div class=\"productDescription-container\">\n");
      out.write("                <div class=\"productDescription-container-sec\">\n");
      out.write("                    <div class=\"productDescription-title-box\">\n");
      out.write("                        <h1>Product Description</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <p class=\"productDescription\">\n");
      out.write("                        ");
      out.print( product.get(0).getDescription() );
      out.write("\n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <style>\n");
      out.write("            .star-widget label{\n");
      out.write("                font-size: 15px;\n");
      out.write("                color: #444;\n");
      out.write("                padding: 10px;\n");
      out.write("                float: right;\n");
      out.write("                transition: all 0.2s ease;\n");
      out.write("            }\n");
      out.write("            input:not(:checked) ~ label:hover,\n");
      out.write("            input:not(:checked) ~ label:hover ~ label{\n");
      out.write("                color: #fd4;\n");
      out.write("            }\n");
      out.write("            input:checked ~ label{\n");
      out.write("                color: #fd4;\n");
      out.write("            }\n");
      out.write("            input#rate-5:checked ~ label{\n");
      out.write("                color: #fe7;\n");
      out.write("            }\n");
      out.write("            input:checked ~ form{\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("             input.rating-stars{\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("            label.rated{\n");
      out.write("                color: #fe7;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <div class=\"container mt-5 mb-5\">\n");
      out.write("            <div class=\"row height d-flex justify-content-center align-items-center\">\n");
      out.write("                <div class=\"col-md-7\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <div class=\"p-3 row\">\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                <h3 class=\"text-center font-weight-bold\">\n");
      out.write("                                    ");
 Integer commentSize = 0;
                                    for (int x = 0; x < commentList.size(); x++) {   
                                        Comment commentNew = commentList.get(x);
                                        if(product.get(0).getProductId() == commentNew.getProductId().getProductId()) {
                                             commentSize+=1;
                                        }
                                    }
                                    
      out.write("\n");
      out.write("                                    ");
      out.print( commentList.size() );
      out.write("\n");
      out.write("                                </h3>\n");
      out.write("                                <h6 class=\"text-center\">Comments</h6>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <hr style=\"border-top: 8px solid grey;\" class=\"mx-3\">\n");
      out.write("                        <form action=\"../CommentController\" method=\"post\">\n");
      out.write("                            <div class=\"mt-3 d-flex flex-row align-items-center p-3 form-color\">\n");
      out.write("                                <div class=\"col-2\">\n");
      out.write("                                    <img src=\"https://preview.redd.it/gd8mkyj08ip51.jpg?width=640&crop=smart&auto=webp&s=6fe6acb98a3474dd4d9ff8d75a2769fd92245fc1\" width=\"100px\" class=\"rounded-circle mr-2\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-10 px-3\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"d-flex justify-content-between align-items-center\">\n");
      out.write("                                            <div class=\"d-flex flex-row align-items-center\"> \n");
      out.write("                                                <span class=\"mr-2 font-weight-bold\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${customers.fullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("                                                <div class=\"star-widget\">\n");
      out.write("                                                    <input type=\"radio\" name=\"rate\" id=\"rate-5\" class=\"rating-stars\" value=\"5\">\n");
      out.write("                                                    <label for=\"rate-5\" class=\"fas fa-star\"></label>\n");
      out.write("                                                    <input type=\"radio\" name=\"rate\" id=\"rate-4\" class=\"rating-stars\" value=\"4\">\n");
      out.write("                                                    <label for=\"rate-4\" class=\"fas fa-star\"></label>\n");
      out.write("                                                    <input type=\"radio\" name=\"rate\" id=\"rate-3\" class=\"rating-stars\" value=\"3\">\n");
      out.write("                                                    <label for=\"rate-3\" class=\"fas fa-star\"></label>\n");
      out.write("                                                    <input type=\"radio\" name=\"rate\" id=\"rate-2\" class=\"rating-stars\" value=\"2\">\n");
      out.write("                                                    <label for=\"rate-2\" class=\"fas fa-star\"></label>\n");
      out.write("                                                    <input type=\"radio\" name=\"rate\" id=\"rate-1\" class=\"rating-stars\" value=\"1\">\n");
      out.write("                                                    <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" name=\"comments\" placeholder=\"Enter your comment...\"> \n");
      out.write("                                        <input type=\"hidden\" name=\"customerID\" value=\"");
      out.print( customer.getCustomerId() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"productID\" value=\"");
      out.print( product.get(0).getProductId() );
      out.write("\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row py-3\">\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-light btn-lg btn-block\">Submit</button>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        ");
 if (commentList != null) { 
      out.write("\n");
      out.write("                            ");
 for (int i = 0; i < commentList.size(); i++) {   
                                Comment comment = commentList.get(i);
                                if(product.get(0).getProductId() == comment.getProductId().getProductId()) {
                            
      out.write("\n");
      out.write("                            <div>\n");
      out.write("                                <div class=\" d-flex flex-row align-items-center p-3 form-color\">\n");
      out.write("                                    <div class=\"col-2\">\n");
      out.write("                                        <img src=\"https://qph.fs.quoracdn.net/main-qimg-5df8f63d2379b189e8ef7de43b6a0ce2-c\" width=\"100px\" class=\"rounded-circle mr-2\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-10 px-3\">\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"d-flex justify-content-between align-items-center\">\n");
      out.write("                                                <div class=\"d-flex flex-row align-items-center\"> \n");
      out.write("                                                    <span class=\"mr-2 font-weight-bold\">");
      out.print( comment.getCustomerId().getFullname());
      out.write("</span> \n");
      out.write("                                                    <div>\n");
      out.write("                                                        ");

                                                            switch(comment.getRating()) {
                                                               case 1:
                                                                   
      out.write("<label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                   <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                   <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                   <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                   <label for=\"rate-1\" class=\"fas fa-star\"></label>");

                                                                  break;
                                                               case 2:
                                                                  
      out.write("<label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                  <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                  <label for=\"rate-1\" class=\"fas fa-star\"></label>");

                                                                  break;
                                                               case 3:
                                                                  
      out.write("<label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                  <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                  ");

                                                                  break;
                                                               case 4:
                                                                  
      out.write("<label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label for=\"rate-1\" class=\"fas fa-star\"></label>\n");
      out.write("                                                                  ");

                                                                  break;
                                                               case 5:
                                                                  
      out.write("<label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  <label class=\"fas fa-star rated\"></label>\n");
      out.write("                                                                  ");

                                                                  break;
                                                            }
                                                         
      out.write("\n");
      out.write("                                                         <small> ");
      out.print( comment.getRating());
      out.write(" </small>\n");
      out.write("                                                    </div> \n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div>");
      out.print( comment.getContent());
      out.write("</div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            ");
 } 
      out.write("\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "./Components/Footer.jsp", out, false);
      out.write("  \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
