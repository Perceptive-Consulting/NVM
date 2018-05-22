package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum MailFlowType {

	UNDEFINED(0, "Undefined"),
	SEND(1, "SEND"),
	RECEIVED(2, "RECEIVED"),
	ALL(3, "ALL");

	private final long id;
	private final String value;

	MailFlowType(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static MailFlowType get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return MailFlowType.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (MailFlowType act : MailFlowType.values()) {
				if (act.id == idx)
					return act;
			}
			return MailFlowType.UNDEFINED;
		} else {
			for (MailFlowType act : MailFlowType.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return MailFlowType.UNDEFINED;
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
		
		for(MailFlowType statusObj : MailFlowType.values()){
			if(!statusObj.equals(MailEventType.UNDEFINED))
				jArray.put(new JSONObject().put("key", statusObj.id()).put("value", statusObj.value()));
		}
			
		
		return jArray;
	}
}
