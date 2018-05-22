package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.ContractorFunctionality;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Expertise extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Expertise.class.getSimpleName().toLowerCase();
	
	public static final String FUNCTIONALITY = "functionality";
	public static final String FUNCTIONALITY_ID = "functionalityId";
	public static final String QUALIFICATION = "qualification";
	public static final String ENABLE = "enabled";
	public static final String CONTRACTOR_ID = "contractorId";
	public static final String CITIES = "cities";
	public static final String CITY_SERVICED = "cityServiced";
	
	private String functionality;
	private String qualification;
	private boolean enable;
	
	private Short functionalityId;
	private String functionalityIdStr;
	private long contractorId;
	private String cityServiced;
	
	public String getCityServiced() {
		return cityServiced;
	}
	public void setCityServiced(String cityServiced) {
		this.cityServiced = cityServiced;
	}
	public String getFunctionalityIdStr() {
		return functionalityIdStr;
	}
	public void setFunctionalityIdStr(String functionalityIdStr) {
		this.functionalityIdStr = functionalityIdStr;
	}
	public Short getFunctionalityId() {
		return functionalityId;
	}
	public void setFunctionalityId(Short functionalityId) {
		this.functionalityId = functionalityId;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public long getContractorId() {
		return contractorId;
	}
	public void setContractorId(long contractorId) {
		this.contractorId = contractorId;
	}
	public String getFunctionality() {
		return ContractorFunctionality.get(this.functionalityId).value();
	}
	public void setFunctionality(String functionality) {
		this.functionality = functionality;
	}
	
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	
	@Override
	public String toString() {
		return "Expertise [functionality=" + functionality + ", qualification="
				+ qualification + ", enable=" + enable + ", functionalityId="
				+ functionalityId + ", contractorId=" + contractorId + "]";
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
			
			jObj.put(Expertise.FUNCTIONALITY_ID, this.functionalityId);
			jObj.put(Expertise.FUNCTIONALITY, this.functionality);
			jObj.put(Expertise.QUALIFICATION, this.qualification);
			jObj.put("functionalityIdStr", this.functionalityIdStr);
		
		return jObj;
	}
}
