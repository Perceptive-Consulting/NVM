package com.pcs.perpetualRents.web.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSession;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.ApplicationSessionManager;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.UserLoginManager;
import com.pcs.perpetualRents.web.delegates.AjaxJSONDelegate;

@Controller
public class Home  {
	
	private static Logger logger = ApplicationSettings.getLogger(Home.class.getName());
	
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private UserLoginManager loginManager;
	@Autowired
	private AjaxJSONDelegate JSONDelegates;
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private ApplicationSessionManager sessionManager;
	@Autowired
	private CommonManager commonManager;
	private boolean execStatus;
	
	@RequestMapping("/home")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		    UserLogin loginObj = null;
		    ModelAndView modelAndView = null;
		    HttpSession session = request.getSession(false);
		    try{
		    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		        String userName = authentication.getName();
		        
				if(userName == null || userName.equalsIgnoreCase("anonymousUser")){
					modelAndView =  new ModelAndView("index");
					return modelAndView;
				}
				
				String uploadPath = request.getServletContext().getRealPath("/WEB-INF");
				applicationSettings.setFolderPath(uploadPath);
				String contractorDocumentFolderPath = request.getServletContext().getRealPath("/resource/documentFolder/contractorDocs");
				applicationSettings.setContractorDocumentFolderPath(contractorDocumentFolderPath);
				logger.info("Setting Contractor Document Path folder Path " + applicationSettings.getContractorDocumentFolderPath());
				
				loginObj = loginManager.findLoginUserByName(userName);
				HttpSession sessionObj = request.getSession(false);
				if(sessionObj != null) {
					sessionObj.setAttribute("loginObj", loginObj);
					sessionObj.setAttribute("homemaxage", applicationSettings.getSessionMaxAge()*60*1000);
				}
				if(loginObj != null){
					if(loginObj.getUserTypeId() == UserType.LANDLORD.id())
						modelAndView =  new ModelAndView("user/landlord/landlordManager");
					else if(loginObj.getUserTypeId() == UserType.CONTRACTOR.id())
						modelAndView = new ModelAndView("user/contractor/contractorManager");
					else if(loginObj.getUserTypeId() == UserType.ADMIN.id() || loginObj.getUserTypeId() == UserType.SUPER_ADMIN.id()){
						modelAndView = new ModelAndView("admin/adminManager");
						modelAndView.addObject("loginName", loginObj.getUsername());
						session.setAttribute("loginName", loginObj.getUsername());
					}else if(loginObj.getUserTypeId() == UserType.SUPER_PMC.id() || loginObj.getUserTypeId() == UserType.PMC.id()){
						modelAndView = new ModelAndView("pmc/pmcManager");
						modelAndView.addObject("loginName", loginObj.getUsername());
					}else if(loginObj.getUserTypeId() == UserType.PROPERTY_DEVELOPER.id()){
						modelAndView = new ModelAndView("user/propertyDeveloper/propertyDeveloperManager");
					}
					modelAndView.addObject("homemaxage", String.valueOf(applicationSettings.getSessionMaxAge()*60*1000));
					
					ApplicationSession applicationSessionObj = new ApplicationSession(userName, session.getId(), request.getRemoteAddr());
					sessionManager.createSession(applicationSessionObj);
					
					return modelAndView;
				}
		    }catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		   return null;
	}

	@RequestMapping("home/fogetPassword")
	public ModelAndView redirectLandlordProfile(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("forgetpassword", "wordPressUrl", applicationSettings.getWordPressUrl());
	}
	
	@RequestMapping("home/forgetPasswordEmailId")
	public void fogetPasswordEmailId(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		
		JSONObject jObj = new JSONObject();
		String emailId=request.getParameter("emaildID");

		if(emailId != null && emailId.length() > 0){
			execStatus = commonManager.validateForgetPasswordEmailId(emailId);
			if(execStatus) {
				jObj.put("success",true);
				jObj.put("message","An email <b>" + emailId + "</b> is not registered with us.");
			
			} else {
				jObj.put("success",false);
				jObj.put("redirectURL", applicationSettings.getWordPressUrl());
				//jObj.put("redirectURL", "http://localhost:8080/PerpetualRents/");
				jObj.put("message","An email had been sent to " + emailId + " with password.");
			}
		}
		JSONDelegates.setResponse(jObj,response);
	}
	
	@RequestMapping("home/applicationLogout")
	public void applicationLogout(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		HttpSession sessionObj = request.getSession(false);
		JSONObject jObj = new JSONObject();
		if(sessionObj != null){
			sessionObj.setAttribute("logoutAttempt", "applicationLogout");
			jObj.put("success", true);
		}else{
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("home/userLogout")
	public void userLogout(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		HttpSession sessionObj = request.getSession(false);
		JSONObject jObj = new JSONObject();
		if(sessionObj != null){
			sessionObj.setAttribute("logoutAttempt", "userLogout");
			jObj.put("success", true);
		}else{
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	public UserLoginManager getLoginManager() {
		return loginManager;
	}

	public void setLoginManager(UserLoginManager loginManager) {
		this.loginManager = loginManager;
	}

	public AjaxJSONDelegate getJSONDelegates() {
		return JSONDelegates;
	}

	public void setJSONDelegates(AjaxJSONDelegate jSONDelegates) {
		JSONDelegates = jSONDelegates;
	}

	public LandLordManager getLandLordManager() {
		return landLordManager;
	}

	public void setLandLordManager(LandLordManager landLordManager) {
		this.landLordManager = landLordManager;
	}

	
	
}
