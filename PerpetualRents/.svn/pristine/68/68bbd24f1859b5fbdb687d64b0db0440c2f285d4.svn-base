package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.MailEventActor;

public class MailEventConfiguration extends BusinessObject implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + MailEventConfiguration.class.getSimpleName().toLowerCase();
	
	
	public static final String ID = "id";
	public static final String MAIL_EVENT_TYPE_ID = "mailEventTypeId";
	public static final String MAIL_EVENT_ACTOR_ID = "mailEventActorId";
	public static final String ACTOR_TYPE_ID = "actorTypeId";
	public static final String DOCUMENT_ID = "documentId";
	public static final String ENABLE = "enable";
	
	private Long id;
	private Long mailEventTypeId;
	private Long mailEventActorId;
	private Short actorTypeId;
	private Long documentId;
	private boolean enable;
	
	private File fileObj;
	
	public File getFileObj() {
		return fileObj;
	}
	public void setFileObj(File fileObj) {
		this.fileObj = fileObj;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getMailEventTypeId() {
		return mailEventTypeId;
	}
	public void setMailEventTypeId(Long mailEventTypeId) {
		this.mailEventTypeId = mailEventTypeId;
	}
	public Long getMailEventActorId() {
		return mailEventActorId;
	}
	public void setMailEventActorId(Long mailEventActorId) {
		this.mailEventActorId = mailEventActorId;
	}
	public Short getActorTypeId() {
		return actorTypeId;
	}
	public void setActorTypeId(Short actorTypeId) {
		this.actorTypeId = actorTypeId;
	}
	public Long getDocumentId() {
		return documentId;
	}
	public void setDocumentId(Long documentId) {
		this.documentId = documentId;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "MailEventConfiguration [Actor = " + MailEventActor.get(this.actorTypeId) + 
										" Enable = " + this.enable +"]";
	}
	
}
