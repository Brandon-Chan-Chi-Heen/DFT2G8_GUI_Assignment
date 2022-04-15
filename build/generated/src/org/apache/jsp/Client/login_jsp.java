package org.apache.jsp.Client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      Models.Customers customers = null;
      synchronized (session) {
        customers = (Models.Customers) _jspx_page_context.getAttribute("customers", PageContext.SESSION_SCOPE);
        if (customers == null){
          customers = new Models.Customers();
          _jspx_page_context.setAttribute("customers", customers, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/Client/CSS/loginCSS.css\">   \n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.4.1.min.js\" integrity=\"sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Customer Login page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"login-box\">\n");
      out.write("            <h1>Customer Login Page</h1>\n");
      out.write("            <form action=\"");
      out.print(request.getContextPath());
      out.write("/LoginServlet\" method=\"post\" id=\"loginForm\">\n");
      out.write("                <h3 style=\"color:blueviolet;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${errorMessage}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h3>\n");
      out.write("                <h3 style=\"color:green;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${successMessage}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h3>\n");
      out.write("\n");
      out.write("                <label>User Name :</label> \n");
      out.write("                <input type=\"text\" name=\"username\" placeholder=\"user name\"/>\n");
      out.write("\n");
      out.write("                <label>Password :</label> \n");
      out.write("                <input type=\"password\" name=\"password\" placeholder=\"password\"/>\n");
      out.write("\n");
      out.write("                <button type=\"submit\" name=\"submit\" value=\"Login\">Login</button>\n");
      out.write("\n");
      out.write("                <p class=\"para-2\">Don't have an account? <a href=\"");
      out.print(request.getContextPath());
      out.write("/Client/register.jsp\">Register here</a></p>\n");
      out.write("            </form>    \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write(" \n");
      out.write("    $(document).ready(function() {\n");
      out.write("        $(\"#loginForm\").validate({\n");
      out.write("            rules: {\n");
      out.write("                username: {\n");
      out.write("                    required: true,\n");
      out.write("    \n");
      out.write("                },\n");
      out.write("         \n");
      out.write("                password: \"required\",\n");
      out.write("            },\n");
      out.write("             \n");
      out.write("            messages: {\n");
      out.write("                username: {\n");
      out.write("                    required: \" Please enter username! \",\n");
      out.write("       \n");
      out.write("                },\n");
      out.write("                 \n");
      out.write("                password: \" Please enter password! \"\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write(" \n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("</html>\n");
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
