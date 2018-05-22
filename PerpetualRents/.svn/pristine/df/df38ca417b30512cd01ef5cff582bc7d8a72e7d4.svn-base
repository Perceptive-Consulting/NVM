package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.enm.ContractorFunctionality;

public class FunctionalityCostMatrix implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + FunctionalityCostMatrix.class.getSimpleName().toLowerCase();
	
	public static final String FUNCTIONALITY_ID = "functionalityId";
	public static final String CALL_OUT_MON_TO_FRI = "callOutMonToFri";
	public static final String CALL_OUT_WEEKENDS = "callOutWeekends";
	public static final String HOURLY_RATES = "hourlyRate";
	public static final String HOURLY_RATE_WEEKENDS = "hourlyRateWeekends";
	public static final String OBJECT_ID = "objectId";
	public static final String CONTRACTOR_ID = "contractorId";
	
	private Long functionalityId;
	private String callOutMonToFri;
	private String callOutWeekends;
	private String hourlyRate;
	private String hourlyRateWeekends;
	private Long objectId;
	private Long contractorId;
	
	private String functionalityStr;
	
	
	public String getFunctionalityStr() {
		return functionalityStr;
	}
	public void setFunctionalityStr(String functionalityStr) {
		this.functionalityStr = functionalityStr;
	}
	public Long getObjectId() {
		return objectId;
	}
	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}
	public Long getContractorId() {
		return contractorId;
	}
	public void setContractorId(Long contractorId) {
		this.contractorId = contractorId;
	}
	public Long getFunctionalityId() {
		return functionalityId;
	}
	public void setFunctionalityId(Long functionalityId) {
		this.functionalityId = functionalityId;
	}
	public String getCallOutMonToFri() {
		return callOutMonToFri;
	}
	public void setCallOutMonToFri(String callOutMonToFri) {
		this.callOutMonToFri = callOutMonToFri;
	}
	public String getCallOutWeekends() {
		return callOutWeekends;
	}
	public void setCallOutWeekends(String callOutWeekends) {
		this.callOutWeekends = callOutWeekends;
	}
	public String getHourlyRate() {
		return hourlyRate;
	}
	public void setHourlyRate(String hourlyRate) {
		this.hourlyRate = hourlyRate;
	}
	public String getHourlyRateWeekends() {
		return hourlyRateWeekends;
	}
	public void setHourlyRateWeekends(String hourlyRateWeekends) {
		this.hourlyRateWeekends = hourlyRateWeekends;
	}
	
	@Override
	public String toString() {
		return "FunctionalityCostMatrix [functionalityId=" + functionalityId
				+ ", callOutMonToFri=" + callOutMonToFri + ", callOutWeekends="
				+ callOutWeekends + ", hourlyRate=" + hourlyRate
				+ ", hourlyRateWeekends=" + hourlyRateWeekends + ", objectId="
				+ objectId + ", contractorId=" + contractorId + "]";
	}
	
	public JSONObject toJSON() throws JSONException{
		JSONObject jObj = new JSONObject();
		
			jObj.put(FunctionalityCostMatrix.CONTRACTOR_ID, this.contractorId);
			jObj.put(FunctionalityCostMatrix.FUNCTIONALITY_ID, this.functionalityId);
			jObj.put("functionalityStr", ContractorFunctionality.get(this.functionalityId).value());
			jObj.put(FunctionalityCostMatrix.CALL_OUT_MON_TO_FRI, this.callOutMonToFri);
			jObj.put(FunctionalityCostMatrix.CALL_OUT_WEEKENDS, this.callOutWeekends);
			jObj.put(FunctionalityCostMatrix.HOURLY_RATES, this.hourlyRate);
			jObj.put(FunctionalityCostMatrix.HOURLY_RATE_WEEKENDS, this.hourlyRateWeekends);
			jObj.put(FunctionalityCostMatrix.OBJECT_ID, this.objectId);
		
		return jObj;
	}
	
}
