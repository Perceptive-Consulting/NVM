package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.UserLogin;

public class UserMapper implements RowMapper<UserLogin>{

	@Override
	public UserLogin mapRow(ResultSet rst, int arg1) throws SQLException {
		UserLogin obj = null;
		try{
			obj = new UserLogin();
			obj.setId(rst.getLong("id"));
			obj.setHintQuestion(rst.getString("hintQuestion"));
			obj.setHintAnswer(rst.getString("hintAnswer"));
			obj.setUsername(rst.getString("username"));
			obj.setPassword(rst.getString("password"));
		}catch (SQLException e) { e.printStackTrace(); return null; }
			return obj;
	}

}
