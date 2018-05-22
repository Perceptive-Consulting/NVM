package com.pcs.perpetualRents.common.bean;

import org.springframework.stereotype.Component;

@Component
public class DevelopmentSettings {
	
	private boolean showSQL;
	private boolean showStackTrace;
	private boolean showLOG;
	
	public DevelopmentSettings() {
		this.showSQL = true;
		this.showStackTrace = true;
		this.showLOG = false;
	}
	
	public boolean isShowSQL() {
		return showSQL;
	}
	public void setShowSQL(boolean showSQL) {
		this.showSQL = showSQL;
	}
	public boolean isShowStackTrace() {
		return showStackTrace;
	}
	public void setShowStackTrace(boolean showStackTrace) {
		this.showStackTrace = showStackTrace;
	}
	public boolean isShowLOG() {
		return showLOG;
	}
	public void setShowLOG(boolean showLOG) {
		this.showLOG = showLOG;
	}
	
	
	
}
