package com.pcs.perpetualRents.enm;

public enum PropertyType {

	UNDEFINED(0, "Undefined"),
	CURRENT_DEVELOPMENT(1, "Current Development"),
	PROPOSED_DEVELOPMENT(2, "Proposed Development");

	private final Integer id;
	private final String value;

	PropertyType(Integer idx, String value) {
		this.id = idx;
		this.value = value;
	}
	
	public Integer id() {
		return id;
	}

	public String value() {
		return value;
	}
}
