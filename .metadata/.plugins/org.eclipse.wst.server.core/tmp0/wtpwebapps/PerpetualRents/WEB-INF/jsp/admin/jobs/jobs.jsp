<script src="<%=request.getContextPath()%>/resource/perpetual/admin/jobs/allJobs.js"></script>
<style>
.regis { width:96.8%; padding:8px 2px; border:2px solid #E7E1E1; border-radius:3px; margin-bottom:5px; color:#333; height:38px;background-color:#fff}</style>
<div class="container">
  <sections class="contant-area">
    <div class="button">
    <button id="viewButtonId">View</button>
    </div><!-- table  --><!--  -->
    
   <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>Assigned By</th>
            <th>Assigned To</th>
            <th>Functionality/Job Name</th>
            <th>Assigned Date</th>
            <th>Estimated Completion Date</th>
            <th>Status</th>
        </tr>
    </thead>
</table>
  </sections>
</div>
  
   