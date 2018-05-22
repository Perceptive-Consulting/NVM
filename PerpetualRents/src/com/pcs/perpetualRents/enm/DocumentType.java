package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum DocumentType {
	UNDEFINED(0, "Undefined"),
	CERTIFICATE(1, "Certificate"),
	INVOICE(2, "Invoice"),
	IMAGES(3, "Images"),
	DOCUMENT(4, "Document");

	private final long id;
	private final String value;

	DocumentType(long idx, String value) {
		this.id = idx;
		this.value = value;
	}

	public static DocumentType get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return DocumentType.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (DocumentType act : DocumentType.values()) {
				if (act.id == idx)
					return act;
			}
			return DocumentType.UNDEFINED;
		} else {
			for (DocumentType act : DocumentType.values()) {
				if (act.value.equalsIgnoreCase(status.toString()) || act.value.equalsIgnoreCase(status.toString()))
					return act;
			}
			return DocumentType.UNDEFINED;
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
		
		for(DocumentType statusObj : DocumentType.values()){
			if(!statusObj.equals(DocumentType.UNDEFINED))
				jArray.put(new JSONObject().put("key", statusObj.id()).put("value", statusObj.value()));
		}
			
		
		return jArray;
	}
}
