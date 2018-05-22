package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.PdDocumentsStatus;

public class PropertyDocument extends BusinessObject {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PropertyDocument.class.getSimpleName().toLowerCase();
	
	public static final String LANDLORD_ID = "landlordId";
	public static final String PROPERTY_ID = "propertyId";
	public static final String FILE_ID = "fileId";
	public static final String DOCUMENT_TYPE_ID = "documentTypeId";
	public static final String FILE_NAME = "fileName";
	public static final String STATUS_ID = "statusId";
	public static final String DESCRIPTION = "description";
	
	private long landlordId;

	private long propertyId;
	private long fileId;
	private Long documentTypeId;
	private String fileName;
	private Integer statusId;
	
	private File fileObj;
	private String filePath;
	private String statusStr;
	private String description;
	
	public PropertyDocument(long landlordId, long propertyId,Long documentTypeId, String fileName, File fileObj, String description) {
		super();
		this.landlordId = landlordId;
		this.propertyId = propertyId;
		this.documentTypeId = documentTypeId;
		this.fileName = fileName;
		this.fileObj = fileObj;
		if(fileObj != null)
			this.fileId = fileObj.getId();
		this.statusId = PdDocumentsStatus.UNREAD.id();
		this.description = description;
	}

	public long getLandlordId() {
		return landlordId;
	}

	public void setLandlordId(long landlordId) {
		this.landlordId = landlordId;
	}

	public Long getDocumentTypeId() {
		return documentTypeId;
	}

	public void setDocumentTypeId(Long documentTypeId) {
		this.documentTypeId = documentTypeId;
	}
	
	public PropertyDocument() {
		super();
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
		return "PropertyDocument [landlordId=" + landlordId + ", propertyId="
				+ propertyId + ", fileId=" + fileId + ", documentTypeId="
				+ documentTypeId + ", fileName=" + fileName + ", statusId="
				+ statusId + ", fileObj=" + fileObj + ", filePath=" + filePath
				+ ", statusStr=" + statusStr + ", description=" + description
				+ "]";
	}

	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			
			if(includeParent)
				jObj = super.toJSON();
			
			jObj.put(PropertyDocument.LANDLORD_ID, this.landlordId);
			jObj.put(PropertyDocument.DOCUMENT_TYPE_ID, this.documentTypeId);
			jObj.put(PropertyDocument.FILE_ID, this.fileId);
			jObj.put(PropertyDocument.PROPERTY_ID, this.propertyId);
			jObj.put(PropertyDocument.FILE_NAME, this.fileName);
			jObj.put(PropertyDocument.DESCRIPTION, this.description);
			
			return jObj;
	}
	
}
