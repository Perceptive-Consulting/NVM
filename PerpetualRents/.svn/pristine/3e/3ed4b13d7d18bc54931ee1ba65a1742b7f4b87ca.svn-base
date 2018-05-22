package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Country extends BusinessObject implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Country.class.getSimpleName().toLowerCase();
	
	public static final String COUNTRY_NAME = "countryName";
	public static final String COUNTRY_ALIAS = "countryAlias";
	public static final String COUNTRY_CODE = "countryCode";
	public static final String CURRENCY = "currency";
	public static final String TIME_ZONE = "timezone";
	
	private String countryName;
	private String countryAlias;
	private String countryCode;
	private String currency;
	private String timezone;
	
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCountryAlias() {
		return countryAlias;
	}
	public void setCountryAlias(String countryAlias) {
		this.countryAlias = countryAlias;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(Country.COUNTRY_NAME, this.countryName);
		jObj.put(Country.COUNTRY_ALIAS, this.countryAlias);
		jObj.put(Country.COUNTRY_CODE, this.countryCode);
		jObj.put(Country.CURRENCY, this.currency);
		jObj.put(Country.TIME_ZONE, this.timezone);
		
		return jObj;
	}
	
}
