package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import javax.validation.constraints.Size;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Lead extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Lead.class.getSimpleName().toLowerCase();
	
	public static final String NAME = "name";
	public static final String EMAIL = "email";
	public static final String CONTACT_NUMBER = "contactNumber";
	public static final String ADDRESS = "address";
	public static final String MESSAGE = "message";

	@Size(min=5,max=30,message="name is invalid...")
	private String name;
	private String email;
	private String contactNumber;
	private String address;
	private String message;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Lead [name="+name + ", email="+email + ", contactNumber="+contactNumber
				+ ", address="+address + ", message="+message
				+ ", getId()=" + getId() + ", getCreatedOn()=" + getCreatedOn()
				+ ", getModifiedOn()=" + getModifiedOn()
				+ ", getCreatedUserId()=" + getCreatedUserId()
				+ ", getModifiedUserId()=" + getModifiedUserId()
				+ ", getCreatedBy()=" + getCreatedBy() + ", getModifiedBy()="
				+ getModifiedBy() +  "]";
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(Lead.NAME, this.name);
		jObj.put(Lead.EMAIL, this.email);
		jObj.put(Lead.CONTACT_NUMBER, this.contactNumber);
		jObj.put(Lead.ADDRESS, this.address);
		jObj.put(Lead.MESSAGE, this.message);
				
		return jObj;
	}
	
}

