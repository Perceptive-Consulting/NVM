package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.UserLogin;

public class PMCMapper implements RowMapper<Charity>{

	@Override
	public Charity mapRow(ResultSet rst, int arg1) throws SQLException {
		Charity obj = null;
		try{
			obj = new Charity();
				obj.setId(rst.getLong(Charity.ID));
				obj.setCompanyName(rst.getString(Charity.COMPANY_NAME));
				obj.setAuthorisedPerson(rst.getString(Charity.AUTHORISED_PERSON));
				obj.setWeburl(rst.getString(Charity.WEB_URL));
				obj.setUniqueReference(rst.getString(Charity.UNIQUE_REFERENCE));
				obj.setCreatedBy(rst.getString(Charity.CREATED_BY));
				obj.setCreatedOn(rst.getDate(Charity.CREATED_ON));
				obj.setModifiedBy(rst.getString(Charity.MODIFIED_BY));
				obj.setModifiedOn(rst.getDate(Charity.MODIFIED_ON));
				obj.setUserLoginId(rst.getLong(Charity.USER_LOGIN_ID));
				
				UserLogin loginObj = new UserLogin();
					loginObj.setId(rst.getLong(Charity.USER_LOGIN_ID));
					loginObj.setUsername(rst.getString(UserLogin.USERNAME));
					loginObj.setPassword(rst.getString(UserLogin.PASSWORD));
					loginObj.setHintQuestion(rst.getString(UserLogin.HINT_QUESTION));
					loginObj.setHintAnswer(rst.getString(UserLogin.HINT_ANSWER));
					loginObj.setEnable(rst.getBoolean(UserLogin.ENABLE));
					loginObj.setUserTypeId(rst.getInt(UserLogin.USER_TYPE_ID));
				obj.setLoginObj(loginObj);
				
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
