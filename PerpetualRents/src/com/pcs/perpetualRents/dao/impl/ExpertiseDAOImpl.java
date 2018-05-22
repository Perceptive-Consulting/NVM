package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.ExpertiseDAO;
import com.pcs.perpetualRents.dao.mapper.ExpertiseMapper;

@Repository
public class ExpertiseDAOImpl implements ExpertiseDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(ExpertiseDAOImpl.class.getName());

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long createExpertise(final Expertise expertiseObj, final Long createdUserId) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + Expertise.TABLE_NAME + "( "+ Expertise.FUNCTIONALITY_ID + ", " + Expertise.QUALIFICATION  
							+ ", " + Expertise.CONTRACTOR_ID + ", " + Expertise.CREATED_USER_ID
						+ ") VALUES (?, ?, ?, ? )";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setLong(1, expertiseObj.getFunctionalityId());
					if(expertiseObj.getQualification() != null)
						psObj.setString(2, expertiseObj.getQualification());
					else
						psObj.setNull(2, Types.NULL);
					psObj.setLong(3, expertiseObj.getContractorId());
					if(createdUserId != null)
						psObj.setLong(4, createdUserId);
					else
						psObj.setNull(4, Types.NULL);
					
				return psObj;
			}
		}, keyHolder);
		
		return keyHolder.getKey().longValue();
	}
	
	@Override
	public List<Expertise> loadAllExpertise(Integer start, Integer limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Expertise> findByContractorId(Long contractorId) {
		
		String sql = "SELECT ua." + Expertise.ID + ", ua." + Expertise.FUNCTIONALITY_ID + ", ua." + Expertise.QUALIFICATION
				  + ", ua." + Expertise.CONTRACTOR_ID
				 + " FROM " + Expertise.TABLE_NAME + " ua WHERE ua." + Expertise.CONTRACTOR_ID + " = " + contractorId ;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Expertise> expertiseList = jdbcTemplate.query(sql, new ExpertiseMapper());
		if(expertiseList != null && !expertiseList.isEmpty())
			return expertiseList;
		
		return null;
	}
	
	@Override
	public Expertise loadExpertiseByContractorAndCity(Long contractorId, Long functionalityId) {
		String sql = "SELECT ua." + Expertise.ID + ", ua." + Expertise.FUNCTIONALITY_ID + ", ua." + Expertise.QUALIFICATION 
				 + ", ua." + Expertise.CONTRACTOR_ID
				 + " FROM " + Expertise.TABLE_NAME + " ua " 
				 + " WHERE ua." + Expertise.CONTRACTOR_ID + " = " + contractorId
				 + " AND ua." + Expertise.FUNCTIONALITY_ID + "= " + functionalityId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Expertise> expertiseList = jdbcTemplate.query(sql, new ExpertiseMapper());
		if(expertiseList != null && !expertiseList.isEmpty())
			return expertiseList.get(0);
		
		return null;
	}
	
	@Override
	public void deleteExpertiseObj(Long contractorObjId) {
		if(contractorObjId != null){
			String sql = "DELETE FROM " + Expertise.TABLE_NAME + " WHERE " + Expertise.CONTRACTOR_ID + " = " + contractorObjId;
				jdbcTemplate.update(sql);
		}
	}
	
	public Expertise loadExpertiseById(Long id){
		
		String sql = "SELECT ua." + Expertise.ID + ", ua." + Expertise.FUNCTIONALITY_ID + ", ua." + Expertise.QUALIFICATION 
				 + ", ua." + Expertise.CONTRACTOR_ID
				 + " FROM " + Expertise.TABLE_NAME + " ua " 
				 + " LEFT JOIN " + City.TABLE_NAME + " x0 ON ua." + Expertise.ID + " = x0." + City.OBJECT_ID  
				 + " WHERE ua." + Expertise.ID + " = " + id;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Expertise> expertiseList = jdbcTemplate.query(sql, new ExpertiseMapper());
		if(expertiseList != null && !expertiseList.isEmpty())
			return expertiseList.get(0);
		
		return null;
	}
	
	@Override
	public List<Expertise> loadExpertiseByContractorId(Long contractorId){
		
		String sql = "SELECT ua." + Expertise.ID + ", ua." + Expertise.FUNCTIONALITY_ID + ", ua." + Expertise.QUALIFICATION 
				 + ", ua." + Expertise.CONTRACTOR_ID
				 + " FROM " + Expertise.TABLE_NAME + " ua " 
				 + " WHERE ua." + Expertise.CONTRACTOR_ID + " = " + contractorId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Expertise> expertiseList = jdbcTemplate.query(sql, new ExpertiseMapper());
		if(expertiseList != null && !expertiseList.isEmpty())
			return expertiseList;
		
		return null;
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public DevelopmentSettings getDevelopmentSettings() {
		return developmentSettings;
	}

	public void setDevelopmentSettings(DevelopmentSettings developmentSettings) {
		this.developmentSettings = developmentSettings;
	}
	
}
