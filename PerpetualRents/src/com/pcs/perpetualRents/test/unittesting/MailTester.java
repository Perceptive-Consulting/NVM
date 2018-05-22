package com.pcs.perpetualRents.test.unittesting;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.LandLordManager;
 

public class MailTester {
	
	public static void main(String[] args) {
		/*ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/pcs/perpetualRents/test/applicationContext.xml");
		MailManager mailManger =(MailManager) ctx.getBean("mailManagerImpl");
        System.out.println(mailManger);*/
		MailTester.landlordRegisteration();
        
	}
	
	public static void landlordRegisteration(){
		
		BeanFactory<LandLordManager> BEANFACTORY = new BeanFactory<LandLordManager>(); 
		LandLordManager landlordManager = BEANFACTORY.getBean(LandLordManager.class);
		LandLord landlordObj = landlordManager.loadLandlordById(1L);
		if(landlordObj != null){
			 UserLogin loginObj = landlordObj.getLoginObj();
			 if(loginObj != null){
				 loginObj.setUsername(String.valueOf(Math.random()));
			 }
			 Address addressObj = landlordObj.getAddressObj();
			 if(addressObj != null){
				 addressObj.setCity(String.valueOf(91));
			 }
			landlordObj.setPrimaryEmailId("chintan.dhingra@perceptive-solutions.com");
			 landlordManager.createLandLord(landlordObj, 1L);
			System.out.println("Complete...");
		}
	}
	
	public static void editLandlord(){
		BeanFactory<LandLordManager> BEANFACTORY = new BeanFactory<LandLordManager>(); 
		LandLordManager landlordManager = BEANFACTORY.getBean(LandLordManager.class);
		LandLord landlordObj = landlordManager.loadLandlordById(1L);
		if(landlordObj != null){
			 UserLogin loginObj = landlordObj.getLoginObj();
			 
			 Address addressObj = landlordObj.getAddressObj();
			 if(addressObj != null){
				 addressObj.setCity(String.valueOf(91));
			 }
			landlordObj.setPrimaryEmailId("chintan.dhingra@perceptive-solutions.com");
			 landlordManager.updateLandLord(landlordObj, loginObj.getId());
			System.out.println("Edit Complete.");
		}
	}
	
	
	public static void contractorRegisterationStep1(){

		BeanFactory<ContractorManager> BEANFACTORY = new BeanFactory<ContractorManager>(); 
		ContractorManager contractorManager = BEANFACTORY.getBean(ContractorManager.class);
		Contractor contractorObj = contractorManager.loadContractorById(1L);
		if(contractorObj != null){
			 UserLogin loginObj = contractorObj.getLoginObj();
			 if(loginObj != null){
				 loginObj.setUsername(String.valueOf(Math.random()));
			 }
			
			 ContactDetails detailsObj = contractorObj.getContactDetailsObj();
			 if(detailsObj != null){
				 detailsObj.setEmailId("chintan.dhingra@perceptive-solutions.com");
			 }
			 
			 contractorManager.createContractor(contractorObj, loginObj.getId());
			System.out.println("Contractor Created");
		}
	
	}
	
	public static void contractorRegisterationStep4(){

		BeanFactory<ContractorManager> BEANFACTORY = new BeanFactory<ContractorManager>(); 
		ContractorManager contractorManager = BEANFACTORY.getBean(ContractorManager.class);
		ContractorRegisterationStep4 contractorObj = contractorManager.loadContractorStep4Info(1L);
		if(contractorObj != null){
			 contractorManager.saveContractorRegisterationStep4(contractorObj, 1L);
			System.out.println("ContractorRegisteration Step4 Created");
		}
	}
	
}
