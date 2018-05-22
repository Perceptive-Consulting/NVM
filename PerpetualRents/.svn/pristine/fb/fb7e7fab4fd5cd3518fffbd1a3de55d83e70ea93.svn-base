package com.pcs.perpetualRents.enm;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum UserType {
	
	SUPER_ADMIN(1 , "Super Admin"),
	ADMIN(2 , "Admin"),
	LANDLORD(3 , "Landlord"),
	CONTRACTOR(4 , "Contractor"),
	SUPER_PMC(5 , "Charity"),
	PMC(6 , "Charity Users"),
	PROPERTY_DEVELOPER(7,"Property Developer");
	
	private UserType(int id, String value) {
		this.id = id;
		this.value = value;
	}
	
	private int id;
	private String value;

	public static UserType getValue(String action){
		if(CommonFunctions.isInteger(action)){
			for (UserType termsObj : UserType.values()) {
				if(termsObj.id == Integer.parseInt(action)){
					return termsObj;
				}
					
			}
		}else{
			for (UserType termsObj : UserType.values()) {
				if(termsObj.value.equalsIgnoreCase(action))
					return termsObj;
			}
		}
		return null;
	}
	
	public int id() {
		return id;
	}

	public String value() {
		return value;
	}
	
}
