package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Conversation;

public interface ConversationDAO {
	
	public Long createConversation(final Conversation convObj, Long userId);
	
	public Conversation loadConversationById(final Long userId);
	
	public Conversation loadConversationByConvIdentityAndPropertyId(final String conversationIdentity, Long propertyId, Integer propertyTypeId);
	
	public Conversation loadConversationByConvIdentity(final String conversationIdentity);
	
	public List<Conversation> loadConversationByPropertyId(final Long propertyId, final Integer propertyTypeId);
	
	public Conversation loadConversationByContractorAndProperty(final Long contractorId, final Long propertyId, final Integer propertyTypeId);
	
	public Conversation loadConversationByContractorPropertyAndFunctionality(final Long contractorId, final Long propertyId, final Integer propertyTypeId, final Long functionalityId);
	
	public List<Conversation> loadConversationByActorOne(final Long actorOneId, final Long actorOneObjectTypeId, final Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByActorOne(final Long actorOneId, final Long actorOneObjectTypeId);
	
	public List<Conversation> loadConversationByActorTwo(final Long actorTwoId, final Long actorTwoObjectTypeId, final Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByActorTwo(Long actorTwoId, final Long actorTwoObjectTypeId);
	
	public List<Conversation> loadConversationByPropertyAndFunctionality(final Long propertyId, final Integer propertyTypeId, final Long functionalityId);
	
	public List<Conversation> loadConversationByPropertyAndActorOneTypeId(final Long propertyId, final Integer propertyTypeId, final Long... actorOneTypeId);  
	
	public List<Conversation> loadConversationByActorOneAndActorTwo(Long actorOneId, Long actorOneObjectTypeId, Long actorTwoId, final Long actorTwoObjectTypeId);
	
}
