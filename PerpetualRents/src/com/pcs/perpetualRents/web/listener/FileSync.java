package com.pcs.perpetualRents.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.dao.impl.FileDAOImpl;

public class FileSync implements ServletContextListener {

	 @Override
	 public void contextInitialized(ServletContextEvent servletContextEvent) {
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
		ApplicationSettings applicationSettings = (ApplicationSettings) ctx.getBean("applicationSettings");
		new FileDAOImpl().runSync(servletContextEvent.getServletContext(), applicationSettings);
	 }

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
	}
	 
}
