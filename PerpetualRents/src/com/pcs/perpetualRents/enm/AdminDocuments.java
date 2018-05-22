package com.pcs.perpetualRents.enm;

public enum AdminDocuments {

	UNDEFINED(0, "Undefined"),
	ADPL1(1, "Adpl1"),
	ADPL3(2, "Adpl2"),
	BANKING_DOCUMENTS(3, "Doc3"),
	TEERMS_AND_CONDITIONS(4,"Doc4"),
	PROPERTY_DEVELOPER_DOCUMENT_1(5, "Property Developer Document 1"),
	PROPERTY_DEVELOPER_DOCUMENT_2(6,"Property Developer Document 2");

	private final long id;
	private final String value;

	AdminDocuments(long idx, String value) {
		this.id = idx;
		this.value = value;
	}
	
	public long id() {
		return id;
	}

	public String value() {
		return value;
	}
}
