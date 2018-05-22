package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Expertise;

public class ExpertiseMapper implements RowMapper<Expertise>{

	@Override
	public Expertise mapRow(ResultSet rst, int arg1) throws SQLException {
		Expertise obj = null;
		try{
			 obj = new Expertise();
			 	obj.setId(rst.getLong(Expertise.ID));
				obj.setQualification(rst.getString(Expertise.QUALIFICATION));
				obj.setFunctionalityId(rst.getShort(Expertise.FUNCTIONALITY_ID));
				obj.setContractorId(rst.getLong(Expertise.CONTRACTOR_ID));
			
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

}