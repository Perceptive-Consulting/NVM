package com.pcs.perpetualRents.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.dao.ConversationDAO;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.manager.ConversationManager;

@Service
@Transactional
public class ConversationManagerImpl implements ConversationManager{
	
	@Autowired
	private ConversationDAO conversationDAO;
	
	@Override
	public Long createConversation(Conversation convObj, Long userId) {
		Long conversationId = null;
		Conversation conversationObj = conversationDAO.loadConversationByConvIdentityAndPropertyId(convObj.getConversationIdentity(), convObj.getPropertyId(), convObj.getPropertyTypeId());
		if(conversationObj != null){
			conversationId = null;
		}else{
			conversationId = conversationDAO.createConversation(convObj, userId);
			
		}
		if(conversationId != null)
			return conversationId;
		return null;
	}
	
	public Conversation loadConversationByConvIdentity(final String conversationIdentity){
		return conversationDAO.loadConversationByConvIdentity(conversationIdentity);
	}
	
	@Override
	public Conversation loadConversationByConvIdentity(String conversationIdentity, Long propertyId, Integer propertyTypeId) {
		Conversation convObj = conversationDAO.loadConversationByConvIdentityAndPropertyId(conversationIdentity, propertyId, propertyTypeId);
		
		if(convObj != null)
			return convObj;
		
		return null;
	}

	@Override
	public List<Conversation> loadConversationByPropertyId(Long propertyId, Integer propertyTypeId) {
		List<Conversation> conversationList = conversationDAO.loadConversationByPropertyId(propertyId, propertyTypeId);
		if(conversationList != null && !conversationList.isEmpty())
			return conversationList;
		
		return null;
	}
	
	@Override
	public Conversation loadConversationByContractorAndProperty(final Long contractorId, final Long propertyId, Integer propertyTypeId){
		return conversationDAO.loadConversationByContractorAndProperty(contractorId, propertyId, propertyTypeId);	
	}
	
	@Override
	public Conversation loadConversationByContractorPropertyAndFunctionality(final Long contractorId, final Long propertyId, Integer propertyTypeId, final Long functionalityId){
		return conversationDAO.loadConversationByContractorPropertyAndFunctionality(contractorId, propertyId, propertyTypeId, functionalityId); 
	}
	
	@Override
	public List<Conversation> loadConversationByContractorId(Long contractorId) {
		List<Conversation> conList = conversationDAO.loadConversationByActorTwo(contractorId, ObjectType.CONTRACTOR.id());
		if(conList != null && !conList.isEmpty())
			return conList;
		
		return null;
	}

	@Override
	public Conversation loadConversationById(Long id) {
		return conversationDAO.loadConversationById(id);
	}
	
	@Override
	public List<Conversation> loadConversationByPropertyAndFunctionality(final Long propertyId, final Integer propertyTypeId, final Long functionalityId){
		return conversationDAO.loadConversationByPropertyAndFunctionality(propertyId, propertyTypeId,  functionalityId);
	}
	
	@Override
	public List<Conversation> loadConversationByPropertyAndActorOneTypeId(final Long propertyId, Integer propertyTypeId, final Long... actorOneTypeId){
		return conversationDAO.loadConversationByPropertyAndActorOneTypeId(propertyId, propertyTypeId, actorOneTypeId);
	}
	
	@Override
	public Conversation loadConversationByConvIdentityAndPropertyId(final String conversationIdentity, Long propertyId, Integer propertyTypeId){
		return conversationDAO.loadConversationByConvIdentityAndPropertyId(conversationIdentity, propertyId, propertyTypeId);
	}
	
	@Override
	public List<Conversation> loadConversationByActorOne(Long actorOneId, final Long actorOneObjectTypeId, Long propertyId, Integer propertyTypeId){
		return conversationDAO.loadConversationByActorOne(actorOneId, actorOneObjectTypeId, propertyId, propertyTypeId);
	}
	
	@Override
	public List<Conversation> loadConversationByActorOne(Long actorOneId, final Long actorOneObjectTypeId){
		return conversationDAO.loadConversationByActorOne(actorOneId, actorOneObjectTypeId);
	}
	
	@Override
	public List<Conversation> loadConversationByActorTwo(Long actorTwoId, final Long actorTwoObjectTypeId, Long propertyId, Integer propertyTypeId){
		return conversationDAO.loadConversationByActorTwo(actorTwoId, actorTwoObjectTypeId, propertyId, propertyTypeId);
	}
	
	public List<Conversation> loadConversationByActorOneAndActorTwo(Long actorOneId, Long actorOneObjectTypeId, Long actorTwoId, final Long actorTwoObjectTypeId){
		return conversationDAO.loadConversationByActorOneAndActorTwo(actorOneId, actorOneObjectTypeId, actorTwoId, actorTwoObjectTypeId);
	}
	
}
