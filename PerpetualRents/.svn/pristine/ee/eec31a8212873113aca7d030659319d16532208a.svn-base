package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class City extends BusinessObject{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + City.class.getSimpleName().toLowerCase();
	
	public static final String CITY = "city";
	public static final String CITY_ID = "cityId";
	public static final String OBJECT_TYPE = "objectType";
	public static final String OBJECT_ID = "objectId";
	
	private String city;
	private Long cityId;
	private long objectType;
	private long objectId;
	
	
	
	public City(String city, Long cityId, long objectType, long objectId) {
		super();
		this.city = city;
		this.cityId = cityId;
		this.objectType = objectType;
		this.objectId = objectId;
	}
	
	public Long getCityId() {
		return cityId;
	}
	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	public City() {
		super();
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Override
	public String toString() {
		return "City [city=" + city + ", objectType=" + objectType
				+ ", objectId=" + objectId + "]";
	}
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
			jObj.put(City.ID, this.getId());
			jObj.put(City.CITY, this.city);
			jObj.put(City.CITY_ID, this.cityId);
		
		return jObj;
		
	}
	
	@Override
	public int hashCode() {
		int result = 1;
		final int prime = 31;
		
		String cityStr = this.city;
		if(cityStr != null){
			result = cityStr.hashCode();
		}else{
			result = prime * result + ((city == null) ? 0 : city.hashCode());
			result = prime * result + (int) (objectId ^ (objectId >>> 32));
			result = prime * result + (int) (objectType ^ (objectType >>> 32));
		}
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		City other = (City) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		
		return true;
	}
	
	
	
}
