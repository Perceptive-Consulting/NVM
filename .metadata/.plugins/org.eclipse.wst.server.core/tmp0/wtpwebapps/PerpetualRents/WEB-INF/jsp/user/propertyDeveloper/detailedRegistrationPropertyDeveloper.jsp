<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.remodal.css" />
<!-- ---------------- JavaScript --------------------------------->

<script type="text/javascript">
 function getContextPath() {
	   return "${pageContext.request.contextPath}";
	} 
	var contextPath = getContextPath();
	//alert(contextPath);
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/propertyDeveloper.js"></script>
 --%>

<style>
label.error{
	color: #FF0000;
	float: right;
}
</style>
	<script type="text/javascript" >
    $(document).ready(function(){

    	 new JsDatePick({
				useMode:2,
				target:"ndaCompletionDate",
				dateFormat:"%d-%M-%Y",
				limitToToday:true,
			 });
    	 
    	 new JsDatePick({
				useMode:2,
				target:"estimatedHandoverDate",
				dateFormat:"%d-%M-%Y",
				
			 });
    	
   		var val = '<c:out value="${propertyObj}"/>';
   		
   		var value='<c:out value="${propertyObj.getNdaStatus()}"/>';
   		//alert(val);
   		var isRefurbishmentProject='<c:out value="${propertyObj.getIsRefurbishmentProject()}"/>'; 
   	//	alert(isRefurbishmentProject);
   		var expectedEpcRating='<c:out value="${propertyObj.getExpectedEpcRating()}"/>'; 
   		var WindowsUPVCLockable='<c:out value="${propertyObj.getIsWindowsUPVCLockable()}"/>'; 
   		var uPVCExternalDoors='<c:out value="${propertyObj.getIsUPVCExternalDoors()}"/>';
   		var solidWoodInternalDoors='<c:out value="${propertyObj.getIsSolidWoodInternalDoors()}"/>';
		var kitchenFacilities='<c:out value="${propertyObj.getIsKitchenFacilities()}"/>';
		var toiletFacilities='<c:out value="${propertyObj.getIsToiletFacilities()}"/>';
		var isPainted='<c:out value="${propertyObj.getIsPainted()}"/>';
		var isWallsInContemporaryPainted='<c:out value="${propertyObj.getIsWallsInContemporaryPainted()}"/>';
		var isCarpetedThroughout='<c:out value="${propertyObj.getIsCarpetedThroughout()}"/>';
		var isOutdoorCommunalDevice='<c:out value="${propertyObj.getIsOutdoorCommunalDevice()}"/>';
		
	
		//alert(WindowsUPVCLockable);
		//alert(uPVCExternalDoors);
		//alert(isPainted);
   		//alert(expectedEpcRating);//alert(val);
    	if(val.length != null && val != null && val!=""){
    		$('#savePDPropertyDetailsAgain').hide();
			$('#UpdateDetailedPDPropertyID').show();
			//alert(value);
				
			if(value=="true")
			{
			//alert(value);
			$('#ndaStatusYes').attr('checked',true);
			}
			else if(value=="false")
			{
		//	alert(value);
			$('#ndaStatusNo').attr('checked',true);
			}
			else
			{
			$('#ndaStatusYes').attr('checked',false);
			$('#ndaStatusNo').attr('checked',false);
			} 
			
			
			if(isRefurbishmentProject=="true")
			{
			$('#isRefurbishmentProjectYes').attr('checked',true);
			}
			else if(isRefurbishmentProject=="false")
			{
			$('#isRefurbishmentProjectNo').attr('checked',true);	
			}
			else
			{
				$('#isRefurbishmentProjectYes').attr('checked',false);
				$('#isRefurbishmentProjectNo').attr('checked',false);
			}
			
			
			if(expectedEpcRating=="true")
			{
			$('#expectedEpcRatingYes').attr('checked',true);
			}
			else if(expectedEpcRating=="false")
			{
			$('#expectedEpcRatingNo').attr('checked',true);	
			}
			else
			{
				$('#expectedEpcRatingYes').attr('checked',false);
				$('#expectedEpcRatingNo').attr('checked',false);
			}
			
			if(WindowsUPVCLockable=="windows")
			{
			$('#isWindowsUPVCLockable').attr('checked',true);
			}
			else
			{
			$('#isWindowsUPVCLockable').attr('checked',false);	
			}
			
		
			if(uPVCExternalDoors=="UPVC external doors")
			{
			$('#isUPVCExternalDoors').attr('checked',true);
			}
			else
			{
			$('#isUPVCExternalDoors').attr('checked',false);	
			}
			
			if(solidWoodInternalDoors=="Solid wood internal doors")
			{
			$('#isSolidWoodInternalDoors').attr('checked',true);
			}
			else
			{
			$('#isSolidWoodInternalDoors').attr('checked',false);	
			}
			
			if(kitchenFacilities=="Kitchen facilities")
			{
			$('#isKitchenFacilities').attr('checked',true);
			}
			else
			{
			$('#isKitchenFacilities').attr('checked',false);	
			}
				
			if(toiletFacilities=="Toilet facilities")
			{
			$('#isToiletFacilities').attr('checked',true);
			}
			else
			{
			$('#isToiletFacilities').attr('checked',false);	
			}
			
			if(isPainted=="Painted")
			{
			$('#isPainted').attr('checked',true);
			}
			else
			{
			$('#isPainted').attr('checked',false);	
			}
			
			if(isWallsInContemporaryPainted=="Walls in contemporary colours")
			{
			$('#isWallsInContemporaryPainted').attr('checked',true);
			}
			else
			{
			$('#isWallsInContemporaryPainted').attr('checked',false);	
			}
			
			if(isCarpetedThroughout=="Carpeted throughout")
			{
			$('#isCarpetedThroughout').attr('checked',true);
			}
			else
			{
			$('#isCarpetedThroughout').attr('checked',false);	
			}
			
			if(isOutdoorCommunalDevice=="Outdoor communal space")
			{
			$('#isOutdoorCommunalDevice').attr('checked',true);
			}
			else
			{
			$('#isOutdoorCommunalDevice').attr('checked',false);	
			}	
		}
    	else
    		{
    		$('#savePDPropertyDetailsAgain').show();
    		}
    	
    	});
   
    </script>
    

    
  <script>
  $(function() {
	    $("#registerPropertyDeveloperId").validate({
	        rules: {
	            "firstName": "required",
	            "lastName": "required",
	            "primaryEmailId": {
	                required: true,
	                email: true
	            },
		        "primaryPhoneNumber": {
		        	required: true,
		        	 minlength :10,
		             maxlength : 15
		        },
		        "loginObj.username": {
		        	required: true,
		        	minlength: 3
		        },
		        "loginObj.password": {
		        	required: true,
		        	minlength: 3
		        },
		        "addressObj.city" : "required",
		        "addressObj.postCode" : "required",
		        "addressObj.addressLine1" : "required",
	    },
	    messages: {
	    	"addressObj.city": {
	         required: "Please Select City.",
	        },
	       }
      });
  });
  
  </script>
  
  <script type="text/javascript">
  	$('.close').click(function () {
  	    $('#alertId').hide(200);
    }); 
  </script>
 <script type="text/javascript" charset="utf-8">
	  $(function() {
		    $("#secondfPDPropertyDetails").validate({
		        rules: {
		        	"isJointVenture": 
		        		{
		        		required: true,
		        		 maxlength : 150
		        		
		        		},
		        	"permissionToCarryOut" :
						{
		        		required: true,
		        		 maxlength : 150
		        		},
		        	"emergencyContactNo" : {
		        		required: true,
			        	 minlength :10,
			        	 number:true,
			             maxlength : 15
		        	},
		        	"companyName" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        		},
		        	"ndaStatus" : "required",
		        	"ndaCompletionDate" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"expectedRentalLevel" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"accommodationType" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"hmoDeductions" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"haveItsOwnMeteringSupply" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"rateableValue" :
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"waterRatesValue" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"numberOfStudioFlates" :
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"isRefurbishmentProject" :"required",
		        	"hmoDeductions" :
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"haveItsOwnMeteringSupply" :
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"rateableValue" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        		}	,
		        	"sustainableFeatures" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        	},
		        	"expectedEpcRating" : "required",
		        	"estimatedHandoverDate" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        		},
		        	"insurancePolicyNumber" : 
		        	{
		        		required: true,
		        		 maxlength : 150
		        		},
    	        	/* "addressObj.city": {
    	                required: {
    	                    depends: function(element) {
    	                       if(element.value == 0){
    	                    	   $("#cityErrorId").show();
    	                    	   return false;
    	                       }
    	                    	
    	                    }
    	                }
    	            } */
    	        	
		        },
		    messages: {
		    	"addressObj.city": {
		         required: "Please Select City.",
		        },
		       }
		    });
		  });
	  
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
         <div class="span10">
         <form id="secondfPDPropertyDetails" name="secondfPDPropertyDetails" novalidate="novalidate">
          <h1 class="heading4 margin-top15">Property Details</h1>
          <div>
            <div class="PropertyForm new-form-stra NewFileLine"> <span>
              <label>If this is a Joint venture what are the names of the other partners ?</label>
              <input type="text" name="isJointVenture" id="isJointVenture" class="" placeholder="" value="${propertyObj.getIsJointVenture()}">
              </span> <span>
              <label>Do we have your permission to carry out and relevant security and financial check if deemed necessary ?</label>
              <input type="text" name="permissionToCarryOut"  id="permissionToCarryOut" class="" placeholder="" value="${propertyObj.getPermissionToCarryOut()}">
              </span> <span>
              <label>Emergency Contact Number ?</label>
              <input type="text"  name="emergencyContactNo" id="emergencyContactNo" value="${propertyObj.getEmergencyContactNo()}">
              </span> <span>
              <label>Company name to be used if any and is it a Limited company ?</label>
              <input type="text" name="companyName" id="companyName" value="${propertyObj.getCompanyName()}">
              </span> <span>
              <label>Has an NDA been completed and returned ?</label>
              <div class="clearfix"></div>
              <label class="checkRedio">
              <input type="radio" name="ndaStatus"  value="true"  id="ndaStatusYes"/>
              &nbsp;&nbsp;Yes</label>
              <label class="checkRedio">
              <input type="radio" name="ndaStatus" value="false" id="ndaStatusNo"/>
              &nbsp;&nbsp;No</label>
              </span> <span>
              <label> Date NDA was complete:</label>
              <input type="text" name="ndaCompletionDate" id="ndaCompletionDate" value="${propertyObj.getNdaCompletionDate()}" readonly="readonly">
              </span> <span>
              <label>Expected rental level PCM per flat or in the case of an HMO per room PCM ?</label>
              <input type="text"  placeholder="�" name="expectedRentalLevel" id="expectedRentalLevel" value="${propertyObj.getExpectedRentalLevel()}">
              </span> <span>
              <label>Type of accommodation: Studio flat, one bedroom flat ? </label>
              <input type="text"  placeholder="" name="accommodationType" id="accommodationType" value="${propertyObj.getAccommodationType()}">
              </span> <span>
              <label>In the Case of an HMO what deductions do you make for bills ?</label>
              <input type="text"  placeholder="�" name="hmoDeductions" id="hmoDeductions" value="${propertyObj.getHmoDeductions()}">
              </span> <span>
              <label>Will each unit have its own metering supply, (please elaborate) ?</label>
              <input type="text"  placeholder="" name="haveItsOwnMeteringSupply" id="haveItsOwnMeteringSupply" value="${propertyObj.getHaveItsOwnMeteringSupply()}">
              </span> <span>
              <label>Rateable Value ?</label>
              <input type="text"  placeholder="�" name="rateableValue" id="rateableValue" value="${propertyObj.getRateableValue()}">
              </span> <span>
              <label>Water rates Value ?</label>
              <input type="text"  placeholder="�" name="waterRatesValue" id="waterRatesValue" value="${propertyObj.getWaterRatesValue()}">
              </span> <span>
              <label>Number of studio flats per this address ?</label>
              <input type="text"  placeholder="" name="numberOfStudioFlates" id="numberOfStudioFlates" value="${propertyObj.getNumberOfStudioFlates()}">
              </span> <span >
              <label>Is this a refurbishment project and if so will the following  be replaced ?</label>
              <label class="checkRedio checkb1">
                <input type="radio" name="isRefurbishmentProject" id="isRefurbishmentProjectYes" value="true">
                &nbsp;&nbsp;Yes</label>
              <label class="checkRedio checkb2">
                <input type="radio" name="isRefurbishmentProject" id="isRefurbishmentProjectNo" value="false">
                &nbsp;&nbsp;No</label>
              <div class="ShowHide Blockbx">
                <label class="">
                  <input type="checkbox" name="isWindowsUPVCLockable" value="windows" id="isWindowsUPVCLockable">
                  &nbsp; &nbsp; windows UPVC  lockable,  conforming to building regulations ?</label>
                <label class="">
                  <input type="checkbox" name="isUPVCExternalDoors" value="UPVC external doors" id="isUPVCExternalDoors">
                  &nbsp; &nbsp; UPVC external doors with multipoint locking mechanism</label>
                <label class="">
                  <input type="checkbox" name="isSolidWoodInternalDoors" value="Solid wood internal doors" id="isSolidWoodInternalDoors">
                  &nbsp; &nbsp; Solid wood internal doors (front doors fire rated to building regulations standard)</label>
                <label class="">
                  <input type="checkbox" name="isKitchenFacilities" value="Kitchen facilities" id="isKitchenFacilities"> &nbsp; &nbsp; Kitchen facilities - modern cupboards, integrated electric oven, hood and hob</label>
                <label class="">
                  <input type="checkbox" name="isToiletFacilities" value="Toilet facilities" id="isToiletFacilities">
                  &nbsp; &nbsp; Toilet facilities - White goods (Toilet, shower, basin, chrome taps, etc) Vinyl flooring.</label>
                <label class="">
                  <input type="checkbox" name="isPainted" value="Painted" id="isPainted">
                  &nbsp; &nbsp; Painted/varnished woodwork/joinery</label>
                <label class="">
                  <input type="checkbox" name="isWallsInContemporaryPainted" value="Walls in contemporary colours" id="isWallsInContemporaryPainted">
                  &nbsp; &nbsp; Walls in contemporary colours, painted/wallpapered.</label>
                <label class="">
                  <input type="checkbox" name="isCarpetedThroughout" value="Carpeted throughout" id="isCarpetedThroughout">
                  &nbsp; &nbsp; Carpeted throughout</label>
                <label class="">
                  <input type="checkbox" name="isOutdoorCommunalDevice" value="Outdoor communal space" id="isOutdoorCommunalDevice">
                  &nbsp; &nbsp; Outdoor communal space will be pointed, painted and tidied.</label>
                <p class="pp">Please give as much information as possible as this list is an aid for ones memory.</p>
              </div>
              </span> <span>
              <label>What Sustainable features will there be ?</label>
              <input type="text"  placeholder="" name="sustainableFeatures" id="sustainableFeatures" value="${propertyObj.getSustainableFeatures()}">
              </span> <span>
              <label>Expected EPC Rating after works are completed or new build ?</label>
              <div class="clearfix"></div>
              <label class="checkRedio">
                <input type="radio" name="expectedEpcRating" value="true" id="expectedEpcRatingYes">
                &nbsp;&nbsp;Yes</label>
              <label class="checkRedio">
                <input type="radio" name="expectedEpcRating" value="false" id="expectedEpcRatingNo">
                &nbsp;&nbsp;No</label>
              </span> <!--<span>
              <label>Please provide details of the building specification, Word document or pdf ?</label>
              <div class="clearfix"></div>
              <input type="file" value="" style="margin-top:5px;" />
              </span>--> <span>
              <label>Estimated handover date:</label>
              <input type="text" name="estimatedHandoverDate" id="estimatedHandoverDate" value="${propertyObj.getEstimatedHandoverDate()}" readonly="readonly">
              </span> <span>
              <label>Buildings insurance policy number  and start date ?</label>
              <input type="text"  name="insurancePolicyNumber" id="insurancePolicyNumber" value="${propertyObj.getInsurancePolicyNumber()}">
              </span>
              <span>
              <label>Additinational info </label>
              <textarea></textarea>
              </span>
              <div class="clearfix"></div>
            </div>
          </div>
          <a class="backbtnnew" style="margin-top:15px; float:left;" href="redirectCompleteProperties.htm">Back</a>
          <input type="button" style="display:none;" value="Update and Continue" class="regis-co" id="UpdateDetailedPDPropertyID">
          <input type="button" value="Submit and Continue" class="regis-co" id="savePDPropertyDetailsAgain">
        </form>

        </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
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
    