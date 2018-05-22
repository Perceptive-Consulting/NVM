package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.PdDocumentsStatus;

public class PDDocuments extends BusinessObject {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PDDocuments.class.getSimpleName().toLowerCase();
	
	public static final String PROPERTYDEVELOPER_ID = "propertyDeveloperId";
	public static final String PROPERTY_ID = "propertyId";
	public static final String FILE_ID = "fileId";
	public static final String DOCUMENT_TYPE_ID = "documentTypeId";
	public static final String FILE_NAME = "fileName";
	public static final String STATUS_ID = "statusId";

	public static final String DESCRIPTION = "description";
	
	private long propertyDeveloperId;
	private long propertyId;
	private long fileId;
	private Long documentTypeId;
	private String fileName;
	private Integer statusId;
	
	private File fileObj;
	
	private String filePath;
	private String statusStr;
	private String description;
	
	
	
	
	public PDDocuments(long propertyDeveloperId, long propertyId,Long documentTypeId, String fileName, File fileObj) {
		super();
		this.propertyDeveloperId = propertyDeveloperId;
		this.propertyId = propertyId;
		this.documentTypeId = documentTypeId;
		this.fileName = fileName;
		this.fileObj = fileObj;
		this.statusId = PdDocumentsStatus.UNREAD.id();
	}

	public PDDocuments() {
		super();
	}
	
	public PDDocuments(long propertyDeveloperId, long propertyId, long documentTypeId, File fileObj) {
		super();
		this.propertyDeveloperId = propertyDeveloperId;
		this.propertyId = propertyId;
		this.documentTypeId = documentTypeId;
		this.fileObj = fileObj;
	}
	
	
	public String getStatusStr() {
		statusStr = PdDocumentsStatus.get(statusId).value();
		return statusStr;
	}

	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getFilePath() {
		if(this.fileObj != null)
			return this.fileObj.getFilePath();
		else
			return "";
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getPropertyDeveloperId() {
		return propertyDeveloperId;
	}

	public void setPropertyDeveloperId(long propertyDeveloperId) {
		this.propertyDeveloperId = propertyDeveloperId;
	}

	public long getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(long propertyId) {
		this.propertyId = propertyId;
	}

	public long getFileId() {
		return fileId;
	}

	public void setFileId(long fileId) {
		this.fileId = fileId;
	}

	public Long getDocumentTypeId() {
		return documentTypeId;
	}

	public void setDocumentTypeId(Long documentTypeId) {
		this.documentTypeId = documentTypeId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getFileObj() {
		return fileObj;
	}

	public void setFileObj(File fileObj) {
		this.fileObj = fileObj;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "PDDocuments [propertyDeveloperId=" + propertyDeveloperId
				+ ", propertyId=" + propertyId + ", fileId=" + fileId
				+ ", documentTypeId=" + documentTypeId + ", fileName="
				+ fileName + ", fileObj=" + fileObj + ", filePath=" + filePath 
				+ ", description =" + description
				+ "]";
	}

	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			
			if(includeParent)
				jObj = super.toJSON();
			
			jObj.put(PDDocuments.PROPERTYDEVELOPER_ID, this.propertyDeveloperId);
			jObj.put(PDDocuments.DOCUMENT_TYPE_ID, this.documentTypeId);
			jObj.put(PDDocuments.FILE_ID, this.fileId);
			jObj.put(PDDocuments.PROPERTY_ID, this.propertyId);
			jObj.put(PDDocuments.FILE_NAME, this.fileName);
			jObj.put(PDDocuments.DESCRIPTION, this.description);
			
			return jObj;
	}
	
}
