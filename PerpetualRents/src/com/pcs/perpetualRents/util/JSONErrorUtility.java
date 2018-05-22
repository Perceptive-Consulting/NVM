package com.pcs.perpetualRents.util;

import java.util.Set;

import javax.validation.ConstraintViolation;

import org.json.JSONArray;
import org.json.JSONObject;

public class JSONErrorUtility<T> {

	private T obj;
	public JSONErrorUtility(){
		
	}
	public T getErrorJson(Set<ConstraintViolation<T>> errorObjSet) throws Exception{
	
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObjectErrorData =  null;
		
		for(ConstraintViolation<T> objCV : errorObjSet){
			jsonObjectErrorData =  new JSONObject();
			jsonObjectErrorData.put(objCV.getPropertyPath().toString(),objCV.getMessage());
			jsonArray.put(jsonObjectErrorData);
		}
		
		return obj;
	}
}
