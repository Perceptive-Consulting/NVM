package com.pcs.perpetualRents.enm;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum ObjectStatus {
	
	APPROVED(1 , "Approved"),
	PENDING(2 , "Pending");
	
	
	private ObjectStatus(long id, String value) {
		this.id = id;
		this.value = value;
	}
	
	private long id;
	private String value;
		
	public static ObjectStatus getValue(String action){
		if(CommonFunctions.isInteger(action)){
			for (ObjectStatus termsObj : ObjectStatus.values()) {
				if(termsObj.id == Integer.parseInt(action)){
					return termsObj;
				}
			}
		}else{
			for (ObjectStatus termsObj : ObjectStatus.values()) {
				if(termsObj.value.equalsIgnoreCase(action))
					return termsObj;
			}
		}
		return null;
	}
	
	public long id() {
		return id;
	}

	public String value() {
		return value;
	}
	
}
