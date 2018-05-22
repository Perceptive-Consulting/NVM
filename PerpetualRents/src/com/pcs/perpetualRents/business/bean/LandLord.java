package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import javax.validation.constraints.Size;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class LandLord extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + LandLord.class.getSimpleName().toLowerCase();
	
	public static final String UNIQUE_REFERENCE = "uniqueReference";
	public static final String FIRST_NAME = "firstName";
	public static final String LAST_NAME = "lastName";
	public static final String PRIMARY_EMAIL_ID = "primaryEmailId";
	public static final String SECONDARY_EMAIL_ID = "secondaryEmailId";
	public static final String PRIMARY_PHONE_NUMBER = "primaryPhoneNumber";
	public static final String SECONDARY_PHONE_NUMBER = "secondaryPhoneNumber";
	public static final String PROPERTY_COUNT = "propertyCount";
	public static final String USER_LOGIN_ID = "userLoginId";
	
	private String uniqueReference;
	
	@Size(min=5,max=30,message="FirstName is invalid...")
	private String firstName;
	private String lastName;
	private String primaryEmailId;
	private String secondaryEmailId;
	private String primaryPhoneNumber;
	private String secondaryPhoneNumber;
	
	private long userLoginId;
	
	private UserLogin loginObj;
	private Address addressObj;
	private Country countryObj;
	
	private String errorMessage;
	private Integer propertyCount;
	
	public Integer getPropertyCount() {
		return propertyCount;
	}
	public void setPropertyCount(Integer propertyCount) {
		this.propertyCount = propertyCount;
	}
	public Country getCountryObj() {
		return countryObj;
	}
	public void setCountryObj(Country countryObj) {
		this.countryObj = countryObj;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public Address getAddressObj() {
		return addressObj;
	}
	public void setAddressObj(Address addressObj) {
		this.addressObj = addressObj;
	}
	public String getUniqueReference() {
		return uniqueReference;
	}
	public void setUniqueReference(String uniqueReference) {
		this.uniqueReference = uniqueReference;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPrimaryEmailId() {
		return primaryEmailId;
	}
	public void setPrimaryEmailId(String primaryEmailId) {
		this.primaryEmailId = primaryEmailId;
	}
	public String getSecondaryEmailId() {
		return secondaryEmailId;
	}
	public void setSecondaryEmailId(String secondaryEmailId) {
		this.secondaryEmailId = secondaryEmailId;
	}
	public String getPrimaryPhoneNumber() {
		return primaryPhoneNumber;
	}
	public void setPrimaryPhoneNumber(String primaryPhoneNumber) {
		this.primaryPhoneNumber = primaryPhoneNumber;
	}
	public String getSecondaryPhoneNumber() {
		return secondaryPhoneNumber;
	}
	public void setSecondaryPhoneNumber(String secondaryPhoneNumber) {
		this.secondaryPhoneNumber = secondaryPhoneNumber;
	}
	public long getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(long userLoginId) {
		this.userLoginId = userLoginId;
	}
	public UserLogin getLoginObj() {
		return loginObj;
	}
	public void setLoginObj(UserLogin loginObj) {
		this.loginObj = loginObj;
	}
	
	@Override
	public String toString() {
		return "LandLord [uniqueReference=" + uniqueReference + ", firstName="
				+ firstName + ", lastName=" + lastName + ", primaryEmailId="
				+ primaryEmailId + ", secondaryEmailId=" + secondaryEmailId
				+ ", primaryPhoneNumber=" + primaryPhoneNumber
				+ ", secondaryPhoneNumber=" + secondaryPhoneNumber
				+ ", userLoginId=" + userLoginId + ", loginObj=" + loginObj
				+ ", addressObj=" + addressObj + ", countryObj=" + countryObj
				+ ", errorMessage=" + errorMessage + ", getCountryObj()="
				+ getCountryObj() + ", getErrorMessage()=" + getErrorMessage()
				+ ", getAddressObj()=" + getAddressObj()
				+ ", getUniqueReference()=" + getUniqueReference()
				+ ", getFirstName()=" + getFirstName() + ", getLastName()="
				+ getLastName() + ", getPrimaryEmailId()="
				+ getPrimaryEmailId() + ", getSecondaryEmailId()="
				+ getSecondaryEmailId() + ", getPrimaryPhoneNumber()="
				+ getPrimaryPhoneNumber() + ", getSecondaryPhoneNumber()="
				+ getSecondaryPhoneNumber() + ", getUserLoginId()="
				+ getUserLoginId() + ", getLoginObj()=" + getLoginObj()
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
		
		jObj.put(LandLord.FIRST_NAME, this.firstName);
		jObj.put(LandLord.LAST_NAME, this.lastName);
		jObj.put(LandLord.PRIMARY_EMAIL_ID, this.primaryEmailId);
		jObj.put(LandLord.SECONDARY_EMAIL_ID, this.secondaryEmailId == null ? " " : this.secondaryEmailId);
		jObj.put(LandLord.PRIMARY_PHONE_NUMBER, this.primaryPhoneNumber);
		jObj.put(LandLord.SECONDARY_PHONE_NUMBER, this.secondaryPhoneNumber == null ? " " : this.secondaryPhoneNumber);
		jObj.put(LandLord.UNIQUE_REFERENCE, this.uniqueReference);
		jObj.put(LandLord.CREATED_BY, this.getCreatedBy() == null ? "Self Registered" : this.getCreatedBy());
		jObj.put(LandLord.CREATED_ON, this.getCreatedOn());
		jObj.put(LandLord.MODIFIED_BY, this.getModifiedBy() == null ? "Not yet Modified" : this.getModifiedBy());
		jObj.put(LandLord.MODIFIED_ON, this.getModifiedOn() == null ? "Not yet Modified" : this.getModifiedOn());
		jObj.put("completeName", this.firstName + " " + this.lastName);
		jObj.put(LandLord.PROPERTY_COUNT, this.propertyCount == null ? 0 : this.propertyCount);
		return jObj;
	}
	
}
