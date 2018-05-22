package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.Status;

public class AssignModel extends BusinessObject  {

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + AssignModel.class.getSimpleName().toLowerCase();
	
	public static final String ASSIGN_BY_ID = "assignById";
	public static final String ASSIGN_BY_TYPE_ID = "assignByTypeId";
	public static final String ASSIGN_TO_ID = "assignToId";
	public static final String ASSIGN_TO_TYPE_ID = "assignToTypeId";
	public static final String CITY_ID = "cityId";
	public static final String PROPERTY_ID = "propertyId";
	public static final String ENABLE = "enable";
	public static final String REMARKS = "remarks";
	public static final String STATUS_ID = "statusId";
	public static final String FUNCTIONALITY_ID = "functionalityId";
	public static final String ESTIMATED_COMPLETION_DATE = "estimatedCompletionDate";
	public static final String ESTIMATED_COST = "estimatedCost";
	public static final String JOBS_DESCRIPTION = "jobDescription";
			
	private Long assignById;
	private Long assignByTypeId;
	private Long assignToId;
	private Long assignToTypeId;
	private Long cityId;
	private Long propertyId;
	private Boolean enable;
	private String remarks;
	private Long statusId;
	private Long functionalityId;
	
	private String estimatedCompletionDate;
	private String estimatedCost;
	private String jobDescription;
	
	private String status;
	private String contractorName;
	private String landlordName;
	
	private String errorMessage;
	
	private LandLord landlordObj;
	private Contractor contractorObj;
	private Property propertyObj;
	
	
	public AssignModel() {
		super();
	}
	
	
	public LandLord getLandlordObj() {
		return landlordObj;
	}

	public void setLandlordObj(LandLord landlordObj) {
		this.landlordObj = landlordObj;
	}

	public Contractor getContractorObj() {
		return contractorObj;
	}

	public void setContractorObj(Contractor contractorObj) {
		this.contractorObj = contractorObj;
	}

	public Property getPropertyObj() {
		return propertyObj;
	}

	public void setPropertyObj(Property propertyObj) {
		this.propertyObj = propertyObj;
	}

	public String getLandlordName() {
		return landlordName;
	}

	public void setLandlordName(String landlordName) {
		this.landlordName = landlordName;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getContractorName() {
		return contractorName;
	}

	public void setContractorName(String contractorName) {
		this.contractorName = contractorName;
	}

	public Long getFunctionalityId() {
		return functionalityId;
	}

	public void setFunctionalityId(Long functionalityId) {
		this.functionalityId = functionalityId;
	}

	public String getEstimatedCompletionDate() {
		return estimatedCompletionDate;
	}

	public void setEstimatedCompletionDate(String estimatedCompletionDate) {
		this.estimatedCompletionDate = estimatedCompletionDate;
	}

	public String getEstimatedCost() {
		return estimatedCost;
	}

	public void setEstimatedCost(String estimatedCost) {
		this.estimatedCost = estimatedCost;
	}

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}

	public String getStatus() {
		this.status = Status.get(this.statusId).value();
		return status;
	}

	public void setStatus(String status) {
		this.status = Status.get(this.statusId).value();
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public Long getAssignById() {
		return assignById;
	}
	public void setAssignById(Long assignById) {
		this.assignById = assignById;
	}
	public Long getAssignByTypeId() {
		return assignByTypeId;
	}
	public void setAssignByTypeId(Long assignByTypeId) {
		this.assignByTypeId = assignByTypeId;
	}
	public Long getAssignToId() {
		return assignToId;
	}
	public void setAssignToId(Long assignToId) {
		this.assignToId = assignToId;
	}
	public Long getAssignToTypeId() {
		return assignToTypeId;
	}
	public void setAssignToTypeId(Long assignToTypeId) {
		this.assignToTypeId = assignToTypeId;
	}
	public Long getCityId() {
		return cityId;
	}
	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	public Long getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Override
	public String toString() {
		return "AssignModel [assignById=" + assignById + ", assignByTypeId="
				+ assignByTypeId + ", assignToId=" + assignToId
				+ ", assignToTypeId=" + assignToTypeId + ", cityId=" + cityId
				+ ", propertyId=" + propertyId + ", enable=" + enable
				+ ", remarks=" + remarks + ", statusId=" + statusId
				+ ", functionalityId=" + functionalityId
				+ ", estimatedCompletionDate=" + estimatedCompletionDate
				+ ", estimatedCost=" + estimatedCost + ", jobDescription="
				+ jobDescription + ", status=" + status + ", contractorName="
				+ contractorName + ", landlordName=" + landlordName
				+ ", errorMessage=" + errorMessage + "]";
	}

	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			
			if(includeParent)
				jObj = super.toJSON();

				jObj.put(AssignModel.ASSIGN_BY_ID, this.assignById);
				jObj.put(AssignModel.ASSIGN_BY_TYPE_ID, this.assignByTypeId);
				jObj.put(AssignModel.ASSIGN_TO_ID, this.assignToId);
				jObj.put(AssignModel.ASSIGN_TO_TYPE_ID, this.assignToTypeId);
				jObj.put(AssignModel.CITY_ID, this.cityId);
				jObj.put(AssignModel.PROPERTY_ID, this.propertyId);
				jObj.put(AssignModel.ENABLE, this.enable);
				jObj.put(AssignModel.REMARKS, this.remarks);
				jObj.put(AssignModel.STATUS_ID, this.statusId);
				jObj.put(AssignModel.ESTIMATED_COMPLETION_DATE, this.estimatedCompletionDate);
				jObj.put(AssignModel.ESTIMATED_COST, this.estimatedCost);
				jObj.put(AssignModel.FUNCTIONALITY_ID, this.functionalityId);
				jObj.put(AssignModel.JOBS_DESCRIPTION, this.jobDescription);
				
				jObj.put("statusStr", Status.get(this.statusId).value());
				jObj.put("jobName", ContractorFunctionality.get(this.functionalityId).value());
				jObj.put("contractorName", this.contractorName);
				jObj.put("landlordName", this.landlordName);
			
			return jObj;
			
		
	}
	
	
}
