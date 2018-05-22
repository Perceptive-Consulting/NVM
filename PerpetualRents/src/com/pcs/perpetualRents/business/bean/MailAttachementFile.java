package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;

public class MailAttachementFile implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + MailAttachementFile.class.getSimpleName().toLowerCase();
	
	public static final String ID = "id";
	public static final String FILE_NAME = "fileName";
	public static final String SIZE = "size";
	public static final String FILE_DATA = "fileData";
	public static final String CONTENT_TYPE = "contentType";
	public static final String REFERENCE_ID = "referenceId";
	
	private Long id;
	private String fileName;
	//private long size;
	private String contentType;
	private byte[] fileData;
	private Long referenceId;
	private String base64Data;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	public Long getReferenceId() {
		return referenceId;
	}
	public void setReferenceId(Long referenceId) {
		this.referenceId = referenceId;
	}
	public String getBase64Data() {
		return base64Data;
	}
	public void setBase64Data(String base64Data) {
		this.base64Data = base64Data;
	}
	
}
