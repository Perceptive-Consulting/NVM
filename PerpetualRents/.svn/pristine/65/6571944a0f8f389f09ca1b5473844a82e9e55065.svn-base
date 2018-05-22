package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Documents;

public class DocumentsMapper implements RowMapper<Documents> {

	@Override
	public Documents mapRow(ResultSet rst, int arg1) throws SQLException {
		Documents obj = null;
		try{
			obj = new Documents();
				obj.setId(rst.getLong(Documents.ID));
				obj.setCreatedOn(rst.getDate(Documents.CREATED_ON));
				obj.setContractorId(rst.getLong(Documents.CONTRACTOR_ID));
				obj.setDocumentTypeId(rst.getLong(Documents.DOCUMENT_TYPE_ID));
				obj.setStatusId(rst.getShort(Documents.STATUS_ID));
				obj.setFileName(rst.getString(Documents.FILE_NAME));
				obj.setFunctionalityId(rst.getLong(Documents.FUNCTIONALITY_ID));
				obj.setFileId(rst.getLong(Documents.FILE_ID));
				obj.setPropertyId(rst.getLong(Documents.PROPERTY_ID));
				
				obj.setCreatedOn(rst.getDate(Contractor.CREATED_ON));
				obj.setCreatedBy(rst.getString(Contractor.CREATED_BY));
				obj.setModifiedOn(rst.getDate(Contractor.MODIFIED_ON));
				obj.setModifiedBy(rst.getString(Contractor.MODIFIED_BY));
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
