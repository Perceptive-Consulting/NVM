<div class="row">
      <div class="span10">
        <h1 class="heading2 margin-top15"></h1>
         <div id="errorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
        <div class="rg-p">
         <form action="j_spring_security_check" method="post" >
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
	            <tr>
	              <td><label>User Name</label>
	                <input type="text" value="" placeholder="User Name" class="" name="j_username" id="" /></td>
	            </tr>
	            <tr>
	              <td><label>Password</label>
	                <input type="password" value="" placeholder="Password" class="" name="j_password" id="" /></td>
	            </tr>
              <tr>
                <td><input type="submit" id="" style="margin:0;" value="Log In" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
     <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
  </div>