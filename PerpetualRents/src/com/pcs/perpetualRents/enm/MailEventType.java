package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum MailEventType {
	UNDEFINED(0, "Undefined"),
	REGISTER(1, "Register"),
	PROFILE_EDIT(2, "Profile Edit"),
	PASSWORD_CHANGE(3, "Password Change"),
	ENABLE(4, "Edit"),
	DISABLE(5, "Disable"),
	SEND_QUOTATION(6, "Send Quotation"),
	APPROVE(7, "Approve"),
	DIS_APPROVE(8, "DisApprove"),
	SUBMIT(9, "Submit"),
	ASSIGN(10, "Assign"),
	UPLOAD(11, "Upload"),
	PASSWORD_RESET(12, "Password Reset"),
	EDIT(13, "Edit"),
	ACCEPT(14, "Edit"),
	REJECT(15, "Edit"), 
	BAR_STATUS(16, "Bar Status"),
	CONVERSATION(17, "Conversation"),
	ADD_CITY(18,"AddCity"),
	EDIT_CITY(19,"EditCity"),
	ADMIN_UPLOAD_FOR_PDPROPERTY(20,"Admin_Upload_For_Property"),
	ADMIN_UPDATE_FOR_PDPROPERTY(21,"Admin_Update_For_Property");

	private final long id;
	private final String value;

	MailEventType(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static MailEventType get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return MailEventType.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (MailEventType act : MailEventType.values()) {
				if (act.id == idx)
					return act;
			}
			return MailEventType.UNDEFINED;
		} else {
			for (MailEventType act : MailEventType.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return MailEventType.UNDEFINED;
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
		
		for(MailEventType statusObj : MailEventType.values()){
			if(!statusObj.equals(MailEventType.UNDEFINED))
				jArray.put(new JSONObject().put("key", statusObj.id()).put("value", statusObj.value()));
		}
			
		
		return jArray;
	}
}
