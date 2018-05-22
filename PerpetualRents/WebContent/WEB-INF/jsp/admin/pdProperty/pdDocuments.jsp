<!-- <link rel="stylesheet" rel="stylesheet" href="/PerpetualRents/WebContent/resource/css/style.css" /> -->
 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/pdProperty/pdPropertyDetails.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container-ar">
  <section class="contant-area">
    <div style="margin:15px 0;" class="button">
      <button  id="backFromDocumentViewId">Back</button>
     <!--  <button class="open_popup cboxElement">View PMC</button>
      <button class="">Dis-Approve</button>
      <button class="">Map</button> -->
    </div>
  <%--   HELLO ------ ${property} --%>
    <section class="AttachFile">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="left" valign="middle"><span class="LableType">Attach drawings</span></td>
           <td>
            <c:choose>
               <c:when test="${property.getDrawings() != null}">
                	<c:set var="attachedDrawings" value="${property.getDrawings()}"></c:set>
                		<c:forEach var="drawingObj" items="${attachedDrawings}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${drawingObj.getFileId()}" target="_blank">${drawingObj.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${drawingObj.getFileId()}" target="_blank"><span  class="downloadimg"></span></div>
                         </c:forEach>
            </c:when>
            <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
          </td>
        </tr>
 <!-- -------------------2--------------------- -->
        <tr>
          <td align="left" valign="middle"><span class="LableType">Attach specification</span></td>
               <td>    
               <c:choose>
               <c:when test="${property.getSpecifications()!= null}">
                	<c:set var="attachedSpecifications" value="${property.getSpecifications()}"></c:set>
                		<c:forEach var="specificationsObj" items="${attachedSpecifications}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${specificationsObj.getFileId()}" target="_blank">${specificationsObj.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${specificationsObj.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
                   </c:when>
           <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
            </td>
        </tr>
<!-- -------------------3--------------------- -->
       <tr>
              <td align="left" valign="middle"><span class="LableType">Attach copy of title deed from land registry here </span></td>
              <td>
              <c:choose>
               <c:when test="${property.getLandRegistery() != null}">
                	<c:set var="attachedRegistery" value="${property.getLandRegistery()}"></c:set>
                		<c:forEach var="registeryObj" items="${attachedRegistery}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${registeryObj.getFileId()}" target="_blank">${registeryObj.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${registeryObj.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
                </c:when>
                 <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
                </c:choose>
                </td>
            </tr>
  <!-- -------------------4--------------------- -->           
        <tr>
          <td align="left" valign="middle"><span class="LableType">Attach Tender documents</span></td>
          <td>  
           <c:choose>
          <c:when test="${property.getTenderDocuments() != null}">
                	<c:set var="attachedTenderDocuments" value="${property.getTenderDocuments()}"></c:set>
                		<c:forEach var="tenderDocumentObj" items="${attachedTenderDocuments}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${tenderDocumentObj.getFileId()}" target="_blank">${tenderDocumentObj.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${tenderDocumentObj.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
             </c:when>
                <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
                </c:choose>
        </td>
        </tr>
 <!-- -------------------5--------------------- -->
        <tr>
          <td align="left" valign="middle"><span class="LableType">Attach construction schedule</span></td>
       	  <td> 
          <c:choose>
          <c:when test="${property.getConstructionSchedule() != null}">
                	<c:set var="constructionScheduleDocuments" value="${property.getConstructionSchedule()}"></c:set>
                		<c:forEach var="constructionScheduleObj" items="${constructionScheduleDocuments}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${constructionScheduleObj.getFileId()}" target="_blank">${constructionScheduleObj.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${constructionScheduleObj.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                	</c:forEach>
           </c:when>
            <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
        </td>
        </tr>
 <!-- -------------------6--------------------- -->
        <tr>
          <td align="left" valign="middle"><span class="LableType">Additional Document 1</span></td>
       <td>
        <c:choose>
            <c:when test="${property.getAdditionalDocuments1() != null}">
                	<c:set var="additionalDocuments1" value="${property.getAdditionalDocuments1()}"></c:set>
                		<c:forEach var="additionalDoc1" items="${additionalDocuments1}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc1.getFileId()}" target="_blank">${additionalDoc1.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc1.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
                </c:when>
                
                <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
       </td>
        </tr>
 <!-- -------------------7--------------------- -->       
        <tr>
          <td align="left" valign="middle"><span class="LableType">Additional document 2</span></td>
		<td>
		<c:choose>
		 <c:when test="${property.getAdditionalDocuments2() != null}">
                	<c:set var="additionalDocuments2" value="${property.getAdditionalDocuments2()}"></c:set>
                		<c:forEach var="additionalDoc2" items="${additionalDocuments2}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc2.getFileId()}" target="_blank">${additionalDoc2.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc2.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
           </c:when>
           
           <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
           </td>       
        </tr>
 <!-- -------------------8--------------------- -->       
        <tr>
          <td align="left" valign="middle"><span class="LableType">Additional document 3</span></td>
       <td>
       <c:choose>
       <c:when test="${property.getAdditionalDocuments3() != null}">
                	<c:set var="additionalDocuments3" value="${property.getAdditionalDocuments3()}"></c:set>
                		<c:forEach var="additionalDoc3" items="${additionalDocuments3}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc3.getFileId()}" target="_blank">${additionalDoc3.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc3.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
                </c:when>
                 <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
       </td>
        </tr>
 <!-- -------------------9--------------------- -->        
        <tr>
          <td align="left" valign="middle"><span class="LableType">Additional document 4</span></td>
       <td>
        <c:choose>
        <c:when test="${property.getAdditionalDocuments4() != null}">
                	<c:set var="additionalDocuments4" value="${property.getAdditionalDocuments4()}"></c:set>
                		<c:forEach var="additionalDoc4" items="${additionalDocuments4}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc4.getFileId()}" target="_blank">${additionalDoc4.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc4.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
                </c:when>
                 <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
       </td>
        </tr>
 <!-- -------------------10--------------------- -->       
        <tr>
          <td align="left" valign="middle"><span class="LableType">Additional document 5</span></td>
       	<td>
       	<c:choose>
            <c:when test="${property != null}">
                	<c:set var="additionalDocuments5" value="${property.getAdditionalDocuments5()}"></c:set>
                		<c:forEach var="additionalDoc5" items="${additionalDocuments5}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc5.getFileId()}" target="_blank">${additionalDoc5.getFileName()}</a><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc5.getFileId()}" target="_blank"><span class="downloadimg"></span></a></div>
                		</c:forEach>
             </c:when>
               <c:otherwise>
           <div class="showMessageInUnuploadedFile"> No File uploaded yet</div>
            </c:otherwise>
            </c:choose>
       </td>
        </tr>
 <!-- -------------------11--------------------- -->       
        <tr>
          <td align="left" valign="middle"><span class="LableType">View Picture</span></td>
          <td align="left" valign="middle">
          
          <c:if test="${property != null}">
                	<c:set var="imagesList" value="${property.getImages()}"></c:set>
                		<c:forEach var="image" items="${imagesList}" >
                			<div class="ProjectImg">
		                 	 <div class="CLSBtn"></div>
		                 	 <div class="OverLapArea"><a class="FileView" href="${contextPath}/${image.getFilePath()}" rel="gallery1"  title=""></a></div>
		                 	 <img src="${contextPath}/${image.getFilePath()}" width="393" height="393" /></div>
                		 	<%-- <div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${constructionScheduleObj.getFileId()}" target="_blank">${constructionScheduleObj.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${constructionScheduleObj.getId()}')"></span></div> --%> 
                		</c:forEach>
                </c:if>
             
        </tr>
        
      </table>
    </section>
  </section>
</div>