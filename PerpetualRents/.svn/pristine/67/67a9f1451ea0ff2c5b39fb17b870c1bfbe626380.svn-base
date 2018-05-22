package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum MailEventActor {
	UNDEFINED(0, "Undefined"),
	LANDLORD(1, "Landlord"),
	CONTRACTOR(2, "Contractor"),	
	SUB_ADMIN(3, "Sub Admin"),
	SUPER_ADMIN(4, "Super Admin"),
	PMC_ADMIN(5, "Property Management Company"),
	PMC_USERS(6, "PMC Users"),
	PROPERTY(7, "Property"),
	PROPERTY_DEVELOPER(8, "Property Developer");

	

	private final long id;
	private final String value;

	MailEventActor(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static MailEventActor get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return MailEventActor.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (MailEventActor act : MailEventActor.values()) {
				if (act.id == idx)
					return act;
			}
			return MailEventActor.UNDEFINED;
		} else {
			for (MailEventActor act : MailEventActor.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return MailEventActor.UNDEFINED;
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
		
		for(MailEventActor statusObj : MailEventActor.values()){
			if(!statusObj.equals(MailEventActor.UNDEFINED))
				jArray.put(new JSONObject().put("key", statusObj.id()).put("value", statusObj.value()));
		}
			
		
		return jArray;
	}
}
