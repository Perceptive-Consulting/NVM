package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class PerpetualCity extends BusinessObject{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PerpetualCity.class.getSimpleName().toLowerCase();
	
	public static final String CITY = "city";
	
	private String city;
	
	public PerpetualCity(String city, long objectType, long objectId) {
		super();
		this.city = city;
	}
	public PerpetualCity() {
		super();
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Override
	public String toString() {
		return "PerpetualCity [city=" + city + ", getId()=" + getId() + "]";
	}
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(PerpetualCity.CITY, this.city);
		
		return jObj;
		
	}
	
}
