/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2015-07-15 10:43:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.admin.pmc.subPMC;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class subpmcDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("/resource/perpetual/admin/pmc/subPMC/subpmcDetails.js\"></script> \r\n");
      out.write(" <style>\r\n");
      out.write("\t.chosen-container-multi .chosen-choices {\r\n");
      out.write("\t\twidth: 100% !important;\r\n");
      out.write("\t}\r\n");
      out.write("\t.chosen-choices .search-choice {\r\n");
      out.write("\t\tfont-size: 13px;\r\n");
      out.write("\t\twidth: auto;\r\n");
      out.write("\t}\r\n");
      out.write("\t.chosen-choices .search-choice span {\r\n");
      out.write("\t\tfloat: left;\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t}\r\n");
      out.write("\t.chosen-container {\r\n");
      out.write("\t    width: 100% !important;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("<div class=\"container-ar\">\r\n");
      out.write("\t<section class=\"contant-area\">\r\n");
      out.write("    <div class=\"button\"><button id=\"subPMCDetailsBackBtn\">Back</button><span>&nbsp;&nbsp;&nbsp;</span><button id=\"enableId\">Enable</button>\r\n");
      out.write("    <button id=\"disableId\" style=\"display: none;\">Disable</button><span>&nbsp;&nbsp;&nbsp;</span><button id=\"resetPassword\">Reset Password</button></div>\r\n");
      out.write("    <div class=\"rgpinnew\">\r\n");
      out.write("          <ul>\r\n");
      out.write("            <li><strong>Company Name</strong><samp>:</samp><span id=\"companyName\"></span></li>\r\n");
      out.write("            <li><strong>Authorised Person</strong><samp>:</samp><span id=\"authorisedPerson\"></span></li>\r\n");
      out.write("            <li><strong>Reference Number</strong><samp>:</samp><span id=\"referenceNumber\"></span></li>\r\n");
      out.write("            <li><strong>Web URL</strong><samp>:</samp><span id=\"webURL\"></span></li>\r\n");
      out.write("            <li><strong>Enabled</strong><samp>:</samp><span id=\"enabled\"></span></li>\r\n");
      out.write("            <li>\r\n");
      out.write("            \t<strong>Cities Covered</strong><samp>:</samp><span id=\"subPMCCitiesCovered\"></span><span style=\"display: none;\" id=\"subPMCCitiesCoveredIdStr\"></span>\r\n");
      out.write("\t            <h4><input type=\"button\" id=\"editSubPMCCity\" name=\"edit\" value=\"Edit\" class=\"edit\" style=\"height: 20px;\" /> </h4>\r\n");
      out.write("\t           \t<div id=\"editSubPMCCityDiv\" class=\"edit-prof\" style=\"display: none;\">\r\n");
      out.write("\t           \t\t<select data-placeholder=\"Choose Cities...\" name=\"subPMCCity\" class=\"chosen-select-sub-pmc-city\" multiple style=\"width:auto;\" tabindex=\"4\" id=\"subPMCCityId\"></select>\r\n");
      out.write("\t\t\t\t\t<label id=\"subPMCCityLabel\" style=\"color:red; display: none;margin-top: 3%\">Please Select Cities.</label>\r\n");
      out.write("\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"subPMCCUpdateBtn\" type=\"button\" value=\"Update\" class=\"btn-class\" />\r\n");
      out.write("\t\t\t\t\t\t<input id=\"subPMCCityCancelBtn\" type=\"button\" value=\"Cancel\" class=\"btn-class\" />\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t           \t</div>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li><strong>Username</strong><samp>:</samp><span id=\"userName\"></span></li>\r\n");
      out.write("            <li><strong>Password</strong><samp>:</samp><span id=\"password\"></span></li>\r\n");
      out.write("            <li><strong>EmailId</strong><samp>:</samp><span id=\"emailId\"></span></li>\r\n");
      out.write("            <li><strong>Phone Number</strong><samp>:</samp><span id=\"phoneNumber\"></span></li>\r\n");
      out.write("            <li><strong>Address Line1</strong><samp>:</samp><span id=\"addressLine1\"></span></li>\r\n");
      out.write("            <li><strong>Address Line2</strong><samp>:</samp><span id=\"addressLine2\"></span></li>\r\n");
      out.write("            <li><strong>County</strong><samp>:</samp><span id=\"county\"></span></li>\r\n");
      out.write("            <li><strong>Postcode</strong><samp>:</samp><span id=\"postCode\"></span></li>\r\n");
      out.write("            <li><strong>Landmark</strong><samp>:</samp><span id=\"landmark\"></span></li>\r\n");
      out.write("            <li><strong>Created On</strong><samp>:</samp><span id=\"createdOn\"></span></li>\r\n");
      out.write("            <li id=\"createdById\"><strong>Created By</strong><samp>:</samp><span id=\"createdBy\"></span></li>\r\n");
      out.write("            <li><strong>Modified On</strong><samp>:</samp><span id=\"modifiedOn\"></span></li>\r\n");
      out.write("            <li id=\"modifiedById\"><strong>Modified By</strong><samp>:</samp><span id=\"modifiedBy\"></span></li>\r\n");
      out.write("          </ul>\r\n");
      out.write("          <div class=\"clearfix\"></div>\r\n");
      out.write("        </div>    \r\n");
      out.write("\t</section>\r\n");
      out.write("</div>");
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
