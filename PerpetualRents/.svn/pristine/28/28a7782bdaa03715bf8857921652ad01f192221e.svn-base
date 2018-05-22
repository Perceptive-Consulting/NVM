package com.pcs.perpetualRents.web.delegates;

import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONStringer;
import org.springframework.stereotype.Component;

@Component
public class AjaxJSONDelegate {

	private static final Logger logger = Logger.getLogger(AjaxJSONDelegate.class.getName());
	
	public void setResponse(final JSONArray jarray, final HttpServletResponse res) {
		try {
			Writer w = new OutputStreamWriter(res.getOutputStream(), "utf-8");
			if(jarray != null)
				w.write(jarray.toString());
			w.close();
		} catch (Exception ex) {
			logger.log(Level.INFO, "JSONAray :" + ex.getMessage());
		}
	}

	public void setResponse(final JSONStringer jsonStringer, final HttpServletResponse res) {
		try {
			Writer w = new OutputStreamWriter(res.getOutputStream(), "utf-8");
			if(jsonStringer != null)
				w.write(jsonStringer.toString());
			w.close();
		} catch (Exception ex) {
			logger.log(Level.INFO, "JSONStringer :" + ex.getMessage());
		}
	}

	public void setResponse(final JSONObject obj, final HttpServletResponse res) {
		try {
			Writer w = new OutputStreamWriter(res.getOutputStream(), "utf-8");
			if(obj != null)
				w.write(obj.toString());
			w.close();
		} catch (Exception ex) {
			logger.log(Level.INFO, "JSONObject :" + ex.getMessage());
		}
	}
}
