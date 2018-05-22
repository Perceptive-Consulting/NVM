package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.CityDAO;
import com.pcs.perpetualRents.dao.mapper.CityMapper;

@Repository
public class CityDAOImpl implements CityDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(CityDAOImpl.class.getName());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	@Override
	public Long createCity(final City cityObj) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + City.TABLE_NAME + "( " + City.CITY + ", " + City.CITY_ID +  ", " + City.OBJECT_TYPE + ", " + City.OBJECT_ID + ")"
					+ " VALUES (?, ?, ?, ? )";

			if(developmentSettings.isShowSQL())
				logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
				
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, cityObj.getCity());
					psObj.setLong(2, cityObj.getCityId());
					psObj.setLong(3, cityObj.getObjectType());
					psObj.setLong(4, cityObj.getObjectId());
						
				return psObj;
			}
		}, keyHolder);
		
		if(keyHolder.getKey() != null){
			cityObj.setId(keyHolder.getKey().longValue());
			return keyHolder.getKey().longValue();
		}
	
		return null;
			
	}

	@Override
	public List<City> loadCityByObjectId(Long objectType, Long objectId) {
		final String sql = "SELECT ua." + City.ID + ", ua." + City.CITY + ", ua." + City.CITY_ID + ", ua." + City.OBJECT_ID
						  +" FROM "+ City.TABLE_NAME + " ua WHERE ua." + City.OBJECT_TYPE + " = " + objectType 
						  + " AND " + "ua." + City.OBJECT_ID + " = " + objectId 
						  + " GROUP BY " + City.ID;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);

		return jdbcTemplate.query(sql, new CityMapper());
	}
	
	@Override
	public City loadCityById(final Long cityId){
		final String sql = "SELECT ua." + City.ID + ", ua." + City.CITY + ", ua." + City.CITY_ID
					+ " FROM " + City.TABLE_NAME + " ua "
		            + " WHERE ua." + City.ID + " = " + cityId;

		if(developmentSettings.isShowSQL())
			logger.info(sql);

		List<City> cityList = jdbcTemplate.query(sql, new RowMapper<City>() {

			@Override
			public City mapRow(ResultSet rst, int arg1)throws SQLException {
				
				City obj = new City();
					obj.setId(rst.getLong(PerpetualCity.ID));
					obj.setCityId(rst.getLong(City.CITY_ID));
					obj.setCity(rst.getString(PerpetualCity.CITY));
				return obj;
			}
		});

	if(cityList != null && !cityList.isEmpty())
		return cityList.get(0);

		return null;
	}
	
	@Override
	public City loadCityByName(final String cityName){
		final String sql = "SELECT ua." + City.ID + ", ua." + City.CITY  + ", ua." + City.CITY_ID
					+ " FROM " + City.TABLE_NAME + " ua "
		           + " WHERE ua." + City.CITY + " = '" + cityName + "'";

			if(developmentSettings.isShowSQL())
				logger.info(sql);

			List<City> cityList = jdbcTemplate.query(sql, new RowMapper<City>() {
	
				@Override
				public City mapRow(ResultSet rst, int arg1)throws SQLException {
					
					City obj = new City();
						obj.setId(rst.getLong(City.ID));
						obj.setCityId(rst.getLong(City.CITY_ID));
						obj.setCity(rst.getString(City.CITY));
					return obj;
				}
			});
			
		if(cityList != null && !cityList.isEmpty())
			return cityList.get(0);

				return null;
	}
	
	@Override
	public List<City> loadCityByNameAndObjectType(final String cityName, final Long objectTypeId){
		final String sql = "SELECT ua." + City.ID + ", ua." + City.CITY + ", ua." + City.CITY_ID
				 		 + ", ua." + City.OBJECT_TYPE + ", ua." + City.OBJECT_ID
						 + " FROM " + City.TABLE_NAME + " ua "
				         + " WHERE ua." + City.CITY + " = '" + cityName + "'"
				         + " AND ua." + City.OBJECT_TYPE + " = " + objectTypeId;

			if(developmentSettings.isShowSQL())
				logger.info(sql);

			List<City> cityList = jdbcTemplate.query(sql, new RowMapper<City>() {
	
				@Override
				public City mapRow(ResultSet rst, int arg1)throws SQLException {
					
					City obj = new City();
						obj.setId(rst.getLong(City.ID));
						obj.setCity(rst.getString(City.CITY));
						obj.setCityId(rst.getLong(City.CITY_ID));
						obj.setObjectId(rst.getLong(City.OBJECT_ID));
						obj.setObjectType(rst.getLong(City.OBJECT_TYPE));
					return obj;
				}
			});
			
		if(cityList != null && !cityList.isEmpty())
			return cityList;

				return null;
	}
	
	@Override
	public List<City> loadCityByObjectType(Long objectType) {
		 String sql = "SELECT ua." + City.ID + ", ua." + City.CITY + ", ua." + City.CITY_ID  + ", ua." + City.OBJECT_ID
				 	 + " FROM " + City.TABLE_NAME + " ua WHERE ua." + City.OBJECT_TYPE + " = " + objectType;
		 			
		 		sql += " GROUP BY ua." + City.CITY  ;
		 
			if(developmentSettings.isShowSQL())
				logger.info(sql);

			List<City> cityList = jdbcTemplate.query(sql, new CityMapper());
			if(cityList != null && !cityList.isEmpty())
				return cityList;
					return null;
	}

	@Override
	public void deleteCityByObjectType(final Long objectType , final Long objectId){
		final String sql = "DELETE FROM " + City.TABLE_NAME + "  WHERE " + City.OBJECT_TYPE + " = " + objectType 
				 + " AND " + City.OBJECT_ID + " = " + objectId;

			if(developmentSettings.isShowSQL())
					logger.info(sql);

			jdbcTemplate.update(sql);
	}
	
	@Override
	public List<PerpetualCity> loadAllPerpetualCity() {
		final String sql = "SELECT ua." + PerpetualCity.ID + ", ua." + PerpetualCity.CITY + " FROM " + PerpetualCity.TABLE_NAME + " ua "
				         + " GROUP BY ua." + PerpetualCity.CITY  ;

		if(developmentSettings.isShowSQL())
				logger.info(sql);

		List<PerpetualCity> cityList = jdbcTemplate.query(sql, new RowMapper<PerpetualCity>() {

			@Override
			public PerpetualCity mapRow(ResultSet rst, int arg1)throws SQLException {
				
				PerpetualCity obj = new PerpetualCity();
					obj.setId(rst.getLong(PerpetualCity.ID));
					obj.setCity(rst.getString(PerpetualCity.CITY));
				return obj;
			}
		});
		
			if(cityList != null && !cityList.isEmpty())
				return cityList;
		
				return null;
	}

	@Override
	public PerpetualCity loadPerpetualCityById(Long cityId) {
		final String sql = "SELECT ua." + PerpetualCity.ID + ", ua." + PerpetualCity.CITY + " FROM " + PerpetualCity.TABLE_NAME + " ua "
				         + " WHERE ua." + PerpetualCity.ID + " = " + cityId
				         + " GROUP BY ua." + City.CITY  ;

		if(developmentSettings.isShowSQL())
				logger.info(sql);

		List<PerpetualCity> cityList = jdbcTemplate.query(sql, new RowMapper<PerpetualCity>() {

			@Override
			public PerpetualCity mapRow(ResultSet rst, int arg1)throws SQLException {
				
				PerpetualCity obj = new PerpetualCity();
					obj.setId(rst.getLong(PerpetualCity.ID));
					obj.setCity(rst.getString(PerpetualCity.CITY));
				return obj;
			}
		});
		
			if(cityList != null && !cityList.isEmpty())
				return cityList.get(0);
		
				return null;
	}
	
	@Override
	public boolean removePerpetualCity(final String city) {
		String sql = "DELETE FROM " + PerpetualCity.TABLE_NAME + " WHERE " + PerpetualCity.CITY + " = ?";
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		try {
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setString(1, city);					
				}
			});
			return true;
		}catch(Exception e1){
			e1.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean addPerpetualCity(final String city) {
		final String sql = "INSERT INTO " + PerpetualCity.TABLE_NAME + " ( " + PerpetualCity.CITY + " )" + " VALUES ('" + city + "')";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		try {
			jdbcTemplate.update(sql);
			
			System.out.println("City[" + sql + "]");
			System.out.println("City[" + city + "] created");
			
			return true;
		}catch(Exception e1){
			e1.printStackTrace();
			return false;
		}
	}

}
