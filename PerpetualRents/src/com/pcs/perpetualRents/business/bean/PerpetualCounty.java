package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class PerpetualCounty extends BusinessObject{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PerpetualCounty.class.getSimpleName().toLowerCase();
	
	public static final String COUNTY = "county";
	
	private String county;
	
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	
	@Override
	public String toString() {
		return "PerpetualCounty [county=" + county + "]";
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(PerpetualCounty.COUNTY, this.county);
		
		return jObj;
		
	}
	
}
