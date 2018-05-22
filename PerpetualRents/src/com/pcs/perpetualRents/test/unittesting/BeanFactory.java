package com.pcs.perpetualRents.test.unittesting;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pcs.perpetualRents.manager.LandLordManager;

public class BeanFactory<T> {
	
	private T obj;
	@SuppressWarnings({ "unchecked" })
	public T getBean(Class<T> className){
		
		if(className.equals(LandLordManager.class)){
			ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/pcs/perpetualRents/test/applicationContext.xml");
			LandLordManager landlordManager =(LandLordManager) ctx.getBean("landLordManagerImpl");

			obj = (T) landlordManager;
		}
		return obj;
	}
	
}
