package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.DocumentType;
import com.pcs.perpetualRents.enm.Status;

public class Documents extends BusinessObject {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Documents.class.getSimpleName().toLowerCase();
	
	public static final String CONTRACTOR_ID = "contractorId";
	public static final String PROPERTY_ID = "propertyId";
	public static final String FILE_ID = "fileId";
	public static final String DOCUMENT_TYPE_ID = "documentTypeId";
	public static final String FUNCTIONALITY_ID = "functionalityId";
	public static final String FILE_NAME = "fileName";
	public static final String STATUS_ID = "statusId";
	
	private long contractorId;
	private long propertyId;
	private long fileId;
	private Long documentTypeId;
	private long functionalityId;
	private String documentTypeStr;
	private String fileName;
	private Short statusId;
	private String statusStr;
	
	private File fileObj;
	
	public Documents() {
		super();
	}
	
	public Documents(long contractorId, long propertyId, long documentTypeId, File fileObj, Long statusId) {
		super();
		this.contractorId = contractorId;
		this.propertyId = propertyId;
		this.documentTypeId = documentTypeId;
		this.fileObj = fileObj;
		this.statusId = Short.valueOf(statusId.toString());
	}
	
	public Short getStatusId() {
		return statusId;
	}

	public void setStatusId(Short statusId) {
		this.statusId = statusId;
	}

	public String getStatusStr() {
		return statusStr;
	}

	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}

	public void setDocumentTypeId(Long documentTypeId) {
		this.documentTypeId = documentTypeId;
	}

	public void setFunctionalityId(long functionalityId) {
		this.functionalityId = functionalityId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Long getFunctionalityId() {
		return functionalityId;
	}
	public void setFunctionalityId(Long functionalityId) {
		this.functionalityId = functionalityId;
	}
	public File getFileObj() {
		return fileObj;
	}
	public void setFileObj(File fileObj) {
		this.fileObj = fileObj;
	}
	public long getContractorId() {
		return contractorId;
	}
	public void setContractorId(long contractorId) {
		this.contractorId = contractorId;
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
	public long getDocumentTypeId() {
		return documentTypeId;
	}
	public void setDocumentTypeId(long documentTypeId) {
		this.documentTypeId = documentTypeId;
	}
	public String getDocumentTypeStr() {
		return documentTypeStr;
	}
	public void setDocumentTypeStr(String documentTypeStr) {
		this.documentTypeStr = documentTypeStr;
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			
			if(includeParent)
				jObj = super.toJSON();
			
			jObj.put(Documents.CONTRACTOR_ID, this.contractorId);
			jObj.put(Documents.DOCUMENT_TYPE_ID, this.documentTypeId);
			jObj.put(Documents.FILE_ID, this.fileId);
			jObj.put(Documents.PROPERTY_ID, this.propertyId);
			jObj.put(Documents.FILE_NAME, this.fileName);
			jObj.put(Documents.STATUS_ID, this.statusId);
			jObj.put("statusStr", Status.get(this.statusId).value());
			jObj.put("documentTypeStr", DocumentType.get(this.documentTypeId).value());
			
			return jObj;
	}
	
}
