package com.pcs.perpetualRents.enm;

import java.util.ArrayList;
import java.util.List;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;


public enum EmailSubject {
	UNDEFINED(0, "Undefined"),
	QUOTATION_PERPETUAL(1, "Quotation-Perpetual For "),
	PMC_LANDLORD_SUBJECT(2, "Interested In Your Property Situated at ");

	private final long id;
	private final String value;

	EmailSubject(long idx, String value) {
		this.id = idx;
		this.value = value;
	}
	
	public long id() {
		return id;
	}

	public String value() {
		return value;
	}
	
	public static List<EmailSubject> list(){
		EmailSubject[] adpl2 = EmailSubject.values();
		List<EmailSubject> adpl2Pages = new ArrayList<EmailSubject>();
		for (EmailSubject adpl2Page : adpl2) {
			if(adpl2Page.id() == 0 || adpl2Page.id() == 1)
				continue;
			else{
				adpl2Pages.add(adpl2Page);
			}
		}
		return adpl2Pages;
	}
	 

	public static EmailSubject get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return EmailSubject.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (EmailSubject act : EmailSubject.values()) {
				if (act.id == idx)
					return act;
			}
			return EmailSubject.UNDEFINED;
		} else {
			for (EmailSubject act : EmailSubject.values()) {
				if (act.value.equals(status) || act.value.equals(status))
					return act;
			}
			return EmailSubject.UNDEFINED;
		}
	}
}
