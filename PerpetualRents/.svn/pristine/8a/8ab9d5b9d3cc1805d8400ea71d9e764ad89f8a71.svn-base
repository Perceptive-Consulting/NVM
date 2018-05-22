package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;

public class PropertyDeveloperMapper implements RowMapper<PropertyDeveloper> {

	@Override
	public PropertyDeveloper mapRow(ResultSet rst, int arg1) throws SQLException {
		PropertyDeveloper obj = null;
		try{
			
			obj = new PropertyDeveloper();
				obj.setId(rst.getLong(PropertyDeveloper.ID));
				obj.setFirstName(rst.getString(PropertyDeveloper.FIRST_NAME));
				obj.setLastName(rst.getString(PropertyDeveloper.LAST_NAME));
				obj.setPrimaryEmailId(rst.getString(PropertyDeveloper.PRIMARY_EMAIL_ID));
				obj.setSecondaryEmailId(rst.getString(PropertyDeveloper.SECONDARY_EMAIL_ID));
				obj.setPrimaryPhoneNumber(rst.getString(PropertyDeveloper.PRIMARY_PHONE_NUMBER));
				obj.setSecondaryPhoneNumber(rst.getString(PropertyDeveloper.SECONDARY_PHONE_NUMBER));
				obj.setUniqueReference(rst.getString(PropertyDeveloper.UNIQUE_REFERENCE));
				obj.setCreatedBy(rst.getString(PropertyDeveloper.CREATED_BY));
				obj.setCreatedOn(rst.getDate(PropertyDeveloper.CREATED_ON));
				obj.setModifiedBy(rst.getString(PropertyDeveloper.MODIFIED_BY));
				obj.setModifiedOn(rst.getDate(PropertyDeveloper.MODIFIED_ON));
				obj.setPropertyCount(rst.getInt(PropertyDeveloper.PROPERTY_COUNT));
				obj.setUserLoginId(rst.getLong(PropertyDeveloper.USER_LOGIN_ID));
				
				UserLogin loginObj = new UserLogin();
					loginObj.setUsername(rst.getString(UserLogin.USERNAME));
					loginObj.setPassword(rst.getString(UserLogin.PASSWORD));
					loginObj.setHintQuestion(rst.getString(UserLogin.HINT_QUESTION));
					loginObj.setHintAnswer(rst.getString(UserLogin.HINT_ANSWER));
					loginObj.setUserTypeId(rst.getInt(UserLogin.USER_TYPE_ID));
					loginObj.setId(rst.getLong(PropertyDeveloper.USER_LOGIN_ID));
				obj.setLoginObj(loginObj);
				
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
