package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.Lead;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.LeadDAO;
import com.pcs.perpetualRents.dao.mapper.LeadMapper;

@Repository
public class LeadDAOImpl implements LeadDAO{

	private static Logger logger = ApplicationSettings.getLogger(LeadDAOImpl.class.getName());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long createLead(final Lead leadObj) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + Lead.TABLE_NAME + " ( " + Lead.NAME + ", " + Lead.ADDRESS + ", " + Lead.CONTACT_NUMBER
							+ ", " + Lead.EMAIL + ", " + Lead.MESSAGE
							+ " ) "
							+ " VALUES (?, ?, ?, ?, ?)";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, leadObj.getName());
					psObj.setString(2, leadObj.getAddress());
					psObj.setString(3, leadObj.getContactNumber());
					psObj.setString(4, leadObj.getEmail());
					psObj.setString(5, leadObj.getMessage());
				return psObj;
			}
		}, keyHolder);
		
				
		return keyHolder.getKey().longValue();
		
	}
	
	@Override
	public List<Lead> loadAllLead(Integer start, Integer limit) {
		String sql = "SELECT " + Lead.ID + ", " + Lead.NAME + ", " + Lead.ADDRESS + ", " + Lead.CONTACT_NUMBER + ", " + 
					Lead.EMAIL + ", " + Lead.MESSAGE + " FROM " + Lead.TABLE_NAME;
				
			

		List<Lead> leadList = jdbcTemplate.query(sql, new LeadMapper());
		
		if(leadList != null && !leadList.isEmpty())
			return leadList;
		
		return null;
	}

	
	@Override
	public List<Lead> searchLead(String[] fieldNames, String[] values,
			String[] condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteLead(Long objId) {
		if(objId!=null){
				try{
					jdbcTemplate.update("DELETE FROM " + Lead.TABLE_NAME + " WHERE id=" + objId);
					return true;
				}
				catch (Exception e) {
					e.printStackTrace();
					return false;
				}
		}
		return false;
	}

	@Override
	public Lead loadLeadById(Long leadId) {
		String sql = "SELECT " + Lead.ID + ", " + Lead.NAME + ", " + Lead.ADDRESS + ", " + Lead.CONTACT_NUMBER + ", " + 
				Lead.EMAIL + ", " + Lead.MESSAGE + " FROM " + Lead.TABLE_NAME + " WHERE " + Lead.ID + " = " + leadId;
			
		

	List<Lead> leadList = jdbcTemplate.query(sql, new LeadMapper());
	
	if(leadList != null && !leadList.isEmpty())
		return leadList.get(0);
	
	return null;
	}
	
}
