package com.pcs.perpetualRents.business.bean;

public class ADPL {
	
	private String questions;
	private String response;
	private String comments;
	private String attachments;
	
	public String getQuestions() {
		return questions;
	}
	public void setQuestions(String questions) {
		this.questions = questions;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		if(response != null){
			if(response.equalsIgnoreCase("true"))
				this.response = "Yes";
			else if(response.equalsIgnoreCase("false"))
				this.response = "No";
			else if(response.equalsIgnoreCase("later"))
				this.response = "Yes, But Manadatory Files are Pending";
			else if(response.equalsIgnoreCase("N/A"))
				this.response = "Not Applicable";
			else if(response.equalsIgnoreCase("equalToTrue"))
				this.response = "Not Applicable";
		}else{
			this.response = "Not Set";
		}
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getAttachments() {
		return attachments;
	}
	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}
	
	@Override
	public String toString() {
		return "ADPL [questions=" + questions + ", response=" + response
				+ ", comments=" + comments + ", attachments=" + attachments
				+ "]";
	}
	
}
