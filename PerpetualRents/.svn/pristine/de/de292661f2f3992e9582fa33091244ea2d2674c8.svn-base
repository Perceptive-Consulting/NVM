package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.PropertyDocumentDownloadStatus;

public class PropertyDocumentDownloadStatusMapper implements RowMapper<PropertyDocumentDownloadStatus>{

	@Override
	public PropertyDocumentDownloadStatus mapRow(ResultSet rst, int arg1) throws SQLException {
		PropertyDocumentDownloadStatus obj = null;
		try{
			obj = new PropertyDocumentDownloadStatus();
			obj.setId(rst.getLong(PropertyDocumentDownloadStatus.ID));
			obj.setFirstFileDownloaded(rst.getBoolean(PropertyDocumentDownloadStatus.IS_FIRSTFILE_DOWNLOADED));
			obj.setSecondFileDownloaded(rst.getBoolean(PropertyDocumentDownloadStatus.IS_SECONDFILE_DOWNLOADED));
			obj.setThirdFileDownloaded(rst.getBoolean(PropertyDocumentDownloadStatus.IS_THIRDFILE_REGISTERATION_DOWNLOADED));
			obj.setObjectTypeId(rst.getLong(PropertyDocumentDownloadStatus.OBJECT_TYPE_ID));
			obj.setObjectId(rst.getLong(PropertyDocumentDownloadStatus.OBJECT_ID));
			obj.setPropertyId(rst.getLong(PropertyDocumentDownloadStatus.PROPERTY_ID));
			
			obj.setCreatedOn(rst.getDate(Contractor.CREATED_ON));
			obj.setCreatedBy(rst.getString(Contractor.CREATED_BY));
			obj.setModifiedOn(rst.getDate(Contractor.MODIFIED_ON));
			obj.setModifiedBy(rst.getString(Contractor.MODIFIED_BY));
			
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

}