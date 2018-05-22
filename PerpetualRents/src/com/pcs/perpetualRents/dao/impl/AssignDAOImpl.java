package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.AssignDAO;
import com.pcs.perpetualRents.dao.mapper.AssignMapper;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.Status;

@Repository
public class AssignDAOImpl implements AssignDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(AddressDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long assign(final AssignModel assignObj, final Long createdUserId) {
		final String sql = "INSERT INTO " + AssignModel.TABLE_NAME + " ( " + AssignModel.ASSIGN_BY_ID + ", " + AssignModel.ASSIGN_BY_TYPE_ID
				   + ", " + AssignModel.ASSIGN_TO_ID + ", " + AssignModel.ASSIGN_TO_TYPE_ID + ", " + AssignModel.CREATED_USER_ID
		 	       + ", " + AssignModel.CITY_ID + ", " + AssignModel.PROPERTY_ID + ", " + AssignModel.REMARKS + ", " + AssignModel.STATUS_ID
		 	      + ", " + AssignModel.ESTIMATED_COMPLETION_DATE + ", " + AssignModel.ESTIMATED_COST + ", " + AssignModel.FUNCTIONALITY_ID
		 	     + ", " + AssignModel.JOBS_DESCRIPTION
		 	       + " ) "
		           + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
		
		@Override
		public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setLong(1, assignObj.getAssignById());
					psObj.setLong(2, assignObj.getAssignByTypeId());
					psObj.setLong(3, assignObj.getAssignToId());
					psObj.setLong(4, assignObj.getAssignToTypeId());
					psObj.setLong(5, createdUserId);
					psObj.setLong(6, assignObj.getCityId());
					psObj.setLong(7, assignObj.getPropertyId());
					psObj.setString(8, assignObj.getRemarks());
					psObj.setLong(9, Status.ASSIGNED.id());
					psObj.setString(10, assignObj.getEstimatedCompletionDate());
					psObj.setString(11, assignObj.getEstimatedCost());
					psObj.setLong(12, assignObj.getFunctionalityId());
					psObj.setString(13, assignObj.getJobDescription());
				
			return psObj;
		}
	}, keyHolder);
	
	if(keyHolder.getKey() != null)
		return keyHolder.getKey().longValue();
	
		return null;
	}
	
	@Override
	public AssignModel loadAssignModelById(final Long id){
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				 + ", ua." + AssignModel.JOBS_DESCRIPTION + ", ua." + AssignModel.REMARKS
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ID + " = " + id;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList.get(0);
			
		return null;
	
	}
	
	@Override
	public List<AssignModel> loadAssignedToValues(Long assignToTypeId, Long assignToId) {
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				 + ", ua." + AssignModel.JOBS_DESCRIPTION + ", ua." + AssignModel.REMARKS
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_TO_ID + " = " + assignToId
				+ " AND ua." + AssignModel.ASSIGN_TO_TYPE_ID + " = " + assignToTypeId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}
	
	@Override 
	public List<AssignModel> loadAssignedToValues(Long assignToTypeId, Long assignToId, Long... statusId) {
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION + ", ua." + AssignModel.REMARKS
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_TO_ID + " = " + assignToId
				+ " AND ua." + AssignModel.ASSIGN_TO_TYPE_ID + " = " + assignToTypeId;
				//+ " AND ua." + AssignModel.STATUS_ID + " = " + statusId;
			String delim = "  AND ( ";
			for(int j = 0; j < statusId.length; j++){
				sql +=  delim + " ua." + AssignModel.STATUS_ID + " = " + statusId[j];
					delim = " OR ";
			}
			sql += " ) ";
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}
	
	@Override
	public List<AssignModel> loadAssignedByPropertyAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId){
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_TO_ID + " = " + assignToId
				+ " AND ua." + AssignModel.ASSIGN_TO_TYPE_ID + " = " + assignToTypeId
				+ " AND ua." + AssignModel.PROPERTY_ID + " = " + propertyId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}
	
	@Override
	public  List<AssignModel> loadAssignedByPropertyAndAssignedBy(Long assignByTypeId, Long assignById, Long propertyId){
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_BY_ID + " = " + assignById
				+ " AND ua." + AssignModel.ASSIGN_BY_TYPE_ID + " = " + assignByTypeId
				+ " AND ua." + AssignModel.PROPERTY_ID + " = " + propertyId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}
	
	@Override
	public  AssignModel loadAssignedByPropertyFunctionalityAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId, Long functionalityId){
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_TO_ID + " = " + assignToId
				+ " AND ua." + AssignModel.ASSIGN_TO_TYPE_ID + " = " + assignToTypeId
				+ " AND ua." + AssignModel.PROPERTY_ID + " = " + propertyId
				+ " AND ua." + AssignModel.FUNCTIONALITY_ID + " = " + functionalityId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList.get(0);
			
		return null;
	}
	
	@Override
	public List<AssignModel> loadAssignedByValues(Long assignByTypeId, Long assignById) {
		

		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_BY_ID + " = " + assignById
				+ " AND ua." + AssignModel.ASSIGN_BY_TYPE_ID + " = " + assignByTypeId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}

	@Override
	public List<AssignModel> loadAssignedByValues(Long assignByTypeId, Long assignById, Long statusId) {

		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_BY_ID + " = " + assignById
				+ " AND ua." + AssignModel.ASSIGN_BY_TYPE_ID + " = " + assignByTypeId
				+ " AND ua." + AssignModel.STATUS_ID + " = " + statusId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}
	
	@Override
	public AssignModel loadAssignedByPropertyAndFunctionality(Long propertyId, Long functionalityId){

		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.PROPERTY_ID + " = " + propertyId
				+ " AND ua." + AssignModel.FUNCTIONALITY_ID + " = " + functionalityId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList.get(0);
			
		return null;
	}
	
	@Override
	public List<AssignModel> loadAssignedByPropertyId(Long propertyId){

		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.PROPERTY_ID + " = " + propertyId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}
	
	@Override
	public boolean updateStatusById(final Long id, final Long statusId, final Long userId, final String remarks){
		
		String sql = "UPDATE " + AssignModel.TABLE_NAME + " SET " + AssignModel.STATUS_ID + " = ?, " + AssignModel.REMARKS + " = ?, "
				+ AssignModel.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + AssignModel.MODIFIED_USER_ID + " = ? "
				+ " WHERE " + AssignModel.ID + " = ?";
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		int status = jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setLong(1 , statusId);
				if(remarks != null)
					psObj.setString(2, remarks);
				else 
					psObj.setNull(2, Types.NULL);
				psObj.setLong(3, userId);
				psObj.setLong(4, id);
			}
		});
		if(status == 1)
			return true;
		else
			return false;
	}

	@Override
	public List<Long> loadPropertyIdByCity(Long cityId) {
		String sql = "SELECT ua." + AssignModel.PROPERTY_ID
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " WHERE ua." + AssignModel.CITY_ID + " = " + cityId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<Long> propertyIds = jdbcTemplate.query(sql, new RowMapper<Long>() {

		@Override
		public Long mapRow(ResultSet rst, int arg1) throws SQLException {
			Long propertyId = null;
			try{
				propertyId = rst.getLong(AssignModel.PROPERTY_ID);
			}catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			return propertyId;
		}
	});
		 if(propertyIds != null && !propertyIds.isEmpty())
			 return propertyIds;
			
		return null;
	}
	
	@Override
	public List<AssignModel> loadAssignedByObjectAndProperty(Long assignByTypeId, Long assignById, Long propertyId){
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + AssignModel.ASSIGN_BY_ID + " = " + assignById
				+ " AND ua." + AssignModel.ASSIGN_BY_TYPE_ID + " = " + assignByTypeId
				+ " AND ua." + AssignModel.PROPERTY_ID + " = " + propertyId;
				
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	}

	@Override
	public List<AssignModel> loadAllAssignModel(Integer start, Integer end) {
		
		String sql = "SELECT ua." + AssignModel.ID + ", ua." + AssignModel.ASSIGN_BY_ID + ", ua." + AssignModel.ASSIGN_BY_TYPE_ID + ", ua." + AssignModel.ASSIGN_TO_ID
				+ ", ua." + AssignModel.ASSIGN_TO_TYPE_ID + ", ua." + AssignModel.CITY_ID + ", ua." + AssignModel.PROPERTY_ID
				+ ", ua." + AssignModel.ESTIMATED_COMPLETION_DATE + ", ua." + AssignModel.ESTIMATED_COST + ", ua." + AssignModel.FUNCTIONALITY_ID + ", ua." + AssignModel.JOBS_DESCRIPTION
				+ ", ua." + AssignModel.JOBS_DESCRIPTION  + ", ua." + AssignModel.REMARKS 
				+ ", ua." + AssignModel.ENABLE + ", ua." + AssignModel.STATUS_ID
				+ ", ua." + AssignModel.CREATED_ON + ", ua." + AssignModel.MODIFIED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + AssignModel.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + AssignModel.MODIFIED_BY
				+ " FROM " + AssignModel.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE " + AssignModel.ASSIGN_BY_TYPE_ID + " = " + ObjectType.LANDLORD.id() ;
		
			if(start != null && end != null){
				sql += " LIMIT ( " + start + " , " + end + " ) ";
			}
			
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	 List<AssignModel> assignList = jdbcTemplate.query(sql, new AssignMapper());
		 if(assignList != null && !assignList.isEmpty())
			 return assignList;
			
		return null;
	
	}
	
}
