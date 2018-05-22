package com.pcs.perpetualRents.enm;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum IdentityGeneratorObjective {
	
	PROPERTY_IDENTITY(1 , "Property"),
	LANDLORD_IDENTITY(2 , "Landlord"),
	CONTRACTOR_IDENTITY(3 , "Contractor"),
	PMC(4 , "Pmc"),
	INVOICE_IDENTITY(5 , "Invoice"),
	ADMIN(6 , "Admin"),
	PROPERTY_DEVELOPER_IDENTITY(7,"Property Developer");
	
	
	private IdentityGeneratorObjective(long id, String value) {
		this.id = id;
		this.value = value;
	}
	
	private long id;
	private String value;
	
	public static IdentityGeneratorObjective getValue(String action){
		if(CommonFunctions.isInteger(action)){
			for (IdentityGeneratorObjective termsObj : IdentityGeneratorObjective.values()) {
				if(termsObj.id == Integer.parseInt(action)){
					return termsObj;
				}
					
			}
		}else{
			for (IdentityGeneratorObjective termsObj : IdentityGeneratorObjective.values()) {
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
	
	public static JSONArray toJArray() throws JSONException {
		JSONArray jArray = new JSONArray();
		
		for(IdentityGeneratorObjective _Obj : IdentityGeneratorObjective.values())
			jArray.put(new JSONObject().put("id", _Obj.id()).put("displayField", _Obj.value()));
		
		return jArray;
	}
	
	
}
