package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Contractor;

public class AssignMapper implements RowMapper<AssignModel>{

	@Override
	public AssignModel mapRow(ResultSet rst, int arg1) throws SQLException {
		AssignModel obj = null;
		try{
			obj = new AssignModel();
			obj.setId(rst.getLong(AssignModel.ID));
			obj.setAssignById(rst.getLong(AssignModel.ASSIGN_BY_ID));
			obj.setAssignByTypeId(rst.getLong(AssignModel.ASSIGN_BY_TYPE_ID));
			obj.setAssignToId(rst.getLong(AssignModel.ASSIGN_TO_ID));
			obj.setAssignToTypeId(rst.getLong(AssignModel.ASSIGN_BY_TYPE_ID));
			obj.setCityId(rst.getLong(AssignModel.CITY_ID));
			obj.setPropertyId(rst.getLong(AssignModel.PROPERTY_ID));
			obj.setEnable(rst.getBoolean(AssignModel.ENABLE));
			obj.setStatusId(rst.getLong(AssignModel.STATUS_ID));
			obj.setRemarks(rst.getString(AssignModel.REMARKS));
			
			obj.setEstimatedCompletionDate(rst.getString(AssignModel.ESTIMATED_COMPLETION_DATE));
			obj.setEstimatedCost(rst.getString(AssignModel.ESTIMATED_COST));
			obj.setFunctionalityId(rst.getLong(AssignModel.FUNCTIONALITY_ID));
			obj.setJobDescription(rst.getString(AssignModel.JOBS_DESCRIPTION));
			
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