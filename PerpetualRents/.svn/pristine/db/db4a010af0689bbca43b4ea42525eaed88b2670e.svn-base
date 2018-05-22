package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Address extends BusinessObject implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Address.class.getSimpleName().toLowerCase();
	
	public static final String ADDRESS_LINE1 = "addressLine1";
	public static final String ADDRESS_LINE2 = "addressLine2";
	public static final String CITY = "city";
	public static final String COUNTY = "county";
	public static final String POSTCODE = "postCode";
	public static final String LANDMARK = "landmark";
	public static final String LATITUDE = "latitude";
	public static final String LONGITUDE = "longitude";
	public static final String TELEPHONE_NUMBER = "telephoneNumber";
	public static final String OBJECT_TYPE = "objectType";
	public static final String OBJECT_ID = "objectId";
	public static final String COUNTRY_ID = "countryId";
	
	private String addressLine1;
	private String addressLine2;
	
	private String city;
	private String county;

	private String postCode;
	private String landmark;
	private String latitude;
	private String longitude;
	private String telephoneNumber;
	private long objectType;
	private long objectId;
	private long countryId;
	private Long cityId;
	
	private City cityObj;
	private Country countryObj;
	
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}
	public City getCityObj() {
		return cityObj;
	}
	public void setCityObj(City cityObj) {
		this.cityObj = cityObj;
	}
	public Long getCityId() {
		return cityId;
	}
	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	public Country getCountryObj() {
		return countryObj;
	}
	public void setCountryObj(Country countryObj) {
		this.countryObj = countryObj;
	}
	public long getCountryId() {
		return countryId;
	}
	public void setCountryId(long countryId) {
		this.countryId = countryId;
	}
	public long getObjectType() {
		return objectType;
	}
	public void setObjectType(long objectType) {
		this.objectType = objectType;
	}
	public long getObjectId() {
		return objectId;
	}
	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getPostCode() {
		return postCode.toUpperCase();
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode.toUpperCase();
	} 
	
	public JSONObject toJSON(boolean includeSuper) throws JSONException{
		
		JSONObject jObj = new JSONObject();
		
		if(includeSuper)
			jObj = super.toJSON();
			
				jObj.put(Address.ID, this.getId());
				jObj.put(Address.ADDRESS_LINE1, this.addressLine1);
				jObj.put(Address.ADDRESS_LINE2, (this.addressLine2 == null ? "" : this.addressLine2));
				jObj.put(Address.CITY, this.getCity());
				jObj.put(Address.COUNTY, (this.county == null ? "" : this.county));
				jObj.put(Address.LANDMARK, (this.landmark == null ? "" : this.landmark));
				jObj.put(Address.POSTCODE, this.postCode.toUpperCase());
				jObj.put(Address.TELEPHONE_NUMBER, this.telephoneNumber);				
				
		return jObj;
	}
	
	
	@Override
	public String toString() {
		return "Address [addressLine1=" + addressLine1 + ", addressLine2="
				+ addressLine2 + ", city=" + city + ", county=" + county
				+ ", postCode=" + postCode + ", landmark=" + landmark
				+ ", latitude=" + latitude + ", longitude=" + longitude
				+ ", telephoneNumber=" + telephoneNumber + ", objectType="
				+ objectType + ", objectId=" + objectId + ", countryId="
				+ countryId + ", cityId=" + cityId + ", cityObj=" + cityObj
				+ ", countryObj=" + countryObj + "]";
	}
	
	
}
