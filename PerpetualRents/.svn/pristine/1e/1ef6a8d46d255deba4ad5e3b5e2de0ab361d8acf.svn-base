package com.pcs.perpetualRents.business.bean;


import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;

@JsonIgnoreProperties(ignoreUnknown=true)
public class IdentityGenerator implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + IdentityGenerator.class.getSimpleName().toLowerCase();
	
	public static final String OBJECTIVE = "objective";
	public static final String START = "start";
	public static final String END = "end";
	public static final String LENGTH = "length";
	public static final String PREFIX = "prefix";
	public static final String IDENTITY_NUMBER = "identityNumber";
	public static final String REFERENCE = "reference";
	
	private String objective;
	private long start;
	private long end;
	private Integer length;
	private String prefix;
	private String identityNumber;
	private String reference;
	
	
	
	public IdentityGenerator() {
		super();
	}
	public IdentityGenerator(IdentityGenerator obj) {
		super();
		this.objective = obj.getObjective();
		this.start = obj.getStart();
		this.end = obj.getEnd();
		this.length = obj.getLength();
		this.prefix = obj.getPrefix();
		this.identityNumber = obj.getIdentityNumber();
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getReference() {
		String.format("", this.reference);
		return reference;
	}
	public void setReference(String reference) {
		this.reference = this.prefix.toUpperCase() + String.format("%0"+ this.length + "d", (Integer.parseInt(reference) + 9999));
	}
	public String getObjective() {
		return objective;
	}
	public void setObjective(String objective) {
		this.objective = objective;
	}
	public long getStart() {
		return start;
	}
	public void setStart(long start) {
		this.start = start;
	}
	public long getEnd() {
		return end;
	}
	public void setEnd(long end) {
		this.end = end;
	}
	public Integer getLength() {
		return length;
	}
	public void setLength(Integer length) {
		this.length = length;
	}
	public String getIdentityNumber() {
		return identityNumber;
	}
	public void setIdentityNumber(String identityNumber) {
		this.identityNumber = identityNumber;
	}
	public String getNewIdentity(){
		return ""+(Integer.parseInt(this.identityNumber) + 99);
	}
	
	@Override
	public String toString() {
		return "IdentityGenerator [objective=" + objective + ", start=" + start
				+ ", end=" + end + ", length=" + length + ", prefix=" + prefix
				+ ", identityNumber=" + identityNumber + ", reference="
				+ reference + "]";
	}
	
}
