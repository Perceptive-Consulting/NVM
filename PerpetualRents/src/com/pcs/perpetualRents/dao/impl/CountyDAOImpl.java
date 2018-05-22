package com.pcs.perpetualRents.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pcs.perpetualRents.business.bean.PerpetualCounty;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.CountyDAO;

@Repository
public class CountyDAOImpl implements CountyDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(CountyDAOImpl.class.getName());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	
	@Override
	public List<PerpetualCounty> loadAllPerpetualCounty() {
		final String sql = "SELECT ua." + PerpetualCounty.ID + ", ua." + PerpetualCounty.COUNTY + " FROM " + PerpetualCounty.TABLE_NAME + " ua "
				         + " GROUP BY ua." + PerpetualCounty.COUNTY  ;

		if(developmentSettings.isShowSQL())
				logger.info(sql);

		List<PerpetualCounty> countyList = jdbcTemplate.query(sql, new RowMapper<PerpetualCounty>() {

			@Override
			public PerpetualCounty mapRow(ResultSet rst, int arg1)throws SQLException {
				
				PerpetualCounty obj = new PerpetualCounty();
					obj.setId(rst.getLong(PerpetualCounty.ID));
					obj.setCounty(rst.getString(PerpetualCounty.COUNTY));
				return obj;
			}
		});
		
			if(countyList != null && !countyList.isEmpty())
				return countyList;
		
				return null;
	}

}
