package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Documents;

public interface DocumentsDAO {
	
	public Long saveDocuments(Documents documents, Long userId) throws Exception;
	
	public Documents loadDocumentById(Long id);
	
	public void deleteDocumentsById(final Long id);
	
	public List<Documents> loadDocumentsByContractorFunctionalityAndPropertyId(final Long contractorId, final Long functionalityId, final Long propertyId);;
	
	public List<Documents> loadDocumentsByPropertyAndFunctionalityId(final Long propertyId, final Long functionalityId);
	
	public List<Documents> loadDocumentsByPropertyId(final Long propertyId);
	
	public boolean updateStatus(final Documents documents, final Long userId);

}
