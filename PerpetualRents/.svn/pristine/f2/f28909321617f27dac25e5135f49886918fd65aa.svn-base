package com.pcs.perpetualRents.common.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MailPojo {
	
	private String subject;
	private String to;
	private String message;
	private List<File> attachment;
	
	
	public MailPojo(String subject, String to, String message) {
		super();
		this.subject = subject;
		this.to = to;
		this.message = message;
	}
	
	public List<File> getAttachment() {
		if(attachment == null)
			attachment = new ArrayList<File>();
		
		return attachment;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
