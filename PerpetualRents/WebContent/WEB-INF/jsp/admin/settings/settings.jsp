 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/settings/settings.js"></script> 
<style>
/* li.paginate_button{
	width: 25px;
} */
.paginate_button.previous.disabled{
	width: 80px!important;
}
.tableDiv{
width:54%;
}

table#dataTableId{
	width: 100%!important;
}

</style>

<div class="container" style="width: 35%!important;">
  <sections class="contant-area">
    <div class="button">
	    <button id="createButtonId">Create</button>
	   <!--   <button id="uploadFileButtonId">Upload new Files</button> -->
     	 <button id="deleteButtonId" style="display: none;">Remove</button>
	    </div><!-- table  --><!--  -->
    
        <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead style="width: 12px!important;">
        <tr style="width: 50%!important;">
            <th style="width: 12px!important;">S.No.</th>
            <th style="width: 85%!important;">City</th>
        </tr>
    </thead>
</table>
  </sections>
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