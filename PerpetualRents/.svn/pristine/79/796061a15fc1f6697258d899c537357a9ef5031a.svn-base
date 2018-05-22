package com.pcs.perpetualRents.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class VivaSheet {

	public static void main(String[] args) throws IOException {
		File fileObj = new File("C:/Users/Perceptive/Desktop/linex/VIVA/linex-CD-CSV.csv");
		FileReader reader = new FileReader(fileObj);
		BufferedReader br = new BufferedReader(reader);
		String line = "";
		List<CostMatrix> list = new ArrayList<CostMatrix>();
		CostMatrix cObj = null;
		while((line = br.readLine()) != null){
			String str[] = line.split(",");
			String countryName = str[0].trim();
			String town = str[1].trim();
			Double firstHalfKg = Double.valueOf(str[2]);
			Double firstOneKg = Double.valueOf(str[3]);
			Double eachhalfKgUpto15Kg =  Double.valueOf(str[4]);
			Double eachhalfKg15_25Kg =  Double.valueOf(str[5]);
			Double eachhalfKgMoreThan25Kg =  Double.valueOf(str[6]);
			int i = 1;
			while(i <= 5){
				Double baseCost = 0.0;
				if("".equalsIgnoreCase(str[1])){
					str[1] = "*";
				}
				if(i == 1){
					baseCost = firstHalfKg;
					cObj = new CostMatrix(countryName, town, ""+0, ""+0.5, firstHalfKg, ""+-1, ""+-1);
				}else if(i == 2){
					baseCost = firstOneKg;
					cObj = new CostMatrix(countryName, town, ""+0.5, ""+1, firstOneKg , ""+-1, ""+-1);
				}else if(i == 3){
					 baseCost = firstOneKg;
					cObj = new CostMatrix(countryName, town, ""+1, ""+15, baseCost, ""+0.5, eachhalfKgUpto15Kg.toString());
				}else if(i == 4){
					 baseCost = firstOneKg + (28*eachhalfKgUpto15Kg);
					cObj = new CostMatrix(countryName, town, ""+15, ""+25, baseCost , ""+0.5, eachhalfKg15_25Kg.toString());
				}else if(i == 5){
					 baseCost = firstOneKg + (28*eachhalfKgUpto15Kg) + (20*eachhalfKg15_25Kg);
					cObj = new CostMatrix(countryName, town, ""+25, ""+300, baseCost , ""+0.5, eachhalfKgMoreThan25Kg.toString());
				}
				
				if(str[7].contains("n")){
					cObj.setNonDocBaseCost(-1.00);
				}else{
					Double nonDocBaseCost = baseCost + Double.parseDouble(str[7]);
					cObj.setNonDocBaseCost(nonDocBaseCost);
				}
				//cObj.setTransitdays(str[7]);
				System.out.println(cObj.toString());
				list.add(cObj);
				i++;
			}
		}
			File f1 = new File("C:/Users/Perceptive/Desktop/linex/VIVA/VIVACalculated.csv");
			PrintWriter p = new PrintWriter(f1);
			
			for (CostMatrix obj: list) {
				String str1 = "";
				str1 += obj.getCountryName() + ",";
				str1 += obj.getCity() + ",";
				str1 += obj.getStartValue() + ",";
				str1 += obj.getEndValue() + ",";
				str1 += obj.getBaseCost() + ",";
				str1 += obj.getCostUnit() + ",";
				str1 += obj.getCostFactor() + ",";
				str1 += obj.getNonDocBaseCost() + ",";
				//str1 += obj.getTransitdays();
				p.println(str1);
			}
			br.close();
			p.flush();
			p.close();
			System.out.println("Please check your file...");
	}
	
	

}
