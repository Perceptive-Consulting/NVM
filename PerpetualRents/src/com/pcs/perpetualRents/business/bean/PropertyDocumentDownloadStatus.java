package com.pcs.perpetualRents.business.bean;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;


public class PropertyDocumentDownloadStatus extends BusinessObject {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PropertyDocumentDownloadStatus.class.getSimpleName().toLowerCase();
	
	public static final String IS_FIRSTFILE_DOWNLOADED = "isFirstFileDownloaded";
	public static final String IS_SECONDFILE_DOWNLOADED = "isSecondFileDownloaded";
	public static final String IS_THIRDFILE_REGISTERATION_DOWNLOADED = "isThirdFileDownloaded";
	public static final String PROPERTY_ID = "propertyId";
	public static final String OBJECT_TYPE_ID = "objectTypeId";
	public static final String OBJECT_ID = "objectId";
	
	
	private boolean isFirstFileDownloaded;
	private boolean isSecondFileDownloaded;
	private boolean isThirdFileDownloaded;
	
	private Long propertyId;
	
	private Long objectTypeId;
	private Long objectId;

	
	
	public PropertyDocumentDownloadStatus() {
		super();
	}

	public PropertyDocumentDownloadStatus(boolean isADPL1Downloaded,
			boolean isADPL3Downloaded,
			boolean isThirdFileDownloaded, Long objectTypeId, Long objectId) {
		super();
		this.isFirstFileDownloaded = isADPL1Downloaded;
		this.isSecondFileDownloaded = isADPL3Downloaded;
		this.isThirdFileDownloaded = isThirdFileDownloaded;
		this.objectTypeId = objectTypeId;
		this.objectId = objectId;
	}

	public Long getObjectTypeId() {
		return objectTypeId;
	}

	public void setObjectTypeId(Long objectTypeId) {
		this.objectTypeId = objectTypeId;
	}

	public Long getObjectId() {
		return objectId;
	}

	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}

	public boolean isFirstFileDownloaded() {
		return isFirstFileDownloaded;
	}

	public void setFirstFileDownloaded(boolean isFirstFileDownloaded) {
		this.isFirstFileDownloaded = isFirstFileDownloaded;
	}

	public boolean isSecondFileDownloaded() {
		return isSecondFileDownloaded;
	}

	public void setSecondFileDownloaded(boolean isSecondFileDownloaded) {
		this.isSecondFileDownloaded = isSecondFileDownloaded;
	}

	public boolean isThirdFileDownloaded() {
		return isThirdFileDownloaded;
	}

	public void setThirdFileDownloaded(boolean isThirdFileDownloaded) {
		this.isThirdFileDownloaded = isThirdFileDownloaded;
	}

	public Long getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}
	
	@Override
	public String toString() {
		return "PropertyDocumentDownloadStatus [isFirstFileDownloaded="
				+ isFirstFileDownloaded + ", isSecondFileDownloaded="
				+ isSecondFileDownloaded + ", isThirdFileDownloaded="
				+ isThirdFileDownloaded + ", propertyId=" + propertyId
				+ ", objectTypeId=" + objectTypeId + ", objectId=" + objectId
				+ "]";
	}
	
	
	public JSONObject toJSON(boolean includeSuper) throws JSONException{
		JSONObject jObj = new JSONObject();
		
			if(includeSuper)
				jObj = super.toJSON();
			
				jObj.put(PropertyDocumentDownloadStatus.IS_FIRSTFILE_DOWNLOADED, this.isFirstFileDownloaded);
				jObj.put(PropertyDocumentDownloadStatus.IS_SECONDFILE_DOWNLOADED, this.isSecondFileDownloaded);
				jObj.put(PropertyDocumentDownloadStatus.IS_THIRDFILE_REGISTERATION_DOWNLOADED, this.isThirdFileDownloaded);
				
			return jObj;
	}
	
}
