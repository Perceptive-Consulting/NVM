<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- <%@ taglib uri="/tld/fn.tld" prefix="fn"%>
<%@ taglib uri="/tld/c.tld" prefix="c"%>
<%@ taglib uri="/tld/fmt.tld" prefix="fmt"%> --%>

<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.remodal.css" />
<!-- ---------------- JavaScript --------------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/propertyDeveloper.js"></script>
 --%>

<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
          //checked...
          
    });
  });
  
  $(document).ready(function(e) {
		
		$(".FileView").fancybox();
		
	    $('.CloseBt').click(function(e) {
	   	$(this).parents('.AttachDoc').remove();
		});


	    $('.CLSBtn').click(function(e) {
	   	$(this).parents('.ProjectImg').remove();
		});
		
	});

	function activateButton(buttonId){
		document.getElementById(buttonId).disabled = false;
		document.getElementById(buttonId).className = 'UploadIcon';
	}
  
</script>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css' />
</head>
<body>
 <%@include file="/WEB-INF/jsp/user/propertyDeveloper/pdheader.jsp" %>
<div class="clearfix"></div>
<section class="banner" style="height:124px;">
  <div class="flexslider " style="height:150px;">
    <ul class="slides">
      <li><img src="<%=request.getContextPath()%>/resource/images/slide1.png" title="" alt="" /> </li>
    </ul>
  </div>
  <div class="container">
	  <div class="row">
		  <div class="span-12">
			  <div class="call">
			 	 <div class="ban-cot inner-f ">Call&nbsp;Now.&nbsp; 07801892817</div>
			  </div>
		  </div>
	  </div>
  </div>
