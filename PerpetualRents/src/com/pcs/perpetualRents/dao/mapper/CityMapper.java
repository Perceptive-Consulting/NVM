package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.City;

public class CityMapper implements RowMapper<City>{

	@Override
	public City mapRow(ResultSet rst, int arg1) throws SQLException {
		City obj = null;
		try{
			obj = new City();
			obj.setId(rst.getLong(City.ID));
			obj.setCityId(rst.getLong(City.CITY_ID));
			obj.setCity(rst.getString(City.CITY));
			obj.setObjectId(rst.getLong(City.OBJECT_ID));
		}catch (SQLException e) { e.printStackTrace(); return null; }
			return obj;
	}

}
