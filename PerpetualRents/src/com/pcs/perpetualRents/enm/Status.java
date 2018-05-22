package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum Status {
	UNDEFINED(0 , "Select Status"),
	ACTIVE(1 , "Active"),
	INACTIVE(2 , "InActive"),
	PARTIAL_COMPLETE(3 , "Partial Complete"),
	COMPLETE(4 , "Complete"),
	APPROVED(5 , "Approved"),
	UNAPPROVED(6 , "Un-Approved"),
	ASSIGNED(7 , "Assigned"),
	ON_WORK(8 , "On Work"),
	REJECTED(9 , "Rejected"),
	ACCEPTED(10 , "Accepted"),
	NEWLY_UPLOADED(11 , "Uploaded By Contractor");
	
	private Status(long id, String value) {
		this.id = id;
		this.value = value;
	}
	
	private long id;
	private String value;
		
	public static Status get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return Status.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (Status act : Status.values()) {
				if (act.id == idx)
					return act;
			}
			return Status.UNDEFINED;
		} else {
			for (Status act : Status.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return Status.UNDEFINED;
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
		
		for(Status _Obj : Status.values())
			jArray.put(new JSONObject().put("id", _Obj.id()).put("displayField", _Obj.value()));
		
		return jArray;
	}
	
	public JSONObject toJSON() throws JSONException{
		
		JSONObject jObj = new JSONObject();
			jObj.put("id", this.id()).put("value", this.value());
		
		return jObj;
	}
	
}
