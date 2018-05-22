package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class ContactDetails  extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + ContactDetails.class.getSimpleName().toLowerCase();

	
	public static final String EMAIL_ID = "emailId";
	public static final String PHONE_NUMBER = "phoneNumber";
	public static final String LANDLINE_PHONE_NUMBER = "landlinePhoneNumber";
	public static final String OBJECT_TYPE = "objectType";
	public static final String OBJECT_ID = "objectId";
	
	private String emailId;
	private String phoneNumber;
	private String landlinePhoneNumber;
	private Long objectType;
	private Long objectId;
	
	
	public String getLandlinePhoneNumber() {
		return landlinePhoneNumber;
	}
	public void setLandlinePhoneNumber(String landlinePhoneNumber) {
		this.landlinePhoneNumber = landlinePhoneNumber;
	}
	public Long getObjectType() {
		return objectType;
	}
	public void setObjectType(Long objectType) {
		this.objectType = objectType;
	}
	public Long getObjectId() {
		return objectId;
	}
	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	@Override
	public String toString() {
		return "ContactDetails [emailId=" + emailId + ", phoneNumber="
				+ phoneNumber + ", landlinePhoneNumber=" + landlinePhoneNumber
				+ ", objectType=" + objectType + ", objectId=" + objectId + "]";
	}
		
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
			if(includeParent)
				jObj = new JSONObject();
			
			jObj.put(ContactDetails.EMAIL_ID, this.emailId);
			jObj.put(ContactDetails.PHONE_NUMBER, this.phoneNumber);
			jObj.put(ContactDetails.LANDLINE_PHONE_NUMBER, this.landlinePhoneNumber);
			
			return jObj;
			
			
	}
	
}
