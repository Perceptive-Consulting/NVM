package com.pcs.perpetualRents.manager;
import java.util.List;

import com.pcs.perpetualRents.business.bean.File;


public interface FileManager {
	
	public Long saveFile(File fileObj, Long createdUserId);
	
	public File loadFileById(Long fileId);
	
	public List<File> loadFileByObjectType(Long objectType, Long objectId);
	
	public void deleteFileById(final Long fileId);
	
	public Long saveAdminFile(File fileObj, Long createdUserId);
}
