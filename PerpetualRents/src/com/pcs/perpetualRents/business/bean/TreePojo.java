package com.pcs.perpetualRents.business.bean;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TreePojo {
	
	private Long id;
	private String text;
	private boolean hasChildren;
	private List<TreePojo> children;
	
	public TreePojo(Long id, String text, boolean hasChildren){
		this.id = id;
		this.text = text;
		this.hasChildren = hasChildren;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public boolean isHasChildren() {
		return hasChildren;
	}
	public void setHasChildren(boolean hasChildren) {
		this.hasChildren = hasChildren;
	}
	public List<TreePojo> getChildren() {
		return children;
	}
	public void setChildren(List<TreePojo> children) {
		this.children = children;
	}
	
	public JSONObject toJSON() throws JSONException{
		
		  JSONObject jObj = new JSONObject();
				jObj.put("id", this.id);
				jObj.put("text", this.text);
				
				JSONObject _jObj = null;
				JSONArray jArray = new  JSONArray();
				if(this.children != null){
					for (TreePojo treePojo : children) {
						_jObj = new JSONObject();
							_jObj.put("id", treePojo.getId());
							_jObj.put("text", treePojo.getText());
							_jObj.put("children",treePojo.isHasChildren());
						jArray.put(_jObj);
					}
					jObj.put("children", jArray);
				}else{
					jObj.put("children", this.hasChildren);
				}
			
			return jObj;
	}
}	
