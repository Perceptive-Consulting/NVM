package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Lead;

public class LeadMapper implements RowMapper<Lead>{

	@Override
	public Lead mapRow(ResultSet rst, int arg1) throws SQLException {
		Lead obj = null;
		try{
			obj = new Lead();
				obj.setId(rst.getLong(Lead.ID));
				obj.setName(rst.getString(Lead.NAME));
				obj.setAddress(rst.getString(Lead.ADDRESS));
				obj.setEmail(rst.getString(Lead.EMAIL));
				obj.setMessage(rst.getString(Lead.MESSAGE));
				obj.setContactNumber(rst.getString(Lead.CONTACT_NUMBER));
				/*obj.setCreatedBy(rst.getString(Lead.CREATED_BY));
				obj.setCreatedOn(rst.getDate(Lead.CREATED_ON));
				obj.setModifiedBy(rst.getString(Lead.MODIFIED_BY));
				obj.setModifiedOn(rst.getDate(Lead.MODIFIED_ON));*/
				
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
