<script  src="<%=request.getContextPath()%>/resource/js/jquery.colorbox.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/pmc/subPMC/subpmc.js"></script>
<div class="container">
	<sections class="contant-area">
	    <div class="button">
			<!-- <button style="display: none;" id="deleteButtonId">Delete</button> -->
			<button id="viewPMCUserDetailBackButtonId">Back</button>
			<button id="viewPMCUserDetailButtonId">View</button>
	    </div>
		<table id="pmcUserdataTableId" class="table display table-bordered"  cellspacing="0">
		    <thead>
		        	<tr>
		            	<th>S.No.</th>
		            	<th>Created On</th>
			            <th>Company Name</th>
			            <th>Authorised Person</th>
			            <th>Enable</th>
			            <th>Email</th>
			            <th>Phone Number</th>
		        	</tr>
		    </thead>
		</table>
	</sections>
</div>
