package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Admin extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Admin.class.getSimpleName().toLowerCase();
	
	public static final String UNIQUE_REFERENCE = "uniqueReference";
	public static final String FIRST_NAME = "firstName";
	public static final String LAST_NAME = "lastName";
	public static final String USER_LOGIN_ID = "userLoginId";
	public static final String ENABLE = "enable";
	public static final String CITIES_ALLOTED = "citiesAlloted";
	
	private String uniqueReference;
	private String firstName;
	private String lastName;
	private long loginUserId;
	private boolean enable;
	
	 
	private UserLogin loginObj;
	private Address addressObj;
	private ContactDetails contactDetailsObj;
	private List<String> cityAllotedList;
	private String cityAlloted;
	private String cityAllotedId;
	
	public List<String> getCityAllotedList() {
		return cityAllotedList;
	}
	public void setCityAllotedList(List<String> cityAllotedList) {
		this.cityAllotedList = cityAllotedList;
	}
	public UserLogin getLoginObj() {
		return loginObj;
	}
	public void setLoginObj(UserLogin loginObj) {
		this.loginObj = loginObj;
	}
	public String getUniqueReference() {
		return uniqueReference;
	}
	public void setUniqueReference(String uniqueReference) {
		this.uniqueReference = uniqueReference;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
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
	public long getLoginUserId() {
		return loginUserId;
	}
	public void setLoginUserId(long loginUserId) {
		this.loginUserId = loginUserId;
	}
	public Address getAddressObj() {
		return addressObj;
	}
	public void setAddressObj(Address addressObj) {
		this.addressObj = addressObj;
	}
	public ContactDetails getContactDetailsObj() {
		return contactDetailsObj;
	}
	public void setContactDetailsObj(ContactDetails contactDetailsObj) {
		this.contactDetailsObj = contactDetailsObj;
	}
	public String getCityAlloted() {
		return cityAlloted;
	}
	public void setCityAlloted(String cityAlloted) {
		this.cityAlloted = cityAlloted;
	}
	public String getCityAllotedId() {
		return cityAllotedId;
	}
	public void setCityAllotedId(String cityAllotedId) {
		this.cityAllotedId = cityAllotedId;
	}
	
	@Override
	public String toString() {
		return "Admin [uniqueReference=" + uniqueReference + ", firstName="
				+ firstName + ", lastName=" + lastName + ", loginUserId="
				+ loginUserId + ", enable=" + enable + ", loginObj=" + loginObj
				+ ", addressObj=" + addressObj + ", contactDetailsObj="
				+ contactDetailsObj + ", cityAllotedList=" + cityAllotedList
				+ ", cityAlloted=" + cityAlloted + "]";
	}
	public JSONObject toJSON(boolean includeSuper) throws JSONException{
		
			JSONObject jObj = new JSONObject();
		
			if(includeSuper)
				jObj = super.toJSON();
			
					jObj.put(Admin.ID, this.getId());
					jObj.put(Admin.FIRST_NAME, this.getFirstName());
					jObj.put(Admin.LAST_NAME, (this.lastName == null ? "" : this.lastName));
					jObj.put(Admin.ENABLE, this.enable);
					jObj.put(Admin.UNIQUE_REFERENCE, (this.uniqueReference == null ? "" : this.uniqueReference));
					jObj.put(Admin.CITIES_ALLOTED, this.cityAlloted == null ? "" : this.cityAlloted);
					jObj.put(Admin.USER_LOGIN_ID, (this.loginUserId));
					jObj.put(Admin.CREATED_BY, this.getCreatedBy());
					jObj.put("cityAllotedId", this.cityAllotedId);
					jObj.put("fullName", this.firstName + " " + this.lastName);
					
				return jObj;
		}
	
	}
