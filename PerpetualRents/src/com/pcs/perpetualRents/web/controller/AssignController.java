package com.pcs.perpetualRents.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.manager.AssignManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.ConversationManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.web.delegates.AjaxJSONDelegate;

@Controller
public class AssignController {
	
	@Autowired
	private ConversationManager conversationManager;
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private AssignManager assignManager;
	@Autowired
	private ContractorManager contractorManager;
	@Autowired
	private AjaxJSONDelegate JSONDelegates;
	
	private HttpSession sessionObj;
	private UserLogin loginObj;
	
	@RequestMapping("assign/isJobAssigned")
	public void isJobAssigned(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		Long propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		String funId = request.getParameter("functionalityId");
		if(propertyId != null && funId != null){
			AssignModel assignModel = assignManager.loadAssignedByPropertyAndFunctionality(propertyId, Long.valueOf(funId));
			if(assignModel != null){
				jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("assign/assignPropertyToContractor")
	public void assignPropertyToContractor(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		if(loginObj != null){
			String conversationId = request.getParameter("conversationId");
			String completionDate = request.getParameter("completionDate");
			String estimatedCost = request.getParameter("estimatedCost");
			String jobDescription = request.getParameter("jobDescription");
			
			if(conversationId != null && completionDate != null && estimatedCost != null){
			Conversation conObj = conversationManager.loadConversationById(Long.valueOf(conversationId.trim()));
			Contractor tContractorObj = contractorManager.loadContractorById(conObj.getActorTwoId());
				if(conObj != null && tContractorObj != null){
					AssignModel assignObj = new AssignModel();
						assignObj.setContractorName(tContractorObj.getCompanyName());
						assignObj.setAssignById(conObj.getActorOneId());
						assignObj.setAssignByTypeId(Long.valueOf(conObj.getActorOneObjectTypeId()));
						assignObj.setAssignToId(conObj.getActorTwoId());
						assignObj.setAssignToTypeId(Long.valueOf(conObj.getActorTwoObjectTypeId()));
						assignObj.setPropertyId(conObj.getPropertyId());
						assignObj.setFunctionalityId(conObj.getFunctionalityId());
						assignObj.setEstimatedCompletionDate(completionDate);
						assignObj.setEstimatedCost(estimatedCost);
						assignObj.setJobDescription(jobDescription);
						Long assignId = landLordManager.assignToContractor(assignObj, loginObj.getId());
						if(assignId != null){
							jObj.put("success", true);
							jObj.put("data", assignObj.getContractorName());
						}else{
							jObj.put("message", "Cannot assigned Job to " + assignObj.getContractorName() + " again.");
							jObj.put("success", false);
						}
				}
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
}
