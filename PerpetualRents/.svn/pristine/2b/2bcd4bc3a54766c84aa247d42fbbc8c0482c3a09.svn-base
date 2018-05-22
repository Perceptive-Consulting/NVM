package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum CompanyType {
	UNDEFINED(0, "Undefined"),
	PUBLIC_LIMITED_COMPANY(1, "Public Limited Company"),
	LIMITED_COMPANY(2, "Limited Company"),
	PARTNERSHIP(3, "Partnership"),
	SOLE_TRADER(4, "Sole Trader"),
	OTHER(5, "Other(Please Specify)");
	

	private final long id;
	private final String value;

	CompanyType(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static CompanyType get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return CompanyType.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (CompanyType act : CompanyType.values()) {
				if (act.id == idx)
					return act;
			}
			return CompanyType.UNDEFINED;
		} else {
			for (CompanyType act : CompanyType.values()) {
				if (act.value.equalsIgnoreCase(status.toString()) || act.value.equalsIgnoreCase(status.toString()))
					return act;
			}
			return CompanyType.UNDEFINED;
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
		
		for(CompanyType statusObj : CompanyType.values()){
			if(!statusObj.equals(CompanyType.UNDEFINED))
				jArray.put(new JSONObject().put("key", statusObj.id()).put("value", statusObj.value()));
		}
			
		return jArray;
	}
}
