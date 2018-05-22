package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.UserLogin;

public class UserAdminMapper implements RowMapper<Admin>{

	@Override
	public Admin mapRow(ResultSet rst, int arg1) throws SQLException {
		Admin obj = null;
		try{
			obj = new Admin();
				obj.setFirstName(rst.getString(Admin.FIRST_NAME));
				obj.setLastName(rst.getString(Admin.LAST_NAME));
				obj.setUniqueReference(rst.getString(Admin.UNIQUE_REFERENCE));
				obj.setId(rst.getLong(Admin.ID));
				obj.setLoginUserId(rst.getLong(Admin.USER_LOGIN_ID));
				
				UserLogin loginObj = new UserLogin();
					loginObj.setUsername(rst.getString(UserLogin.USERNAME));
					loginObj.setPassword(rst.getString(UserLogin.PASSWORD));
					loginObj.setHintQuestion(rst.getString(UserLogin.HINT_QUESTION));
					loginObj.setHintAnswer(rst.getString(UserLogin.HINT_ANSWER));
					loginObj.setEnable(rst.getBoolean(UserLogin.ENABLE));
					loginObj.setId(rst.getLong(Admin.USER_LOGIN_ID));
				obj.setLoginObj(loginObj);
				
				obj.setCreatedBy(rst.getString(Admin.CREATED_BY));
				obj.setCreatedOn(rst.getDate(Admin.CREATED_ON));
				obj.setModifiedBy(rst.getString(Admin.MODIFIED_BY));
				obj.setModifiedOn(rst.getDate(Admin.MODIFIED_ON));
				
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

}
