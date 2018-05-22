package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Role implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "authorities";
	
	public static String USERNAME = "username";
	public static String AUTHORITY = "authority";
	
	private String username;
	private String authority;
	
	public Role(String username, String authority) {
		super();
		this.username = username;
		this.authority = authority;
	}
	

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	public JSONObject toJSON() throws JSONException {
		JSONObject jObj = new JSONObject();
				
			jObj.put("username", this.username);
			jObj.put("authority", this.authority);

		return jObj;
	}
	
	@Override
	public String toString() {
		return "Role [username=" + username + ", authority=" + authority + "]";
	}
	
	
}

