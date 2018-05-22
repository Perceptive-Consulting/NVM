package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;


public class Mail implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Mail.class.getSimpleName().toLowerCase();
	
	public static final String ID = "id";
	public static final String MAIL_MESSAGEID = "mailMessageId";
	public static final String MAIL_MESSAGE_REFERENCE = "mailMessageReference";
	public static final String SUBJECT = "subject";
	public static final String MAIL_ORIGIN = "mailOrigin";
	public static final String MAIL_FROM = "mailFrom";
	public static final String MAIL_TO = "mailTo";
	public static final String BODY = "mailBody";
	public static final String ATTACHMENT_COUNT = "attachmentCount";
	public static final String CREATED_ON = "createdOn";
	public static final String RECEIVED_ON = "receivedOn";
	public static final String MAIL_FLOWTYPE = "mailFlowType";
	public static final String MAIL_EVENTTYPE = "mailEventType";
	public static final String MAIL_EVENTACTOR = "mailEventActor";
	public static final String CONVERSATION_ID = "conversationId";
	

	private Long id;
	private String mailMessageId;
	private String mailMessageReference;
	private String subject;
	private String mailBody;
	private String mailOrigin;
	private String mailFrom;
	private String mailTo;
	private Integer attachmentCount;
	private String  createdOn;
	private String  receivedOn;
	private Short mailFlowType;
	private Short mailEventActor;
	private Short mailEventType;
	private Long conversationId;
	
	private List<MailAttachementFile> mailAttachementFileList;
	
	private String senderUserName;
	private String receivedDate;
	private String receivedTime;
	private String age;

	public String getMailBody() {
		return mailBody;
	}

	public void setMailBody(String mailBody) {
		this.mailBody = mailBody;
	}

	public String getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getReceivedTime() {
		return receivedTime;
	}

	public void setReceivedTime(String receivedTime) {
		this.receivedTime = receivedTime;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSenderUserName() {
		return senderUserName;
	}

	public void setSenderUserName(String senderUserName) {
		this.senderUserName = senderUserName;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getConversationId() {
		return conversationId;
	}

	public void setConversationId(Long conversationId) {
		this.conversationId = conversationId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMailFrom() {
		return mailFrom;
	}

	public void setMailFrom(String mailFrom) {
		this.mailFrom = mailFrom;
	}

	public String getMailTo() {
		return mailTo;
	}

	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}

	public Short getMailFlowType() {
		return mailFlowType;
	}

	public void setMailFlowType(Short mailFlowType) {
		this.mailFlowType = mailFlowType;
	}

	public Short getMailEventActor() {
		return mailEventActor;
	}

	public void setMailEventActor(Short mailEventActor) {
		this.mailEventActor = mailEventActor;
	}

	public Short getMailEventType() {
		return mailEventType;
	}

	public void setMailEventType(Short mailEventType) {
		this.mailEventType = mailEventType;
	}

	public List<MailAttachementFile> getMailAttachementFileList() {
		return mailAttachementFileList;
	}

	public void setMailAttachementFileList(List<MailAttachementFile> mailAttachementFileList) {
		this.mailAttachementFileList = mailAttachementFileList;
	}

	public String getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}

	public String getMailMessageId() {
		return mailMessageId;
	}

	public void setMailMessageId(String mailMessageId) {
		this.mailMessageId = mailMessageId;
	}

	public String getMailMessageReference() {
		return mailMessageReference;
	}

	public void setMailMessageReference(String mailMessageReference) {
		this.mailMessageReference = mailMessageReference;
	}

	public String getMailOrigin() {
		return mailOrigin;
	}

	public void setMailOrigin(String mailOrigin) {
		this.mailOrigin = mailOrigin;
	}

	public Integer getAttachmentCount() {
		return attachmentCount;
	}

	public void setAttachmentCount(Integer attachmentCount) {
		this.attachmentCount = attachmentCount;
	}

	public String getReceivedOn() {
		return receivedOn;
	}

	public void setReceivedOn(String receivedOn) {
		this.receivedOn = receivedOn;
	}
	
	@Override
	public String toString() {
		return "Mail [id=" + id + ", mailMessageId=" + mailMessageId
				+ ", mailMessageReference=" + mailMessageReference
				+ ", subject=" + subject + ", mailBody=" + mailBody
				+ ", mailOrigin=" + mailOrigin + ", mailFrom=" + mailFrom
				+ ", mailTo=" + mailTo + ", attachmentCount=" + attachmentCount
				+ ", createdOn=" + createdOn + ", receivedOn=" + receivedOn
				+ ", mailFlowType=" + mailFlowType + ", mailEventActor="
				+ mailEventActor + ", mailEventType=" + mailEventType
				+ ", conversationId=" + conversationId 
				+ ", mailAttachementFileList=" + mailAttachementFileList
				+ ", senderUserName=" + senderUserName + ", receivedDate="
				+ receivedDate + ", receivedTime=" + receivedTime + ", age="
				+ age + "]";
	}
	
	public JSONObject toJSON() throws JSONException{
		JSONObject jObj = new JSONObject();
		
			jObj.put(Mail.MAIL_MESSAGE_REFERENCE, this.mailMessageReference);
			jObj.put(Mail.SUBJECT, this.subject);
			jObj.put(Mail.ATTACHMENT_COUNT, this.attachmentCount);
		
			try {
				Date dummyDate = null;
				if(this.receivedOn != null){
					
					SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
					 dummyDate = sdf.parse(this.receivedOn);
				}else{
					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					dummyDate = sdf1.parse(this.createdOn);
				}
				
				
				Date currDate = new Date();
				this.receivedDate = new SimpleDateFormat("MMM dd yyyy").format(dummyDate);
				this.receivedTime = new SimpleDateFormat("hh:mm").format(dummyDate);
				
				
				long difference = currDate.getTime() - dummyDate.getTime();
				long diffSeconds = difference / 1000 % 60;
				long diffMinutes = difference / (60 * 1000) % 60;
				long diffHours = difference / (60 * 60 * 1000) % 24;
				long diffDays = difference / (24 * 60 * 60 * 1000);
				
				if(diffDays == 0){
					String ageStr = "";
					if(diffHours != 0)
						ageStr += diffHours + " hours";
					else if(diffMinutes != 0)
						ageStr += diffMinutes + " min";
					else if(diffSeconds != 0)
						ageStr += "1 min";
					else
						ageStr = "1 min";
					
					ageStr += " ago";
					setAge(ageStr);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			jObj.put(Mail.CONVERSATION_ID, this.conversationId);
			jObj.put(Mail.BODY, this.mailBody);
			jObj.put("receivedDate", this.receivedDate);
			jObj.put("receivedTime", this.receivedTime);
			jObj.put("age", this.age == null ? "null" : this.age);
			jObj.put("senderUserName",this.senderUserName);
			
		return jObj;
	}
}
