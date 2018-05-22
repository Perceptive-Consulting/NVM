package com.pcs.perpetualRents.enm;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum PdDocumentsStatus {

	UNDEFINED(0, "Undefined"),
	UNREAD(1, "UnRead"),
	ALREADY_READ(2, "Already Read");

	private final Integer id;
	private final String value;

	PdDocumentsStatus(Integer idx, String value) {
		this.id = idx;
		this.value = value;
	}
	
	public Integer id() {
		return id;
	}

	public String value() {
		return value;
	}
	
	public static PdDocumentsStatus get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return PdDocumentsStatus.UNDEFINED;
		} 
		else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (PdDocumentsStatus act : PdDocumentsStatus.values()) {
				if (act.id == idx)
					return act;
			}
			return PdDocumentsStatus.UNDEFINED;
		} 
		else {
			for (PdDocumentsStatus act : PdDocumentsStatus.values()) {
				if (act.value.equalsIgnoreCase(status.toString()) || act.value.equalsIgnoreCase(status.toString()))
					return act;
			}
			return PdDocumentsStatus.UNDEFINED;
		}
	}
	
}
