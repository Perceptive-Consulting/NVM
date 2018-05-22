package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Conversation;

public interface ConversationManager {
	
	public Long createConversation(final Conversation convObj, final Long userId);
	
	public Conversation loadConversationByConvIdentity(final String conversationIdentity, final Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByPropertyId(final Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByPropertyAndActorOneTypeId(final Long propertyId, final Integer propertyTypeId, final Long... actorOneTypeId);
	
	public Conversation loadConversationByContractorAndProperty(final Long contractorId, final Long propertyId, final Integer propertyTypeId);
	
	public Conversation loadConversationByContractorPropertyAndFunctionality(final Long contractorId, final Long propertyId, final Integer propertyTypeId, final Long functionalityId);
	
	public Conversation loadConversationByConvIdentity(final String conversationIdentity);
	
	public List<Conversation> loadConversationByContractorId(Long contractorId);
	
	public Conversation loadConversationById(final Long id);
	
	public List<Conversation> loadConversationByPropertyAndFunctionality(final Long propertyId, final Integer propertyTypeId, final Long functionalityId);
	
	public Conversation loadConversationByConvIdentityAndPropertyId(final String conversationIdentity, Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByActorOne(Long actorOneId, final Long actorOneObjectTypeId, Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByActorOne(Long actorOneId, final Long actorOneObjectTypeId);
	
	public List<Conversation> loadConversationByActorTwo(Long actorTwoId, final Long actorTwoObjectTypeId, Long propertyId, final Integer propertyTypeId);
	
	public List<Conversation> loadConversationByActorOneAndActorTwo(Long actorOneId, Long actorOneObjectTypeId, Long actorTwoId, final Long actorTwoObjectTypeId);
	
}
