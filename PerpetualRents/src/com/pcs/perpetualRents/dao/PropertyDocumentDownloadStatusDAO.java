package com.pcs.perpetualRents.dao;

import com.pcs.perpetualRents.business.bean.PropertyDocumentDownloadStatus;

public interface PropertyDocumentDownloadStatusDAO {
	
	public Long createPropertyDocumentDownloadStatus(PropertyDocumentDownloadStatus statusObj, final Long createdUserId);
	
	public PropertyDocumentDownloadStatus loadDocumentStatusById(Long id);
	
	public PropertyDocumentDownloadStatus loadDocumentStatusByObjectType(Long objectTypeId, Long objectId);
	
	public boolean updateDocStatus(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues);
	
}
