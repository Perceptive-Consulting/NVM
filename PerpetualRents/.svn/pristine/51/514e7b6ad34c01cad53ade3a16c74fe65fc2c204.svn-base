package com.pcs.perpetualRents.dao;

import java.util.List;

import javax.servlet.ServletContext;

import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;

public interface FileDAO {
	
	public void runSync(ServletContext servletContext, ApplicationSettings applicationSettings);
	
	public Long saveFile(File fileObj, Long createdUserId);
	
	public File loadFileById(Long fileId);
	
	public List<File> loadFileByObjectType(Long objectType, Long objectId);
	
	public void deleteFileById(final Long fileId);
	
}
