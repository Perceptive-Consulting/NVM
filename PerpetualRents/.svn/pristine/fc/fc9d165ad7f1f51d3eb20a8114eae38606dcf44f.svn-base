package com.pcs.perpetualRents.business.bean;

import java.math.BigInteger;
import java.security.SecureRandom;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.UserType;

@JsonIgnoreProperties(ignoreUnknown=true)
public class UserLogin extends BusinessObject {
	
	private static final long serialVersionUID = 1L;
	
	
	public static final String TABLE_NAME = "users";
	
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String ENABLE = "enabled";
	public static final String HINT_QUESTION = "hintQuestion";
	public static final String HINT_ANSWER = "hintAnswer";
	public static final String USER_TYPE_ID= "userTypeId";
	public static final String USER_TYPE= "userType";
	
	private String username;
	private String password;
	private Boolean enable;
	private String hintQuestion;
	private String hintAnswer;
	private Integer userTypeId;
	
	private String userType;
	
	private String errorMessage;
	
	public String getUserType() {
		this.userType = UserType.getValue(String.valueOf(this.userTypeId)).value();
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getHintQuestion() {
		return hintQuestion;
	}
	public void setHintQuestion(String hintQuestion) {
		this.hintQuestion = hintQuestion;
	}
	public String getHintAnswer() {
		return hintAnswer;
	}
	public void setHintAnswer(String hintAnswer) {
		this.hintAnswer = hintAnswer;
	}
	public Integer getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public ObjectType getObjectType() throws Exception{
		if(this.userTypeId == UserType.SUPER_PMC.id()){
			return ObjectType.SUPER_PMC;
		}else if(this.userTypeId == UserType.PMC.id()){
			return ObjectType.PMC;
		}else{
			throw new Exception();
		}
	}
	
	public void createPassword(){
		SecureRandom random = new SecureRandom();
		String str = new BigInteger(130, random).toString(32).substring(0, 5);
		this.setPassword(this.username + str);
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
			jObj.put(UserLogin.USERNAME, this.username);
			jObj.put(UserLogin.ENABLE, ((this.enable == null|| this.enable == false) ? "Disabled" : "Enabled"));
			jObj.put(UserLogin.PASSWORD, this.password);
		
		return jObj;
	}
	
	@Override
	public String toString() {
		return "UserLogin [username=" + username + ", password=" + password
				+ ", enable=" + enable + ", hintQuestion=" + hintQuestion
				+ ", hintAnswer=" + hintAnswer + ", userTypeId=" + userTypeId
				+ "]";
	}
	
}	
