package com.pcs.perpetualRents.test;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Role;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;

public class TestStub {
	
	public static final String VARCHAR = "VARCHAR(255)";
	public static final String INT = "INT(11)";
	public static final String BOOLEAN = "BIT(1)";
	public static final String TIMESTAMP = "TIMESTAMP";
	
	public static void main(String[] args) {
		System.out.println(getFieldDescription(LandLord.class));
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String getFieldDescription(Class className){
		Map<String, String> map = new HashMap<String, String>();
		Class<LandLord> classObj = className;
		
		Class superClass = classObj.getSuperclass();
		if(superClass != null){
			Field[] superClassField = superClass.getDeclaredFields();
			for (Field field : superClassField) {
				if(!field.isAnnotationPresent(SQLTransient.class) && !Modifier.isStatic(field.getModifiers()))
				map.put(field.getName(), field.getType().getSimpleName());
			}
		}
		
		Field[] classField = classObj.getDeclaredFields();
			for (Field field : classField) {
				if(!field.isAnnotationPresent(SQLTransient.class) && !Modifier.isStatic(field.getModifiers()))
					map.put(field.getName(), field.getType().getSimpleName());
			}
			
		return getQuery(className, map);
		
	}
	
	@SuppressWarnings("rawtypes")
	public static String getQuery(Class className, Map<String, String> fieldMap){
		
		String sql = "CREATE TABLE " + getTableName(LandLord.class) + "( " 
					+ getColumnNameAndDef(LandLord.class, fieldMap ) + 
					"PRIMARY KEY (id) );";
		return sql;
	}
	
	@SuppressWarnings("rawtypes")
	public static String getColumnNameAndDef(Class className, Map<String, String> fieldMap){
		String query = "";
			if(className != null && fieldMap != null ){
				for(Entry<String, String> entrySet : fieldMap.entrySet()){
						if(entrySet.getValue().equalsIgnoreCase("String")){
							query += " " + entrySet.getKey() + " " + VARCHAR + ", \n";
						}else if(entrySet.getValue().equalsIgnoreCase("Integer")){
							query += " " + entrySet.getKey() + " " + INT + ", \n";
						}else if(entrySet.getValue().equalsIgnoreCase("Boolean")){
							query += " " + entrySet.getKey() + " " + BOOLEAN + ", \n";
						}else if(entrySet.getValue().equalsIgnoreCase("Long")){
							query += " " + entrySet.getKey() + " " + INT + ", \n";
						}else if(entrySet.getValue().equalsIgnoreCase("Date")){
							query += " " + entrySet.getKey() + " " + TIMESTAMP + ", \n";
						}
				}
			}
		
		return query;
	}
	
	@SuppressWarnings("rawtypes")
	public static String getTableName(Class className){
		String tableName = "";
		if(className.equals(UserLogin.class)){
			tableName = "users";
		}else if(className.equals(Role.class)){
			tableName = "authorities";
		}else{
			tableName = "tbl_" + ApplicationSettings.APP_NAME + "_" + className.getClass().getSimpleName().toLowerCase();
		}
		return tableName;
	}
	
	}
