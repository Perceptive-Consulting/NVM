package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum ContractorView {
	UNDEFINED(0 , "Undefined"),
	ALL_ASSIGNED_JOBS(1 , "All Assigned Jobs"),
	ALL_ACCEPTED_JOBS(2 , "InAll Accepted Jobs"),
	ALL_REJECTED_JOBS(3 , "All Rejected Jobs"),
	ALL_COMPLETE_JOBS(4 , "All Complete Jobs");
	
	private ContractorView(long id, String value) {
		this.id = id;
		this.value = value;
	}
	
	private long id;
	private String value;
		
	public static ContractorView get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return ContractorView.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (ContractorView act : ContractorView.values()) {
				if (act.id == idx)
					return act;
			}
			return ContractorView.UNDEFINED;
		} else {
			for (ContractorView act : ContractorView.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return ContractorView.UNDEFINED;
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
		
		for(ContractorView _Obj : ContractorView.values())
			jArray.put(new JSONObject().put("id", _Obj.id()).put("displayField", _Obj.value()));
		
		return jArray;
	}
	
	public JSONObject toJSON() throws JSONException{
		
		JSONObject jObj = new JSONObject();
			jObj.put("id", this.id()).put("value", this.value());
		
		return jObj;
	}
	
}
