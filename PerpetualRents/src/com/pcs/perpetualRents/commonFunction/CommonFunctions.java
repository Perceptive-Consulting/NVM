package com.pcs.perpetualRents.commonFunction;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.logging.Logger;

import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;

public class CommonFunctions {
	
	private static Logger logger = ApplicationSettings.getLogger(CommonFunctions.class.getName()); 
	
	/*public String saveAdminFile(applicationSettings.getFolderPath(), applicationSettings.getFolderName(), fileObj){
		
	}*/
	
	public static String savePropertyFile(String path, String folderName, File file){
		try{
			java.io.File fileObj = new java.io.File(path);
			fileObj.mkdir();
			if(fileObj.exists()){
				Calendar calender = Calendar.getInstance();
				int year = calender.get(Calendar.YEAR);
				String month = getMonthName(calender.get(Calendar.MONTH));
				String tPath = java.io.File.separator + year + java.io.File.separator + month;
				java.io.File tFile = null;
				if(file.getPropertyReference() != null){
					tFile = new java.io.File(path + tPath + java.io.File.separator + file.getPropertyReference() + java.io.File.separator );
				}else{
					tFile = new java.io.File(path + tPath + java.io.File.separator + "CommonFolder" + java.io.File.separator );
				}
				
				tFile.mkdirs();
				if(tFile.exists()){
					String tfileName= getUniqueName() + "-" + validateFileName(file.getFileName());
					FileOutputStream fOut = new FileOutputStream(tFile + java.io.File.separator + tfileName);
					fOut.write(file.getFileData());
					fOut.flush();
					fOut.close();
					String absPath = tFile.getAbsolutePath() + java.io.File.separator + tfileName;
					//System.out.println(absPath);
					int index = absPath.indexOf(folderName);
					absPath = absPath.substring(index);
					return absPath;
				}
			}else{
				logger.severe("Path doesnot exists.");
			}
		}catch (Exception e) {}
		return null;
	}
	
	public static String saveAdminFile(String path, String folderName, File file){

		try{
			java.io.File fileObj = new java.io.File(path);
			fileObj.mkdir();
			if(fileObj.exists()){
				java.io.File tFile = new java.io.File(path + java.io.File.separator);
				tFile.mkdirs();
				if(tFile.exists()){
					String tfileName= validateFileName(file.getFileName());
					FileOutputStream fOut = new FileOutputStream(tFile + java.io.File.separator + tfileName);
					fOut.write(file.getFileData());
					fOut.flush();
					fOut.close();
					String absPath = tFile.getAbsolutePath() + java.io.File.separator + tfileName;
					//System.out.println(absPath);
					int index = absPath.indexOf(folderName);
					absPath = absPath.substring(index);
					return absPath;
				}
			}else{
				logger.severe("Path doesnot exists.");
			}
		}catch (Exception e) {}
		return null;
	
	}
	
	public static void loadfile(File file){
		try{
			java.io.File tfileObj = new java.io.File(file.getFilePath());
			if(tfileObj.canRead()){
				FileInputStream fis = new FileInputStream(tfileObj);
				byte[] buffer = new byte[fis.available()];
				fis.read(buffer);
				file.setFileData(buffer);
				fis.close();
			}
		}catch (Exception e) {e.printStackTrace();}
	}
	
	public static boolean deleteFile(File file){
		try{
			java.io.File fileObj = new java.io.File(file.getFilePath());
			if(fileObj.canRead())
				return fileObj.delete();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean isInteger(String value){
		try{
			Integer.parseInt(value);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	public static String getStaggingDirectory() {
		return System.getProperty("java.io.tmpdir");
	}
	
	private static String getMonthName(int month){
			String[] monthName = {"January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"};
		return monthName[month];
	}
	
	private static String validateFileName(String fileName){
		if(fileName != null && fileName.length() != 0){
			fileName = fileName.replace("'", "");
			return fileName;
		}
		return null;
	}
	
	private static String getUniqueName(){
		Calendar calender = Calendar.getInstance();
		int month = calender.get(Calendar.MONTH);
		int day = calender.get(Calendar.DAY_OF_MONTH);
		int hour = calender.get(Calendar.HOUR_OF_DAY);
		int minute = calender.get(Calendar.MINUTE);
		int second = calender.get(Calendar.MILLISECOND);
		String delim = "-";
		String tStr = "" + month + delim + day + delim + hour + delim + minute + delim + second; 
		return tStr;
	}

	public static boolean isLong(Object value) {
		try{
			Long.parseLong("" + value);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
}
