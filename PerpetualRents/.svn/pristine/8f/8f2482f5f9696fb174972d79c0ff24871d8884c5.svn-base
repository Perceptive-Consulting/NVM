package com.pcs.perpetualRents.enm;

import java.util.ArrayList;
import java.util.List;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;


public enum ADPL2Page {
	UNDEFINED(0, "Undefined" , "0"),
	SAVED_PROPERTY_DETAILS(1, "Saved Property Details" , "0"),
	HMO_LICENCE(2, "HMO License" , "1, 2, 3"),
	DHS_CRITERIA_A(3, "DHS-CRITERIA-A" , "4, 5, 6, 7, 8"),
	DHS_CRITERIA_B(4, "DHS-CRITERIA-B" , "9"),
	DHS_CRITERIA_C(5, "DHS-CRITERIA-C" , "10"),
	DHS_CRITERIA_D(6, "DHS-CRITERIA-D" , "11");

	private final long id;
	private final String value;
	private final String group;

	ADPL2Page(long idx, String value, String group) {
		this.id = idx;
		this.value = value;
		this.group = group;
	}
	
	public long id() {
		return id;
	}

	public String value() {
		return value;
	}
	public String group() {
		return group;
	}
	
	public static List<ADPL2Page> list(){
		ADPL2Page[] adpl2 = ADPL2Page.values();
		List<ADPL2Page> adpl2Pages = new ArrayList<ADPL2Page>();
		for (ADPL2Page adpl2Page : adpl2) {
			if(adpl2Page.id() == 0 || adpl2Page.id() == 1)
				continue;
			else{
				adpl2Pages.add(adpl2Page);
			}
		}
		return adpl2Pages;
	}
	 

	public static ADPL2Page get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return ADPL2Page.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (ADPL2Page act : ADPL2Page.values()) {
				if (act.id == idx)
					return act;
			}
			return ADPL2Page.UNDEFINED;
		} else {
			for (ADPL2Page act : ADPL2Page.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return ADPL2Page.UNDEFINED;
		}
	}
}
