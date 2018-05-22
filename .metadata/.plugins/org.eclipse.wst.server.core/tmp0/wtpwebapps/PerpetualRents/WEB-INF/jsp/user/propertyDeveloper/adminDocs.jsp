<script type="text/javascript">
$(document).ready(function(){
$("#BackAdminPdDocument")
.click(
		function() {
			window.location.href = contextPath
					+ "/propertyDeveloper/redirectCompleteProperties.htm";
		});
});
</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <section class="contaner-b">
  <div class="container">
   
 
    <div class="row">
  
      <div class="span12">
        <h1 class="heading4 margin-top15">Suggested Documents Uploaded By Admin </h1>
       <div id="documents" class="tab_content1 rg-p innew tabs-file" style="padding: 18px 11px!important; margin-top: 0px!important;">
		  
		  <!-- <h1> Documents</h1> -->
		  
		  <table class="UploadTable" border="0" cellspacing="0" cellpadding="0" id="documentId"> 
		  		<thead>
		  		<tr>
		 		 <th>Name</th>
                 <th>Uploaded On</th>
                 <th>Status</th>
                 <th>Action</th>
                 <th>Description</th>
                 </tr>
		  		</thead>
				<c:if test="${docList != null}">
                 	<c:forEach var="docObj" items="${docList}" >
		                 <tr>
		                 <td> ${docObj.getFileName()} </td>
			             <td> ${docObj.getCreatedOn()}</td>
			             <td> ${docObj.getStatusStr()} </td>
			             
			             <td><a href="${contextPath}/propertyDeveloper/downAdminDocuments.htm?documentId=${docObj.getId()}" style="margin-top: 5px;"><img src="${contextPath}/resource/images/downloadIcon.png"></a>
			             &nbsp;&nbsp;&nbsp;&nbsp;</td>
			             <td> ${docObj.getDescription()} </td>
			             </tr>
                 	</c:forEach>
                 </c:if>
		  </table>
		  
          <div class="clearfix"></div>
          
        </div>
      </div>
      <div style="margin:20px 0;" class="button">
      <button  id="BackAdminPdDocument">Back</button>
    </div>
    </div>
  </div>
</section>