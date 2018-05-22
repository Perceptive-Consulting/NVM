package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum ObjectType {
	UNDEFINED(0, "Undefined"),
	LANDLORD(1, "LandLord"),
	CONTRACTOR(2, "Contractor"),
	SUPER_PMC(3, "Super PMC"),
	PROPERTY(4, "Property"),
	EXPERTISE(5, "Expertise"),
	PROPERTY_MARKETING(6, "Property Marketing"),
	ADMIN(7, "Admin"),
	ADPL(8, "Adpl"),
	SUPER_ADMIN(9, "Super Admin"),
	CONTRACTOR_FUNCTIONALITY(10, "Contractor Functionality"),
	PMC(11, "PMC"),
    PROPERTY_DEVELOPER(12, "Property Developer"),
	PD_PROPERTY(13,"PD Property");
	
	private final long id;
	private final String value;

	ObjectType(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static ObjectType get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return ObjectType.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (ObjectType act : ObjectType.values()) {
				if (act.id == idx)
					return act;
			}
			return ObjectType.UNDEFINED;
		} else {
			for (ObjectType act : ObjectType.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return ObjectType.UNDEFINED;
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
		
		for(ObjectType statusObj : ObjectType.values())
			jArray.put(new JSONObject().put("id", statusObj.id()).put("displayField", statusObj.value()));
		
		return jArray;
	}
}