</section>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container" id="containerId">
   <section class="contaner-b">
  <div class="container">
    <div class="row">
      <div class="span12">
        <h1 class="heading4 margin-top15">One the edit page</h1>
        <section class="AttachFile attach-files">

          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          
            <tr>
             <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=1" id=""  name="form1" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Attach drawings</span></td>
              <td align="left" valign="middle"><input type="file" name="attachFiles" value="Upload" multiple onchange="activateButton('uploadDrawingsId');" />
             
               <c:if test="${property != null}">
                	<c:set var="attachedDrawings" value="${property.getDrawings()}"></c:set>
               		<c:forEach var="drawingObj" items="${attachedDrawings}" >
               			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${drawingObj.getFileId()}" target="_blank">${drawingObj.getFileName()}</a>
               			<span class="CloseBt" onclick="removeDocument('${drawingObj.getId()}')"></span></div>
               		</c:forEach>
                </c:if>
               <input type="button" disabled class="UploadIcon-Disabled" id="uploadDrawingsId" style="cursor: pointer;" onclick="javascript:document.form1.submit();" value= Upload></input>
                <!-- <div class="UploadIcon" id="uploadDrawingsId" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
             </form>
            </tr>
           
            <!-- ---------2------------ -->
           
            <tr>
             <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=2" id="" method="post" name="form2" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Attach specification</span></td>
              <td align="left" valign="middle"><input type="file" multiple="multiple" name="attachFiles" value="Upload" id=""  onchange="activateButton('uploadSpecifications');" />
              
              <c:if test="${property != null}">
                	<c:set var="attachedSpecifications" value="${property.getSpecifications()}"></c:set>
                		<c:forEach var="specificationsObj" items="${attachedSpecifications}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${specificationsObj.getFileId()}" target="_blank">${specificationsObj.getFileName()}</a>
                			<span class="CloseBt" onclick="removeDocument('${specificationsObj.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                 <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecifications" style="cursor: pointer;" onclick="javascript:document.form2.submit();" value= Upload></input>
               <!--  <div class="UploadIcon" id="uploadSpecificationsId" style="cursor: pointer;" onclick="javascript:$(this).parent('form').css('color','red')">Upload</div> -->
               </td>
               </form>
            </tr>
           
             <!-- ------------3--------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=3" id=""  name="form3" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Attach copy of title deed from land registry here </span></td>
              <td align="left" valign="middle"><input type="file" name="attachFiles" value="Upload" id="" multiple="multiple" onchange="activateButton('uploadLandRegistry');"/>
              
               <c:if test="${property != null}">
                	<c:set var="attachedRegistery" value="${property.getLandRegistery()}"></c:set>
                		<c:forEach var="registeryObj" items="${attachedRegistery}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${registeryObj.getFileId()}" target="_blank">${registeryObj.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${registeryObj.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadLandRegistry" style="cursor: pointer;" onclick="javascript:document.form3.submit();" value= Upload></input>
                <!-- <div class="UploadIcon" id="uploadRegisteryId" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                 </form>
            </tr>
             <!-- -----------4---------- -->
            <tr>
             <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=4" id="" name="form4" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Attach Tender documents</span></td>
              <td align="left" valign="middle"><input type="file"  name = "attachFiles" multiple="multiple" value="" id="" onchange="activateButton('uploadTenderDocument');" />
              
              <c:if test="${property != null}">
                	<c:set var="attachedTenderDocuments" value="${property.getTenderDocuments()}"></c:set>
                		<c:forEach var="tenderDocumentObj" items="${attachedTenderDocuments}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${tenderDocumentObj.getFileId()}" target="_blank">${tenderDocumentObj.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${tenderDocumentObj.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadTenderDocument" style="cursor: pointer;" onclick="javascript:document.form4.submit();" value= Upload></input>
                <!-- <div class="UploadIcon" id="uploadTenderDocumentId" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                </form>
            </tr>
             <!-- -----------5---------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=5" id="" name="form5" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Attach construction schedule</span></td>
              <td align="left" valign="middle"><input type="file" multiple ="multiple" name ="attachFiles" value="" id="" onchange="activateButton('uploadConsutcutionSchedule');" />
              
               <c:if test="${property != null}">
                	<c:set var="constructionScheduleDocuments" value="${property.getConstructionSchedule()}"></c:set>
                		<c:forEach var="constructionScheduleObj" items="${constructionScheduleDocuments}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${constructionScheduleObj.getFileId()}" target="_blank">${constructionScheduleObj.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${constructionScheduleObj.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadConsutcutionSchedule" style="cursor: pointer;" onclick="javascript:document.form5.submit();" value= Upload></input>
               <!--  <div class="UploadIcon" id="uploadconstructionScheduleId" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                 </form>
            </tr>
             <!-- -----------6---------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=6" id="" name="form6" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Additional Document 1</span></td>
              <td align="left" valign="middle"><input type="file"  name ="attachFiles" value="" id="" onchange="activateButton('uploadSpecificationsId1');" />
              
               <c:if test="${property != null}">
                	<c:set var="additionalDocuments1" value="${property.getAdditionalDocuments1()}"></c:set>
                		<c:forEach var="additionalDoc1" items="${additionalDocuments1}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc1.getFileId()}" target="_blank">${additionalDoc1.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${additionalDoc1.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecificationsId1" style="cursor: pointer;" onclick="javascript:document.form6.submit();" value= Upload></input>
               <!--  <div class="UploadIcon" id="additionalDocuments1Id" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                 </form>
            </tr>
            
             <!-- ----------7----------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=7" id="" name="form7" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Additional Document 2</span></td>
              <td align="left" valign="middle"><input type="file"  name ="attachFiles"mvalue="" id="" onchange="activateButton('uploadSpecificationsId2');" />
              <c:if test="${property != null}">
                	<c:set var="additionalDocuments2" value="${property.getAdditionalDocuments2()}"></c:set>
                		<c:forEach var="additionalDoc2" items="${additionalDocuments2}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc2.getFileId()}" target="_blank">${additionalDoc2.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${additionalDoc2.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecificationsId2" style="cursor: pointer;" onclick="javascript:document.form7.submit();" value= Upload></input>
                <!-- <div class="UploadIcon" id="additionalDocuments2Id" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                 </form>
            </tr>
             <!-- ------------8--------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=8" id="" name="form8" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Additional Document 3</span></td>
              <td align="left" valign="middle"><input type="file"  name ="attachFiles" value="" id="" onchange="activateButton('uploadSpecificationsId3');" />
              
               <c:if test="${property != null}">
                	<c:set var="additionalDocuments3" value="${property.getAdditionalDocuments3()}"></c:set>
                		<c:forEach var="additionalDoc3" items="${additionalDocuments3}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc3.getFileId()}" target="_blank">${additionalDoc3.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${additionalDoc3.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecificationsId3" style="cursor: pointer;" onclick="javascript:document.form8.submit();" value= Upload></input>
                <!-- <div class="UploadIcon" id="additionalDocuments3Id" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                 </form>
            </tr>
             <!-- ------------9--------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=9" id="" name="form9" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Additional Document 4</span></td>
              <td align="left" valign="middle"><input type="file" name ="attachFiles" value="" id="" onchange="activateButton('uploadSpecificationsId4');" />
              
                 <c:if test="${property != null}">
                	<c:set var="additionalDocuments4" value="${property.getAdditionalDocuments4()}"></c:set>
                		<c:forEach var="additionalDoc4" items="${additionalDocuments4}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc4.getFileId()}" target="_blank">${additionalDoc4.getFileName()}</a><span class="CloseBt" onclick="removeDocument('${additionalDoc4.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecificationsId4" style="cursor: pointer;" onclick="javascript:document.form9.submit();" value= Upload></input>
              <!--   <div class="UploadIcon" id="additionalDocuments4Id" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                 </form>
            </tr>
             <!-- ---------10------------ -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=10" id="" name="form10" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Additional Document 5</span></td>
              <td align="left" valign="middle"><input type="file"  name ="attachFiles" value="" id="" onchange="activateButton('uploadSpecificationsId5');" />
              
                <c:if test="${property != null}">
                	<c:set var="additionalDocuments5" value="${property.getAdditionalDocuments5()}"></c:set>
                		<c:forEach var="additionalDoc5" items="${additionalDocuments5}" >
                			<div class="AttachDoc"><a href="${contextPath}/download/uploadedDocuments.htm?fileId=${additionalDoc5.getFileId()}" target="_blank">${additionalDoc5.getFileName()}</a>
                			<span class="CloseBt" onclick="removeDocument('${additionalDoc5.getId()}')"></span></div>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecificationsId5" style="cursor: pointer;" onclick="javascript:document.form10.submit();" value= Upload></input>
               <!--  <div class="UploadIcon" id="additionalDocuments5Id" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
                </td>
                </form>
            </tr>
             <!-- ----------11----------- -->
            <tr>
            <form action="${contextPath}/propertyDeveloper/uploadDocuments.htm?param=11" id="" name="form11" method="post" enctype="multipart/form-data">
              <td align="left" valign="middle"><span class="LableType">Upload Picture</span></td>
              <td align="left" valign="middle"><input type="file" multiple="multiple" value="" id="" name ="attachFiles" onchange="activateButton('uploadSpecificationsId1123');"  />
                
                <c:if test="${property != null}">
                	<c:set var="imagesList" value="${property.getImages()}"></c:set>
                		<c:forEach var="image" items="${imagesList}" >
                			<div class="ProjectImg">
		                 	 <div class="CLSBtn" onclick="removeDocument('${image.getId()}')"></div>
		                 	 <div class="OverLapArea"><a class="FileView" href="${contextPath}/${image.getFilePath()}" rel="gallery1"  title=""></a></div>
		                 	 <img src="${contextPath}/${image.getFilePath()}" width="393" height="393" /></div>
                		 	 <span class="CloseBt" onclick="removeDocument('${image.getId()}')"></span>
                		</c:forEach>
                </c:if>
                <input type="button" disabled class="UploadIcon-Disabled" id="uploadSpecificationsId1123" style="cursor: pointer;" onclick="javascript:document.form11.submit();" value= Upload></input>
             <!--     <div class="UploadIcon" id="imagesId" style="cursor: pointer;" onclick="$(this).parent('form').submit()">Upload</div> -->
			 </td>
			 </form>
            </tr>
          </table>
           <a href="redirectCompleteProperties.htm" class="backbtnnew">Back</a>
        </section>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
  </div>
</section>
<div class="clearfix"></div>
 <c:import url="${wordPressUrl}/sub-footer/" ></c:import>

</body>
</html>