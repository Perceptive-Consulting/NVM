 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/settings/settings.js"></script>
<style>
li.paginate_button{
width: 54%;
}
.tableDiv{
width:54%;
}

</style>

<sections class="contant-area" style="height:1500px;">
    <div class="button">
      <button id="createButtonId">Create</button>
      <button id="deleteButtonId" style="display: none;">Remove</button>
    </div>
    
    
    <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>Company Name</th>
            <th>Business Nature</th>
             <th>Company Type</th>
            <th>Status</th>
            <th>Trading Commencement Date</th>
            <th>Vat No</th>
        </tr>
    </thead>
</table>

  </sections>

 <div class="container">
  <section class="contant-area">
  
    <div class="clearfix"></div>
      <div class="rg-p innew" >
          <div class="button">
      <button id="createButtonId">Create</button>
      <button id="deleteButtonId" style="display: none;">Remove</button>
    </div>
    <div class="">
    <div id="errorId" class="alert alert-block alert-error fade in" style="display: none;" >
        <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
    </div>
   <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="display: none;" >
        <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="alert-heading" animation="true" id="successMessageId">Successfully Created.</h4>
   </div>
    <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
	    <thead>
	        <tr>
	            <th>S.No.</th>
	            <th>City Name</th>
	        </tr>
	    </thead>
	</table>
	</div>
          <div class="clearfix"></div>
        </div>
      </section>
    </div>
  

<div style="display:none; height: 100px; weight: 100px">
  <div id='create'>
    <form id="createPopupFormId" >
      <h1>Create New City</h1>
      <div class="form-element1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><label>Name:</label></td>
                      <td>
                        <input type="text" class="" id="city" /></td>
                    </tr>
                  </table>
      </div>
      <div id="delete_footer"><input type="button" id="createCityButton" value="Create" style="background-color:#E33A0C"/></div>
    </form>
  </div>
  
  
  <div id='delete'>
    <form id="deletePopupFormId" action="javascript:editPopupForm()">
      <h1>Remove City</h1>
      <div class="form-element">

      </div>
      <div id="delete_footer"><input id="delete_yes" type="button" value="Yes" style="background-color:#E33A0C"/>&nbsp&nbsp<input id="delete_no" type="button" value="No" /></div>
    </form>
  </div>
  </div>
  <style>
  a{
  color:#E33A0C;
  }
  a:hover{
  color:#E33A0C;
  }
  .tab-menu{
  z-index: 0;
  }
  </style>