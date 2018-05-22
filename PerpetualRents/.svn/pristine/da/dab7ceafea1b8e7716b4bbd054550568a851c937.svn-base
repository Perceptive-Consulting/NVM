package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum Enable {
	DISABLE(0, "Disbale"),
	ENABLE(1, "Enable");

	private final long id;
	private final String value;

	Enable(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static Enable get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return Enable.DISABLE;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (Enable act : Enable.values()) {
				if (act.id == idx)
					return act;
			}
			return Enable.DISABLE;
		} else {
			for (Enable act : Enable.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return Enable.DISABLE;
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
		
		for(Enable statusObj : Enable.values())
			jArray.put(new JSONObject().put("id", statusObj.id()).put("displayField", statusObj.value()));
		
		return jArray;
	}
}
