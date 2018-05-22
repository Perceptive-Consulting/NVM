package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.AssignModel;

public interface AssignDAO {
	
	public Long assign(final AssignModel assignObj, final Long createdUserId);
	
	public AssignModel loadAssignModelById(final Long id);
	
	public List<AssignModel> loadAssignedToValues(Long assignToTypeId, Long assignToId);
	
	public List<AssignModel> loadAssignedToValues(Long assignToTypeId, Long assignToId, Long... statusId);
	
	public  List<AssignModel> loadAssignedByPropertyAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId);
	
	public  List<AssignModel> loadAssignedByPropertyAndAssignedBy(Long assignByTypeId, Long assignById, Long propertyId);
	
	public  AssignModel loadAssignedByPropertyFunctionalityAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId, Long functionalityId);
	
	public List<AssignModel> loadAssignedByObjectAndProperty(Long assignByTypeId, Long assignById, Long propertyId);
	
	public List<AssignModel> loadAssignedByValues(Long assignByTypeId, Long assignById);
	
	public List<AssignModel> loadAssignedByValues(Long assignByTypeId, Long assignById, Long statusId);
	
	public List<AssignModel> loadAssignedByPropertyId(Long propertyId);
	
	public AssignModel loadAssignedByPropertyAndFunctionality(Long propertyId, Long functionalityId);
	
	public boolean updateStatusById(final Long id, final Long statusId, final Long userId, final String remarks);
	
	public List<Long> loadPropertyIdByCity(Long cityId);
	
	public List<AssignModel> loadAllAssignModel(Integer start, Integer end);
}
