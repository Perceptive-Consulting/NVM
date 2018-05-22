package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.UserLogin;

public class ContractorMapper implements RowMapper<Contractor>{

	@Override
	public Contractor mapRow(ResultSet rst, int arg1) throws SQLException {
		Contractor obj = null;
		try{
			obj = new Contractor();
			obj.setId(rst.getLong(Contractor.ID));
			obj.setUniqueReference(rst.getString(Contractor.UNIQUE_REFERENCE));
			obj.setCompanyName(rst.getString(Contractor.COMPANY_NAME));
			obj.setBusinessNature(rst.getString(Contractor.BUSINESS_NATURE));
			obj.setContactPerson(rst.getString(Contractor.CONTACT_PERSON));
			obj.setTradingCommencementDate(rst.getString(Contractor.TRADING_COMMENCEMENT_DATE));
			obj.setCompanyRegisterationDate(rst.getString(Contractor.COMPANY_REGISTERATION_DATE));
			obj.setVatNo(rst.getString(Contractor.VAT_NO));
			obj.setStatusId(rst.getShort(Contractor.STATUS_ID));
			
			
			UserLogin loginObj = new UserLogin();
				loginObj.setUsername(rst.getString(UserLogin.USERNAME));
				loginObj.setPassword(rst.getString(UserLogin.PASSWORD));
				loginObj.setHintQuestion(rst.getString(UserLogin.HINT_QUESTION));
				loginObj.setHintQuestion(rst.getString(UserLogin.HINT_QUESTION));
				loginObj.setId(rst.getLong(Contractor.USER_LOGIN_ID));
			obj.setLoginObj(loginObj);
			
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