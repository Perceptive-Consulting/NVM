/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2015-07-16 09:03:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.admin.landlord;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class landLordDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/resource/perpetual/admin/landlord/landlordDetails.js\"></script>\r\n");
      out.write(" <div class=\"container-ar\">\r\n");
      out.write("  <section class=\"contant-area\">\r\n");
      out.write("    <div class=\"button\"><button id=\"allLandLordsId\">Back</button><span>&nbsp;&nbsp;&nbsp;</span><button style=\"display: none;\">Further Activities</button></div>\r\n");
      out.write("    <div class=\"rgpinnew\">\r\n");
      out.write("          <ul>\r\n");
      out.write("            <li><strong>Name</strong><samp>:</samp><span id=\"name\"></span></li>\r\n");
      out.write("            <li><strong>Username</strong><samp>:</samp><span id=\"userName\"></span></li>\r\n");
      out.write("            <li><strong>Password</strong><samp>:</samp><span id=\"password\"></span></li>\r\n");
      out.write("            <li><strong>Property Registered</strong><samp>:</samp><span id=\"propertyCount\"></span></li>\r\n");
      out.write("            <li><strong>Address</strong><samp>:</samp><span id=\"address\"></span></li>\r\n");
      out.write("            <li><strong>Zip Code</strong><samp>:</samp><span id=\"zipCode\"></span></li>\r\n");
      out.write("            <li><strong>City</strong><samp>:</samp><span id=\"city\"></span></li>\r\n");
      out.write("            <li><strong>County</strong><samp>:</samp><span id=\"county\"></span></li>\r\n");
      out.write("            <li><strong>Primary Phone Number</strong><samp>:</samp><span id=\"phone\"></span></li>\r\n");
      out.write("            <li><strong>Secondary Phone Number</strong><samp>:</samp><span id=\"otherPhone\"></span></li>\r\n");
      out.write("            <li><strong>Email Id</strong><samp>:</samp><span id=\"email\"></span></li>\r\n");
      out.write("            <li><strong>Reference</strong><samp>:</samp><span id=\"reference\"></span></li>\r\n");
      out.write("            \r\n");
      out.write("            <li><strong>Created On</strong><samp>:</samp><span id=\"createdOn\"></span></li>\r\n");
      out.write("            <li><strong>Created By</strong><samp>:</samp><span id=\"createdBy\"></span></li>\r\n");
      out.write("            <li><strong>Modified On</strong><samp>:</samp><span id=\"modifiedOn\"></span></li>\r\n");
      out.write("            <li><strong>Modified By</strong><samp>:</samp><span id=\"modifiedBy\"></span></li>\r\n");
      out.write("          </ul>\r\n");
      out.write("          <div class=\"clearfix\"></div>\r\n");
      out.write("        </div>    \r\n");
      out.write("  </section>\r\n");
      out.write("  </div>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}