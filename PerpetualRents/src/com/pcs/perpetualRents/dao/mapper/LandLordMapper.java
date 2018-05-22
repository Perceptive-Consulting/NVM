package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.UserLogin;

public class LandLordMapper implements RowMapper<LandLord>{

	@Override
	public LandLord mapRow(ResultSet rst, int arg1) throws SQLException {
		LandLord obj = null;
		try{
			
			obj = new LandLord();
				obj.setId(rst.getLong(LandLord.ID));
				obj.setFirstName(rst.getString(LandLord.FIRST_NAME));
				obj.setLastName(rst.getString(LandLord.LAST_NAME));
				obj.setPrimaryEmailId(rst.getString(LandLord.PRIMARY_EMAIL_ID));
				obj.setSecondaryEmailId(rst.getString(LandLord.SECONDARY_EMAIL_ID));
				obj.setPrimaryPhoneNumber(rst.getString(LandLord.PRIMARY_PHONE_NUMBER));
				obj.setSecondaryPhoneNumber(rst.getString(LandLord.SECONDARY_PHONE_NUMBER));
				obj.setUniqueReference(rst.getString(LandLord.UNIQUE_REFERENCE));
				obj.setCreatedBy(rst.getString(LandLord.CREATED_BY));
				obj.setCreatedOn(rst.getDate(LandLord.CREATED_ON));
				obj.setModifiedBy(rst.getString(LandLord.MODIFIED_BY));
				obj.setModifiedOn(rst.getDate(LandLord.MODIFIED_ON));
				obj.setPropertyCount(rst.getInt(LandLord.PROPERTY_COUNT));
				obj.setUserLoginId(rst.getLong(LandLord.USER_LOGIN_ID));
				
				UserLogin loginObj = new UserLogin();
					loginObj.setUsername(rst.getString(UserLogin.USERNAME));
					loginObj.setPassword(rst.getString(UserLogin.PASSWORD));
					loginObj.setHintQuestion(rst.getString(UserLogin.HINT_QUESTION));
					loginObj.setHintAnswer(rst.getString(UserLogin.HINT_ANSWER));
					loginObj.setUserTypeId(rst.getInt(UserLogin.USER_TYPE_ID));
					loginObj.setId(rst.getLong(LandLord.USER_LOGIN_ID));
				obj.setLoginObj(loginObj);
				
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
