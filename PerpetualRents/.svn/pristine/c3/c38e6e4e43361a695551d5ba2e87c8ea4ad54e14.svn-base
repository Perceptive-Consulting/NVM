package com.pcs.perpetualRents.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class LinexSheet {

	public static void main(String[] args) throws IOException {
		File fileObj = new File("C:/Users/Perceptive/Desktop/linex/New folder/linex-arvindcsv.csv");
		FileReader reader = new FileReader(fileObj);
		BufferedReader br = new BufferedReader(reader);
		String line = "";
		List<CostMatrix> list = new ArrayList<CostMatrix>();
		CostMatrix cObj = null;
		while((line = br.readLine()) != null){
			String str[] = line.split(",");
			Double firstHalfKg = Double.valueOf(str[2]);
			Double addHalfKg = Double.valueOf(str[3]);
			Double plus10Kg = Double.valueOf(str[4]);
			Double plus20Kg = Double.valueOf(str[5]);
			int i = 1;
			while(i <= 4){
				Double baseCost = 0.0;
				if("".equalsIgnoreCase(str[1])){
					str[1] = "*";
				}
				if(i == 1){
					baseCost = firstHalfKg;
					cObj = new CostMatrix(str[0], str[1], ""+0, ""+0.5, firstHalfKg, ""+-1, ""+-1);
				}else if(i == 2){
					baseCost = firstHalfKg;
					cObj = new CostMatrix(str[0], str[1], ""+0.5, ""+10, firstHalfKg , ""+0.5, addHalfKg.toString());
				}else if(i == 3){
					 baseCost = firstHalfKg + (19*addHalfKg);
					cObj = new CostMatrix(str[0], str[1], ""+10, ""+20, baseCost, ""+1, plus10Kg.toString());
				}else if(i == 4){
					 baseCost = firstHalfKg + (19*addHalfKg) + (10*plus10Kg);
					cObj = new CostMatrix(str[0], str[1], ""+20, ""+300, baseCost , ""+1, plus20Kg.toString());
				}
				if(str[6].contains("n")){
					cObj.setNonDocBaseCost(-1.00);
				}else{
					Double nonDocBaseCost = baseCost + Double.parseDouble(str[6]);
					cObj.setNonDocBaseCost(nonDocBaseCost);
				}
				cObj.setTransitdays(str[7]);
				System.out.println(cObj.toString());
				list.add(cObj);
				i++;
			}
		}
			File f1 = new File("C:/Users/Perceptive/Desktop/linex/New folder/LinexCalculated.csv");
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
				str1 += obj.getTransitdays();
				p.println(str1);
			}
			br.close();
			p.flush();
			p.close();
			System.out.println("Please check your file...");
	}
	
	

}
