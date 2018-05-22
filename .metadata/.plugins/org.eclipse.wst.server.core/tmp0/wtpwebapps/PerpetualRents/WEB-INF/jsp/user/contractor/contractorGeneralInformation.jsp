<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
 <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css"/> 
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css"/>
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />

<!-- ---------------- JavaScript --------------------------------->
<style type="text/css" media="all">
    .chosen-rtl .chosen-drop { left: -9000px; }
	label.error{
		color: #FF0000;
		float: right;
		}
		
  </style>
<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
	var contextPath = getContextPath();
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorRegisterationStep1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>


<style>
	.breadcrumb a { width:173px!important;}
</style>

<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready (function(){
		$('.effect').click(function(){
			$(this).addClass('add-effect');
		});
		$('.effect').blur(function(){
			$(this).removeClass('add-effect');
		});
		
		 new JsDatePick({
				useMode:2,
				target:"tradingCommencementDate",
				dateFormat:"%d-%M-%Y",
				limitToToday:true,
			 });
		 
		 new JsDatePick({
				useMode:2,
				target:"companyRegisterationDate",
				dateFormat:"%d-%M-%Y",
				limitToToday:true,
			 });
 	    
		
	});
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
 </script>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>
<body>
	


<section class="contaner-b">
		<span id="commonMessageErrorId" style="display: none; position: absolute; top:22%; margin: 0 auto; min-height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0; line-height: 20px;
  		background: url('${contextPath}/resource/images/not-ok-icon.png') no-repeat scroll 25px 10px / 25px 25px #FFD6D6; z-index:99999; text-align: left; padding: 12px 0 0 58px;"></span>
  <div class="container">
    <div class="row">
      <div class="span10">
        <div class="clearfix"></div>
        
       <div class="breadcrumb">
            <a href="#" class="active">Step 1</a>
            <a href="#">Step 2 </a>
            <a href="#">Step 3 </a>
            <a href="#">Step 4 </a>
        </div> 
		<div class="contractor-sec">
        	<form id="fContractorgeneralInformationId">
              <ul class="menu">
           		 <li> 
                  <ul>
                    <li>
                      <div class="rg-p">
                      	 <h1 class="heading3 margin-top15">General Information</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                     <h3>Trading or company name</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="companyName" class="effect" name="companyName" value="" maxlength="150"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                     <h3>Nature of your/ your company's business and main business activities</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="businessNature" class="effect" name="businessNature" value="" maxlength="100"/>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="">
                               	  <div class="wd-92">
                                      <h3>Contact Information</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li>EmailId:  <input type="text" name="contactDetailsObj.emailId" id="emailId" placeholder="Email Id" class="effect" value="" /></li>
                                                <li>PhoneNumber: <input type="text" name="contactDetailsObj.phoneNumber" id="phoneNumber" placeholder="Phone Number" class="effect" value="" maxlength="15" /></li>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="">
                               	  <div class="wd-92">
                                      <h3>Credentials</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li>UserName:  <input type="text" name="loginObj.username" id="usernameId" placeholder="User Name" class="effect" value="" /></li>
                                                <li>Password: <input type="password" name="loginObj.password" id="password" placeholder="Password" class="effect" value="" style="width: 60%!important; float: right;" /></li>
                                                <label id="lbl" style="float: inherit; color:red; margin-left: 290px!important; "></label>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                        <h3>Date of commencement of trading</h3>
                                        <div class="for-se wid">
                                          <input readonly="readonly" type="text" id="tradingCommencementDate" placeholder="Pick Date"  name="tradingCommencementDate" class="effect dat-icon newo" placeholder="DD-MM-YYYY" value="" /></td>
                                        </div>
                                   </div>   
                                </td>
                            </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Date of company registration</h3>
                                    <div class="for-se wid">
                                       <input readonly="readonly" type="text" id="companyRegisterationDate" placeholder="Pick Date"  name="companyRegisterationDate" class="effect dat-icon newo" placeholder="DD-MM-YYYY" value="" /></td>
                                    </div>
                                  </div>   
                               </td>
                            </tr>
                            
                            <tr>
                               <td class="">
                               	  <div class="wd-92">
                                      <h3>Please give details of your annual turnover over the last three years</h3>
                                       <div class="form-fields">
                                           <ul>
                                              <li style="width: 30%!important;">Turnover for year ending</li>
                                              <li style="width: 30%!important; margin-left: -130px;">
                                               <select name="turnoverDetails[0].financialYear">
                                               	<option value="2011">2011</option>
                                               	<option value="2012">2012</option>
                                               	<option value="2013">2013</option>
                                               	<option value="2014">2014</option>
                                               </select>
                                               </li>
                                               <li style="width: 30%!important;"><input type="text" name="turnoverDetails[0].turnOver" placeholder="" class="effect" value="" /></li>
                                               
                                               <li style="width: 30%!important;">Turnover for year ending</li>
                                              	<li style="width: 30%!important; margin-left: -130px;">
                                               <select name="turnoverDetails[1].financialYear">
                                               	<option value="2011">2011</option>
                                               	<option value="2012">2012</option>
                                               	<option value="2013">2013</option>
                                               	<option value="2014">2014</option>
                                               </select>
                                               </li>
                                               <li style="width: 30%!important;"><input type="text" name="turnoverDetails[1].turnOver" placeholder="" class="effect" value="" /></li>
                                               <li style="width: 30%!important;">Turnover for year ending</li>
                                              <li style="width: 30%!important; margin-left: -130px;">
                                               <select name="turnoverDetails[2].financialYear">
                                               	<option value="2011">2011</option>
                                               	<option value="2012">2012</option>
                                               	<option value="2013">2013</option>
                                               	<option value="2014">2014</option>
                                               </select>
                                               </li>
                                               <li style="width: 30%!important;"><input type="text" name="turnoverDetails[2].turnOver" placeholder="" class="effect" value="" /></li>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>VAT registration number (If Applicable)</h3>
                                    <div class="for-se wid">
                                       <input type="text" id="" class="effect" name="vatNo" />
                                    </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                            	<td class="">
                                   <div class="">
                                      <h3>Which trade(s) does you/ your company have the skills, experience and capability to provide?</h3>
                                        <div class="">
                                            <select data-placeholder="Choose Functionalities..." name="functionality" class="chosen-select" multiple style="width:350px;" tabindex="4" id="functionalityId">
									        </select>
									        <label id="functionalityLabel" style="float: right; color:red; display: none;">Please Select Trades.</label>
                                   		</div>
                                   </div>   
                                 </td>
                            </tr>
                            
                            <tr>
                            	<td class="">
                                   <div class="">
                                      <h3>Which areas of the country do you operate across?</h3>
                                        <div class="">
                                            <select data-placeholder="Choose Cities..." name="cities" class="chosen-select" multiple style="width:350px;" tabindex="4" id="citiesId">
									        </select>
									        <label id="citiesLabel" style="float: right; color:red; display: none;">Please Select Cities.</label>
                                  	 </div>
                                   </div>   
                                 </td>
                            </tr>
                        </table>
                       </div>         
                    </li>
                  </ul>
           		</li>
            </ul>
             <input type="button" id="generalInfoSaveBtn" value="Save and Continue" class="regis-co"/>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
	<c:import url="${wordPressUrl}/sub-footer/" ></c:import>
	
<div class="lightbox" id="fl1">
  <h2 class="heading2">Login</h2>
  <form action="${contextPath}/j_spring_security_check" method="post" >
    <label>User Name</label>
    <input type="text" value="" placeholder="User Name" class="" name="j_username"  />
    <!--<ul class="error">
    	<li>Error</li>
    </ul>-->
    <label>Password</label>
    <input type="password" value="" placeholder="Enter Your Password" class="" name="j_password" />
    <input type="submit" value="Log In" />
  </form>
  <a href="#">Forgot Password ?</a> <a href="#">Creat Account</a> </div>
  
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
  
  </script>
  
</body>
</html>
