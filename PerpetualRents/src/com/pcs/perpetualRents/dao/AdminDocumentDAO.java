package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.AdminUploadDocuments;

public interface AdminDocumentDAO {
	
	public Long saveDocuments(final AdminUploadDocuments documents, Long userId);
	
	public AdminUploadDocuments loadByDocumentId(final Long documentId);

	public boolean deleteFileById(Long adminDocumentId);
	
	public List<AdminUploadDocuments> loadAllDocuments();
	
}
