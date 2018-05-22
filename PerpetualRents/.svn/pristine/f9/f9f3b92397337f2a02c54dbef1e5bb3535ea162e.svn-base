package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

public class TurnOverDetails extends BusinessObject implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + TurnOverDetails.class.getSimpleName().toLowerCase();
	
	public static final String CONTRACTOR_ID = "contractorId";
	public static final String FINANCIAL_YEAR = "financialYear";
	public static final String TURNOVER = "turnOver";
	
	private Long contractorId;
	private String financialYear;
	private String turnOver;
	
	public Long getContractorId() {
		return contractorId;
	}
	public void setContractorId(Long contractorId) {
		this.contractorId = contractorId;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getTurnOver() {
		return turnOver;
	}
	public void setTurnOver(String turnOver) {
		this.turnOver = turnOver;
	}
	
	@Override
	public String toString() {
		return "TurnOverDetails [contractorId=" + contractorId
				+ ", financialYear=" + financialYear + ", turnOver=" + turnOver
				+ "]";
	}
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(CONTRACTOR_ID, this.contractorId);
		jObj.put(FINANCIAL_YEAR, this.financialYear);
		jObj.put(TURNOVER, this.turnOver);
		
		return jObj;
		
		
		
	}
	
}
