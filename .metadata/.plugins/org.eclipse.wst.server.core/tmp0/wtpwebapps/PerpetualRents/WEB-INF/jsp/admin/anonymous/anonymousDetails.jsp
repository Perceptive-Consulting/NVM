 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/anonymous/anonymousDetails.js"></script>
 <div class="container-ar">
  <section class="contant-area">
  	<div id="errorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
    <div class="button"><button id="allLeads">Back</button>
    </div>
    <div class="rgpinnew">
          <ul>
            <li><strong>Name</strong><samp>:</samp><span id="name"></span></li>
            <li><strong>Address</strong><samp>:</samp><span id="address"></span></li>
            <li><strong>Email Id</strong><samp>:</samp><span id="email"></span></li>
            <li><strong>Contact Number</strong><samp>:</samp><span id="contactNumber"></span></li>   
            <li><strong>Message</strong><samp>:</samp><span id="message"></span></li>           
          </ul>
          <div class="clearfix"></div>
        </div>    
  </section>
  </div>