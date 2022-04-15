package org.apache.jsp.backend;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminlogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"Mark Otto, Jacob Thornton, and Bootstrap contributors\">\n");
      out.write("    <meta name=\"generator\" content=\"Hugo 0.84.0\">\n");
      out.write("    <title>Admin Panel</title>\n");
      out.write("\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    <link href=\"");
      out.print( request.getContextPath() );
      out.write("/backend/Login.css\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"bg-dark text-center\">\n");
      out.write("\n");
      out.write("    <div class=\"form-signin container bg-white\">\n");
      out.write("\n");
      out.write("        <form class=\"needs-validation\" action=\"");
      out.print(request.getContextPath());
      out.write("/AdminLogin\" method=\"POST\" novalidate>\n");
      out.write("            <h1 class=\"\">Admin Panel</h1>\n");
      out.write("\n");
      out.write("            <div class=\"form-floating\">\n");
      out.write("                ");

                    boolean validAdminID = true;
                    try {
                        validAdminID = request.getAttribute("validAdminID") != Boolean.FALSE;
                    } catch (Exception e){
                        validAdminID = true;
                    }
                    String adminInputErrorClass = !validAdminID ? "is-invalid" : "";
                
      out.write("\n");
      out.write("                <input name=\"adminID\" type=\"text\" class=\"form-control ");
      out.print( adminInputErrorClass);
      out.write("\" id=\"floatingAdminID\" placeholder=\"1001001\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${adminID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                <label for=\"floatingAdminID\">ID</label>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-floating\">\n");
      out.write("                <input name=\"password\" type=\"password\" class=\"form-control ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ emptyPassword.toString().isEmpty() ? \"is-invalid\" : \"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" id=\"floatingPassword\" placeholder=\"Password\" required>\n");
      out.write("                <label for=\"floatingPassword\">Password</label>\n");
      out.write("            </div>\n");
      out.write("               ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${validCredentials != null && !validCredentials ? \"<div class=\\\"mb-3 text-danger\\\">Wrong Email or Password</div>\" : \"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("            <button class=\"w-100 btn btn-lg btn-primary\" type=\"submit\">Sign in</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("</body>\n");
      out.write("\n");
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
