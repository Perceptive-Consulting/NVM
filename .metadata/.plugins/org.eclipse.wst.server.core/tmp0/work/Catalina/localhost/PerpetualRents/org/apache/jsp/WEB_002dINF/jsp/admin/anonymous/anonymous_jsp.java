/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2015-07-07 07:24:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.admin.anonymous;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class anonymous_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("/resource/perpetual/admin/anonymous/anonymous.js\"></script>\n");
      out.write("<div class=\"container\">\n");
      out.write("  <sections class=\"contant-area\" style=\"height:1500px;\">\n");
      out.write("    <div class=\"button\">\n");
      out.write("    <button id=\"viewButtonId\">View</button>\n");
      out.write("      <button id=\"editButtonId\" style=\"display: none;\">Edit</button>\n");
      out.write("      <button id=\"createButtonId\" style=\"display: none;\">Create</button>\n");
      out.write("      <button id=\"deleteButtonId\" style=\"display: none;\">Delete</button>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <table id=\"dataTableId\" class=\"table display table-bordered\"  cellspacing=\"0\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>S.No.</th>\n");
      out.write("            <th>Name</th>\n");
      out.write("            <th>Email</th>\n");
      out.write("            <th>Contact Number</th>\n");
      out.write("            <th width=\"18%\">Address</th>\n");
      out.write("            <th>Message</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("  </sections>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<div style=\"display:none;\">\n");
      out.write("  <div id='edit'>\n");
      out.write("    <form id=\"editPopupFormId\" action=\"javascript:editPopupForm()\">\n");
      out.write("      <h1>Edit Contractor Details</h1>\n");
      out.write("      <div class=\"form-element\">\n");
      out.write("        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("          <tr>\n");
      out.write("            <td width=\"40%\"><label>Contact Person:</label></td>\n");
      out.write("            <td width=\"60%\"><input type=\"text\" value=\"\" class=\"\" name=\"contactPerson\" id=\"contact_person\"/></td>\n");
      out.write("          </tr>         \n");
      out.write("          <tr>\n");
      out.write("            <td><label>Company Name:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"companyName\" id=\"company_name\"/></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Address Line 1:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"addressObj.addressLine1\" id=\"address_line1\"/></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Address Line 2:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"addressObj.addressLine2\" id=\"address_line2\"/></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>City:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"addressObj.city\" id=\"city\"/></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Post Code:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"addressObj.postCode\" id=\"postCode\"/></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>County:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"addressObj.county\" id=\"county\"/></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>VAT No:</label></td>\n");
      out.write("            <td><input type=\"text\" value=\"\" class=\"\" name=\"vatNo\" id=\"vat_no\"/></td>\n");
      out.write("          </tr>\n");
      out.write("        </table>\n");
      out.write("      </div>\n");
      out.write("      <div id=\"edit_footer\"><input type=\"submit\" value=\"Update\" /></div>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <div id='create'>\n");
      out.write("    <form id=\"createPopupFormId\" action=\"javascript:createPopupForm()\">\n");
      out.write("      <h1>Register Contractor</h1>\n");
      out.write("      <div class=\"form-element1\" style=\"overflow-y:scroll; height: 600px\">\n");
      out.write("        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("          <tr>\n");
      out.write("            <td width=\"25%\"><label>Name of Contractor:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"contactPerson\" /></td>\n");
      out.write("            <td width=\"25%\"><label>Company Name:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"companyName\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Vat Number:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"vatNo\" /></td>\n");
      out.write("            <td><label>Web Site Link:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"weburl\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Post Code:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"addressObj.postCode\" /></td>\n");
      out.write("            <td><label>City:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"addressObj.city\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>County:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"addressObj.county\" /></td>\n");
      out.write("            <td><label>Address:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"addressObj.addressLine1\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Cities Serviced:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"cities[0].city\" /></td>\n");
      out.write("            <td><label>Qualification:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"expertiseObj.qualification\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>User Name:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"loginObj.username\" /></td>\n");
      out.write("            <td><label>Password:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"loginObj.password\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td><label>Place of Training:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"expertiseObj.trainingPlace\" /></td>\n");
      out.write("            <td><label>Years of Experience:</label>\n");
      out.write("            <input type=\"text\" value=\"\" class=\"\" name=\"expertiseObj.experienceYears\" /></td>\n");
      out.write("          </tr>\n");
      out.write("          <td><label>Functionality</label>\n");
      out.write("                  <select name=\"expertiseObj.functionality\" id=\"functionality\">\n");
      out.write("                    <option value=\"Electrical Installation\">Electrical Installation</option>\n");
      out.write("\t                  </select></td>      \n");
      out.write("                \n");
      out.write("             <tr>\n");
      out.write("                <td style=\" width:100%;\" colspan=\"2\"><label>References</label>\n");
      out.write("                </td></tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("                    <tr>\n");
      out.write("                      <td><label style=\"color:#e33a0c;\">Reference - 1</label></td>\n");
      out.write("                      <td><label>Property Owner Name</label>\n");
      out.write("                        <input type=\"text\" class=\"\" name=\"expertiseObj.referenceOwnerName1\" id=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                      <td>&nbsp;</td>\n");
      out.write("                      <td><label>Property Owner Contact No.</label>\n");
      out.write("                        <input type=\"text\" class=\"\" name=\"expertiseObj.referenceOwnercontact1\" id=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                      <td>&nbsp;</td>\n");
      out.write("                      <td><label>Job Completion Date</label>\n");
      out.write("                        <input type=\"text\" class=\"\" name=\"expertiseObj.referenceCompletionDate1\" id=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                  </table></tr>\n");
      out.write("                  \n");
      out.write("                  <tr>\n");
      out.write("                <td style=\" width:100%;\" colspan=\"2\"><label></label>\n");
      out.write("                </td></tr>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                  <tr>\n");
      out.write("                  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("                    <tr>\n");
      out.write("                      <td><label style=\"color:#e33a0c;\">Reference - 2</label></td>\n");
      out.write("                      <td><label>Property Owner Name</label>\n");
      out.write("                        <input type=\"text\" class=\"\" name=\"expertiseObj.referenceOwnerName2\" id=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                      <td>&nbsp;</td>\n");
      out.write("                      <td><label>Property Owner Contact No.</label>\n");
      out.write("                        <input type=\"text\" class=\"\" name=\"expertiseObj.referenceOwnercontact2\" id=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                      <td>&nbsp;</td>\n");
      out.write("                      <td><label>Job Completion Date</label>\n");
      out.write("                        <input type=\"text\" class=\"\" name=\"expertiseObj.referenceCompletionDate2\" id=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                  </table></tr>\n");
      out.write("        </table>\n");
      out.write("      </div>\n");
      out.write("      <div id=\"create_footer\"><input type=\"submit\" value=\"Create\" /></div>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("    <div id='delete'>\n");
      out.write("    <form id=\"deletePopupFormId\" action=\"javascript:editPopupForm()\">\n");
      out.write("      <h1>Delete Contractor</h1>\n");
      out.write("      <div class=\"form-element\">\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("      <div id=\"delete_footer\"><input id=\"delete_yes\" type=\"button\" value=\"Yes\" style=\"background-color:#E33A0C\"/>&nbsp&nbsp<input id=\"delete_no\" type=\"button\" value=\"No\" /></div>\n");
      out.write("    </form>\n");
      out.write("  </div> \n");
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
