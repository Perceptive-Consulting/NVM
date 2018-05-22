package com.pcs.perpetualRents.business.bean;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

public class AdminUploadDocuments extends BusinessObject{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + AdminUploadDocuments.class.getSimpleName().toLowerCase();
	
	public static final String FILE_NAME = "fileName";
	public static final String ADMIN_DOCUMENT_ID = "adminDocumentId";
	public static final String FILE_ID = "fileId";
	public static final String DOCUMENT_TYPE_ID = "documentTypeId";
	
	private String fileName;
	private Integer adminDocumentId;
	private Long fileId;
	private Integer documentTypeId;
	
	private File fileObj;

	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public Integer getAdminDocumentId() {
		return adminDocumentId;
	}


	public void setAdminDocumentId(Integer adminDocumentId) {
		this.adminDocumentId = adminDocumentId;
	}


	public Long getFileId() {
		return fileId;
	}


	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}



	public Integer getDocumentTypeId() {
		return documentTypeId;
	}



	public void setDocumentTypeId(Integer documentTypeId) {
		this.documentTypeId = documentTypeId;
	}
	

	public File getFileObj() {
		return fileObj;
	}


	public void setFileObj(File fileObj) {
		this.fileObj = fileObj;
	}


	@Override
	public String toString() {
		return "AdminUploadFile [fileName=" + fileName + ", adminDocumentId="
				+ adminDocumentId + ", fileId=" + fileId + ", documentTypeId="
				+ documentTypeId + "]";
	}
	
	
}
