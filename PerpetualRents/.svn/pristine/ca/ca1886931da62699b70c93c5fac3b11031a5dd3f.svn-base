package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.DocumentType;


@JsonIgnoreProperties(ignoreUnknown=true)
public class File extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + File.class.getSimpleName().toLowerCase();
	
	public static final String FILE_NAME = "fileName";
	public static final String SIZE = "size";
	public static final String OBJECT_TYPE = "objectType";
	public static final String OBJECT_ID = "objectId";
	public static final String DOCUMENT_TYPE_ID = "documentType";
	public static final String FILE_PATH = "filePath";
	public static final String CONTENT_TYPE = "contentType";
	public static final String IS_IMAGE = "isImage";
	
	private String fileName;
	private long size;
	private long objectType;
	private long objectId;
	private long documentType;
	private byte[] fileData;
	private String contentType;
	private String filePath;
	
	private String documentTypeStr;
	private String propertyReference;
	private boolean isImage;
	
	public File(String fileName, long size, long objectType, long objectId, byte[] fileData, String contentType, Long documentType) {
		super();
		this.fileName = fileName;
		this.size = size;
		this.objectType = objectType;
		this.objectId = objectId;
		this.fileData = fileData;
		this.contentType = contentType;
		this.documentType = documentType;
	}
	
	public String getPropertyReference() {
		return propertyReference;
	}
	public void setPropertyReference(String propertyReference) {
		this.propertyReference = propertyReference;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	public long getDocumentType() {
		return documentType;
	}

	public void setDocumentType(long documentType) {
		this.documentType = documentType;
	}
	public String getDocumentTypeStr() {
		return documentTypeStr;
	}

	public void setDocumentTypeStr(String documentTypeStr) {
		this.documentTypeStr = documentTypeStr;
	}
	public File() {
		super();
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public long getObjectType() {
		return objectType;
	}
	public void setObjectType(long objectType) {
		this.objectType = objectType;
	}
	public long getObjectId() {
		return objectId;
	}
	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public boolean isImage() {
		return isImage;
	}
	public void setImage(boolean isImage) {
		this.isImage = isImage;
	}
	

	@Override
	public String toString() {
		return "File [fileName=" + fileName + ", size=" + size
				+ ", objectType=" + objectType + ", objectId=" + objectId
				+ ", documentType=" + documentType + ", fileData="
				+ ((fileData == null) ? 0 : fileData.length) + ", contentType=" + contentType
				+ ", filePath=" + filePath + ", documentTypeStr="
				+ documentTypeStr + ", propertyReference=" + propertyReference
				+ ", isImage=" + isImage + ", super=" + super.toString() + "]";
	}

	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
		
			if(includeParent)
				jObj = super.toJSON();
		
			jObj.put(File.FILE_NAME, this.fileName);
			jObj.put(File.SIZE, this.size);
			jObj.put(File.CONTENT_TYPE, this.contentType);
			jObj.put(File.FILE_PATH, this.filePath);
			jObj.put(File.DOCUMENT_TYPE_ID, this.documentType);
			jObj.put("documentTypeStr", DocumentType.get(this.documentType).value());
			jObj.put("isImage", this.contentType.contains("image") ? true : false);
			
		return jObj;
	}
	
}
