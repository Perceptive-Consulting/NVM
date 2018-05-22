package com.pcs.perpetualRents.common.bean;

import java.io.Serializable;
import java.util.Date;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import com.pcs.perpetualRents.enm.SessionStatus;

@Component
public class ApplicationSession extends BusinessObject implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = " tbl_" + ApplicationSettings.APP_NAME + "_" + ApplicationSession.class.getSimpleName().toLowerCase() + " ";
	
	public static String ID = "id";
	public static String IP_ADDRESS = "IPAddress";
	public static String USERNAME = "username";
	public static String SESSION_IDENTITY = "sessionIdentity";
	public static String CREATED_ON = "createdOn";
	public static String DESTROYED_ON = "destroyedOn";
	public static String SESSION_STATUS = "sessionStatus";
	
	private static final String FIELD_QUERY = " " +
			ApplicationSession.ID + " int(11) NOT NULL AUTO_INCREMENT, " +
			ApplicationSession.CREATED_ON + " TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, " +
			ApplicationSession.USERNAME + " varchar(32) NOT NULL, " +
			ApplicationSession.IP_ADDRESS + " varchar(32) NOT NULL, " +
			ApplicationSession.SESSION_IDENTITY + " varchar(128) NOT NULL, " +
			ApplicationSession.DESTROYED_ON + " TIMESTAMP, " +
			ApplicationSession.SESSION_STATUS + " int(11) NOT NULL, " +
			"PRIMARY KEY (" + ApplicationSession.ID + ") ";
	
	public static final String CREATE_QUERY = "CREATE TABLE " + TABLE_NAME + " (" + FIELD_QUERY + ");";
	
	private Long id;
	private String IPAddress;
	private String username;
	private String sessionIdentity;
	private Date createdOn;
	private Date destroyedOn;
	private Long sessionStatus;
	
	
	public ApplicationSession(String username, String sessionIdentity, String IPAddress){
		this.username = username;
		this.sessionIdentity = sessionIdentity;
		this.IPAddress = IPAddress;
		this.createdOn = new Date();
		this.sessionStatus = SessionStatus.ACTIVE.id();
	}
	public ApplicationSession() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIPAddress() {
		return IPAddress;
	}

	public void setIPAddress(String iPAddress) {
		IPAddress = iPAddress;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSessionIdentity() {
		return sessionIdentity;
	}

	public void setSessionIdentity(String sessionIdentity) {
		this.sessionIdentity = sessionIdentity;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getDestroyedOn() {
		return destroyedOn;
	}

	public void setDestroyedOn(Date destroyedOn) {
		this.destroyedOn = destroyedOn;
	}

	public Long getSessionStatus() {
		return sessionStatus;
	}

	public void setSessionStatus(Long sessionStatus) {
		this.sessionStatus = sessionStatus;
	}

	public JSONObject toJSON() throws JSONException {
		JSONObject jObj = new JSONObject();
		
			jObj.put("IPAddress", this.IPAddress);
			jObj.put("username", this.username);
			jObj.put("createdOn", this.createdOn);
			jObj.put("destroyedOn", this.destroyedOn);
			jObj.put("sessionIdentity", this.sessionIdentity);
			
		return jObj;
	}
}
