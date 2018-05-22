package com.pcs.perpetualRents.dao.impl;

import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.FileDAO;

@Repository
public class FileDAOImpl implements FileDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(FileDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public void runSync(ServletContext servletContext, ApplicationSettings applicationSettings){
		 try {
			logger.info("Reposity synchronization started @ " + new Date());
			String destinationFolder = servletContext.getRealPath("uploadFiles");
			java.io.File tFileObj = new java.io.File(destinationFolder);
			if(!tFileObj.exists())
				tFileObj.mkdirs();
			
			FileUtils.copyDirectory(new java.io.File(applicationSettings.getDocumentRepository()), new java.io.File(destinationFolder));
			logger.info("Reposity synchronization completed @ " + new Date());
			//storeException("test.log", "C:\\Users\\admin\\Desktop\\personal\\", new Exception("File Copied successfully"));
		} catch (Exception e) {
			logger.info("Reposity synchronization terminated @ " + new Date() + "[" + e.getMessage() + "]");
			//storeException("test.log", "C:\\Users\\admin\\Desktop\\personal\\", e);
			//fire email(s)
			System.out.println("Reposity synchronization terminated @ " + new Date() + "[" + e.getMessage() + "]");
		}
	}
	
	protected void storeException(String fileName, String path, Exception tExceptionObj) {
		try {
			
			java.io.File fileObj = new java.io.File(path);
			if(!fileObj.exists())
				fileObj.mkdirs();
			
			java.io.File tFileObj = new java.io.File(fileObj.getAbsolutePath(), fileName);
			
			PrintStream tPrintStreamObj = new PrintStream(tFileObj);
			tExceptionObj.printStackTrace(tPrintStreamObj);
			tPrintStreamObj.flush();
			tPrintStreamObj.close();
				
		} catch (IOException e) {
			logger.severe("XML Writing FAILED");
		}
	}
	
	@Override
	public Long saveFile(final File tFileObj, final Long createdUserId) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + File.TABLE_NAME + "( " + File.FILE_NAME + ", " + File.CREATED_USER_ID
				+ ", " + File.OBJECT_TYPE + ", " + File.OBJECT_ID + ", " + File.SIZE + ", " + File.CONTENT_TYPE + ", " + File.FILE_PATH
				+ ", " + File.DOCUMENT_TYPE_ID + " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, tFileObj.getFileName());
					psObj.setLong(2, createdUserId);
					psObj.setLong(3, tFileObj.getObjectType());
					psObj.setLong(4, tFileObj.getObjectId());
					psObj.setLong(5, tFileObj.getSize());
					psObj.setString(6, tFileObj.getContentType());
					psObj.setString(7, tFileObj.getFilePath());
					psObj.setLong(8, tFileObj.getDocumentType());
					
				return psObj;
			}
		}, keyHolder);
		
		if(keyHolder.getKey() != null){
			tFileObj.setId(keyHolder.getKey().longValue());
			System.out.println("SAVING FILE => Name :" + tFileObj.getFileName() + ";Path :" + tFileObj.getFilePath() + ";Id :" + tFileObj.getId());
			return keyHolder.getKey().longValue();
		}
		
		return null;
	}

	@Override
	public File loadFileById(Long fileId) {

		String sql = "SELECT " +File.ID + ", " + File.FILE_NAME + ", " + File.SIZE + ", " + File.FILE_PATH
					+ ", " + File.CONTENT_TYPE + ", " + File.DOCUMENT_TYPE_ID + " FROM " + File.TABLE_NAME
					+ " WHERE " + File.ID  + " = " + fileId ;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
			List<File> fileList = jdbcTemplate.query(sql, new RowMapper<File>() {
				@Override
				public File mapRow(ResultSet rst, int arg1) throws SQLException {
					File obj = new File();
						obj.setId(rst.getLong(File.ID));
						obj.setFileName(rst.getString(File.FILE_NAME));
						obj.setSize(rst.getLong(File.SIZE));
						obj.setFilePath(rst.getString(File.FILE_PATH));
						obj.setContentType(rst.getString(File.CONTENT_TYPE));
						obj.setDocumentType(rst.getLong(File.DOCUMENT_TYPE_ID));
					return obj;
				}
			});
			if(fileList != null && !fileList.isEmpty())
				return fileList.get(0);

		return null;
	}

	@Override
	public List<File> loadFileByObjectType(Long objectType, Long objectId) {
		
			String sql = "SELECT " +File.ID + ", " + File.FILE_NAME + ", " + File.SIZE + ", " + File.FILE_PATH
					+ ", " + File.CONTENT_TYPE + ", " + File.DOCUMENT_TYPE_ID + " FROM " + File.TABLE_NAME
						+ " WHERE " + File.OBJECT_TYPE  + " = " + objectType + " AND " + File.OBJECT_ID + " = " +objectId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
		
			List<File> fileList = jdbcTemplate.query(sql, new RowMapper<File>() {
	
					@Override
					public File mapRow(ResultSet rst, int arg1) throws SQLException {
						File obj = new File();
							obj.setId(rst.getLong(File.ID));
							obj.setFileName(rst.getString(File.FILE_NAME));
							obj.setSize(rst.getLong(File.SIZE));
							obj.setFilePath(rst.getString(File.FILE_PATH));
							obj.setContentType(rst.getString(File.CONTENT_TYPE));
							obj.setDocumentType(rst.getLong(File.DOCUMENT_TYPE_ID));
						return obj;
					}
				});
			
			if(fileList != null && !fileList.isEmpty())
				return fileList;

		return null;
	}

	@Override
	public void deleteFileById(final Long fileId){
		
		final String sql = "DELETE FROM " + File.TABLE_NAME + " WHERE " + File.ID + " = ?";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql);
					psObj.setLong(1, fileId);
				return psObj;
			}
		});
		
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
