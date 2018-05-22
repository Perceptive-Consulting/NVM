<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/logout-popup-elements.css"></link>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/logout-popup.js"></script>
<script>
	$(document).ready(function(){
		$("#logoutHrefId").click(function(){
			$.ajax({
				  url: contextPath+"/home/userLogout.htm",
			      type: "get",
			      dataType : "json",
			      success: function(response){
			    	 if(response.success == 'true' || response.success == true){
			    		 window.location.href = contextPath+"/j_spring_security_logout";
			    	 }
			      },
			      error:function(){
			         console.log('Some error is there.');
			      }
			  });
		});
		
		});
</script>

<header>
  <div class="container">
    <div class="row">
      <div class="span4">
       <div id="maskLoader" class="loader" ></div>
        <div class="logo"><a href="#"><img src="<%=request.getContextPath()%>/resource/images/logo.png" /></a></div>
      </div>
      <div class="span8">
        <section class="login-sec"> 
          <!--<div class="user-bt ano-r"><a href="#">Register</a>
            <div class="login-drop">
              <ul>
                <li><a href="#">Landlord</a></li>
                <li><a href="#">Contractor</a></li>
              </ul>
            </div>
          </div>-->
          <div class="user-bt"><a id="logoutHrefId" href="#" >Logout</a></div>
        </section>
        <div class="clearfix"></div>
        <div class="navbar navbar-inverse">
          <div class="navbar-inner">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="m-p" class="active">
                <a href="#contractorProfile" id="contractorProfile">My Profile</a>
                <div class="login-drop_1">
                  <ul>
                    <li><a href="#editContractor" id="editContractor" style="display: none;">Edit Profile</a></li>
                    <li><a href="#changeContractorPassword" id="changeContractorPassword">Change Password</a></li>
                  </ul>
                </div>
                </li>
                 <li class="m-p" class="active" >
                <a href="#allExpertise" id="allExpertise" style="display: none;">Expertise</a>
                <div class="login-drop_1">
                  <ul>
                    <li><a href="#addExpertise" id="addExpertise">Add Expertise</a></li>
                  </ul>
                </div>
                </li>
                <li class="m-p" class="active" >
                <a href="#allMails" id="allMails">Mails</a>
                </li>
                
                <li class="m-p" class="active">
                <a href="#allJobs" id="allJobs">All Jobs</a>
                	<!-- <div class="login-drop_1">
                  <ul>
                    <li><a href="#assignedJobs" id="assignedJobs">Assigned Jobs</a></li>
                    <li><a href="#completeJobs" id="completeJobs">Complete Jobs</a></li>
                    <li><a href="#rejectedJobs " id="rejectedJobs">Rejected Jobs</a></li>
                  </ul>
                </div> -->
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   <div class="logoutWindowPopUp" id="logoutWindowId" onclick = "check(event)" style="margin-top: 7%;">
  <div class="popupContact1">
    <div class="formClass1">
      <img src="resource/images/cross-image.png" id="close" style="display: none;"/> 
      <div class="h21" style=" padding:15px 35px;">
        <h2 style="text-align:center;">Logout Window</h2>
      </div>
      <div class="pop-p1">
        <p>Your Session is going to expire in</p>
        <p id="timeLeftId"> next 15 minutes</p>
        <p>Do You want to continue or logout??</p>
      </div>
      <div class="h21" style="border-top:1px solid #CCC; border-radius:0 0 6px 6px;">
        <button id="logoutBtnId" class="button-file1">Logout</button>
        <button id="continueBtnId" class="button-file1" style="margin-right:50px;">Continue</button>
      </div>
    </div>
  </div>
</div>
  <span id="commonMessageSuccessId" style="display: none; position: absolute; top:10%; margin: 0 auto; min-height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0; line-height: 20px;
  background: url('resource/images/ok-icon.png') no-repeat scroll 25px 10px / 25px 25px #66FF99; z-index:99999; text-align: left; padding: 12px 0 0 58px;"></span>
 <span id="commonMessageErrorId" style="display: none; position: absolute; top:10%; margin: 0 auto; min-height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0; line-height: 20px;
  background: url('resource/images/not-ok-icon.png') no-repeat scroll 25px 10px / 25px 25px #FFD6D6; z-index:99999; text-align: left; padding: 12px 0 0 58px;"></span>
  <span id="contractorFormMsg" style="display: none; position: absolute; top:10%; margin: 0 auto; min-height: 35px; border-radius:40px; width: 8%; border:1px solid #ccc; left:29%; right:0; line-height: 20px;
  background: url('${contextPath}/resource/images/ok-icon.png') no-repeat scroll 25px 10px / 25px 25px #66FF99; z-index:99999; text-align: left; padding: 12px 0 0 58px;"></span>
  
</header>