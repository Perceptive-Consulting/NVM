package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum SessionStatus {
	AUTO_DESTROYED(0, "Destroyed by System"),
	APPLICATION_DESTROYED(1, "Destroyed by Application"),
	USER_EVENT(2, "Destroyed by Logout Event"),
	ACTIVE(3, "Active");

	private final long id;
	private final String value;

	SessionStatus(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static SessionStatus get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return SessionStatus.AUTO_DESTROYED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (SessionStatus act : SessionStatus.values()) {
				if (act.id == idx)
					return act;
			}
			return SessionStatus.AUTO_DESTROYED;
		} else {
			for (SessionStatus act : SessionStatus.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return SessionStatus.AUTO_DESTROYED;
		}
	}
	
	public long id() {
		return id;
	}

	public String value() {
		return value;
	}
	
	public static JSONArray toJArray() throws JSONException {
		JSONArray jArray = new JSONArray();
		
		for(SessionStatus statusObj : SessionStatus.values())
			jArray.put(new JSONObject().put("id", statusObj.id()).put("displayField", statusObj.value()));
		
		return jArray;
	}
}
