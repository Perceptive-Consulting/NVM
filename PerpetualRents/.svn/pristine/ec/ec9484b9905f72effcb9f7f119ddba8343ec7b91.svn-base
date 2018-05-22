package com.pcs.perpetualRents.util;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.pcs.perpetualRents.business.bean.ADPL;
import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.QuestionGroup;
import com.pcs.perpetualRents.enm.ADPL2Page;
 
@Component
public class ADPLCreator {
	
    public static Font fontBold = new Font(FontFamily.TIMES_ROMAN, 15, Font.BOLD + Font.UNDERLINE, new BaseColor(22,22,22));
    
    public static Font font = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, new BaseColor(22,22,22));
    
    
    public byte[] generatePDF(Map<Long, List<ADPL>> questionsMap, Property tPropertyObj, Map<Long, QuestionGroup> groupQuestionDataMap, String logoPath){
    	try{
    		 ADPLCreator tAdplCreatorObj = new ADPLCreator();
    	    	Document document = new Document();
    	    	ByteArrayOutputStream bOut = new ByteArrayOutputStream();
    	    	 PdfWriter.getInstance(document, bOut);
    	    	
    	         document.open();
    	         document.add(logo(logoPath));
    	         document.add(tAdplCreatorObj.createPropertyDetails(tPropertyObj));
    	         document.newPage();
    	        
    	         List<ADPL2Page> lAdpl = ADPL2Page.list();
    	         if(lAdpl != null){
    	        	 for (ADPL2Page adpl2Page : lAdpl) {
					 String groupStr = adpl2Page.group();
					 if(groupStr.contains(",")){
							String[] groupIdStr = groupStr.split(",");
							QuestionGroup criteriaObj = groupQuestionDataMap.get(Long.valueOf(groupIdStr[0].trim()));
							//document.newPage();
							document.add(tAdplCreatorObj.createCriteria(criteriaObj.getCriteriaStr()));
							for (String _groupStr : groupIdStr) {
								Long groupId = Long.valueOf(_groupStr.trim());
								QuestionGroup tGroupObj = groupQuestionDataMap.get(groupId);
								document.add(tAdplCreatorObj.createQuestionGroup(tGroupObj.getGroupDetail()));
								List<ADPL> adplList = questionsMap.get(groupId);
								if(adplList != null){
									for (ADPL _adplObj : adplList) {
										document.add(tAdplCreatorObj.createQuestionsAnswers(_adplObj));
									}
								}
							}
						}else{
							QuestionGroup criteriaObj = groupQuestionDataMap.get(Long.valueOf(adpl2Page.group().trim()));
							document.newPage();
							document.add(tAdplCreatorObj.createCriteria(criteriaObj.getCriteriaStr()));
							Long groupId = Long.valueOf(adpl2Page.group().trim());
							QuestionGroup tGroupObj = groupQuestionDataMap.get(groupId);
							document.add(tAdplCreatorObj.createQuestionGroup(tGroupObj.getGroupDetail()));
							List<ADPL> adplList = questionsMap.get(groupId);
							if(adplList != null){
								for (ADPL _adplObj : adplList) {
									document.add(tAdplCreatorObj.createQuestionsAnswers(_adplObj));
								}
							}	
						}
					}
    	         }
    	         document.close();
    	         
    	         return bOut.toByteArray();
    	}catch (Exception e) {
			e.printStackTrace();
			return null;
		}       
    }
    
    public PdfPTable createPropertyDetails(Property propObj) throws DocumentException {
    	
    	Address tAddressObj = propObj.getAddressObj();
    	LandLord tLandlordObj = propObj.getLandLordObj();
    	
        PdfPTable tb = new PdfPTable(4);
        tb.setWidthPercentage(100);
        tb.setWidths(new float[]{2f,6f,8f, 2f});    
        skipCells(17, tb);
        publishCell("Property Details:", fontBold, tb);
        skipCells(7, tb);
        publishCell("     1. Address Line 1:", font, tb);
        publishCell(tAddressObj.getAddressLine1(), font, tb);
        skipCells(2, tb);
        publishCell("     2. Address Line 2:", font, tb);
        publishCell(tAddressObj.getAddressLine2(), font, tb);
        skipCells(2, tb);
        publishCell("     3. City:", font, tb);
        publishCell(tAddressObj.getCity(), font, tb);
        skipCells(2, tb);
        publishCell("     4. County:", font, tb);
        publishCell(tAddressObj.getCounty(), font, tb);
        skipCells(2, tb);
        publishCell("     5. Postcode:", font, tb);
        publishCell(tAddressObj.getPostCode(), font, tb); 
        skipCells(6, tb);
        publishCell("Owner's Details:", fontBold, tb);
        skipCells(7, tb);
        publishCell("     1. Owner's Name:", font, tb);
        publishCell(tLandlordObj.getFirstName() + " " + tLandlordObj.getLastName(), font, tb);
        skipCells(2, tb);
        publishCell("     2. Owner's Phone Number:", font, tb);
        publishCell(tLandlordObj.getPrimaryPhoneNumber(), font, tb);
        skipCells(2, tb);
        publishCell("     3. Owner's Email Address:", font, tb);
        publishCell(tLandlordObj.getPrimaryEmailId(), font, tb);
        skipCells(6, tb);
        publishCell("Agent's Details (If applicable):", fontBold, tb,2);
        skipCells(6, tb);
        publishCell("     1. Agent's Name:", font, tb);
        publishCell(propObj.getAgentName(), font, tb);
        skipCells(2, tb);
        publishCell("     2. Agent's Address:", font, tb);
        publishCell(propObj.getAgentAddressLine(), font, tb);
        skipCells(2, tb);
        publishCell("     3. Agent's Phone Number:", font, tb);
        publishCell(propObj.getAgentContactNumber(), font, tb);
        tb.setSpacingAfter(18);
    return tb;
    }
    
    public PdfPTable logo(String logoPath){
    	try{
        	Image image = Image.getInstance(logoPath);
        	PdfPTable tb = new PdfPTable(5);
        	tb.setWidthPercentage(100);
        	skipCells(2, tb);
        	PdfPCell cell = new PdfPCell();
        	cell.setImage(image);
        	cell_Look(cell, new float[]{2,2,2,2}, null, new BaseColor(22,22,22));
        	tb.addCell(cell);
        	skipCells(2, tb);
        	tb.setSpacingAfter(18);
        return tb;
    	}catch (Exception e) {
			e.printStackTrace();
			return new PdfPTable(2);
		}
    }
    
    public PdfPTable createQuestionsAnswers(ADPL tAdplObj) throws DocumentException {
    	
    	Font fontBold = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD, new BaseColor(12, 12, 12));
    	Font fontNormal = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, new BaseColor(12, 12, 12));
    	//Font fontNormalWhite = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, new BaseColor(120, 120, 120));
        PdfPTable tb = new PdfPTable(5);
        tb.setWidthPercentage(100);
        
        tb.setWidths(new float[]{1f,1.15f,0.2f,5f,1f});
        skipCells(1, tb);
            publishCell("Question", fontBold, tb);
            publishCell(":", fontBold, tb);
            publishCell(tAdplObj.getQuestions(), fontBold, tb);
            skipCells(2, tb);
            publishCell("     Response", fontNormal, tb);
            publishCell(":", fontNormal, tb);
            publishCell(tAdplObj.getResponse(), fontNormal, tb);
            skipCells(2, tb);
           if(tAdplObj.getComments() != null && tAdplObj.getComments().length() != 0){
        	   publishCell("     Comments", fontNormal, tb);
               publishCell(":", fontNormal, tb);
               publishCell(tAdplObj.getComments(), fontNormal, tb);
               skipCells(2, tb);
            }
            if(tAdplObj.getAttachments() != null && tAdplObj.getAttachments().length() != 0){
            	publishCell("    Attachments", fontNormal, tb);
                publishCell(":", fontNormal, tb);
                publishCell(tAdplObj.getAttachments(), fontNormal, tb);
            }
            skipCells(7, tb);
        tb.setSpacingAfter(18);
    return tb;
    }
    
    public PdfPTable createCriteria(String criteriaString) throws DocumentException {
    	Font fontBig = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, new BaseColor(255,255,255));
        PdfPTable tb = new PdfPTable(3);
        tb.setWidthPercentage(100);
        tb.setWidths(new float[]{1f, 6.6f,1f});
        skipCells(1, tb);
        publishCell(criteriaString, fontBig, tb, new BaseColor(227, 58, 12));
        skipCells(1, tb);
        tb.setSpacingAfter(10);
    return tb;
    }
    
    public PdfPTable createQuestionGroup(String questionGroupString) throws DocumentException {
    	if(!questionGroupString.equalsIgnoreCase("None")){
        	Font fontBig = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, new BaseColor(255, 255, 255));
            PdfPTable tb = new PdfPTable(3);
            tb.setWidthPercentage(100);
            tb.setWidths(new float[]{1f, 6.35f, 1f});
            skipCells(1, tb);
            publishCell(questionGroupString, fontBig, tb, new BaseColor(0,0,0));
            skipCells(1, tb);
            tb.setSpacingAfter(10);
        return tb;
    	}
    	return new PdfPTable(1);
    }
    
    public void addCell(PdfPTable tb, PdfPCell cell){
    	cell_Look(cell, new float[]{2,2,2,2}, null, new BaseColor(22,22,22));
    	tb.addCell(cell);
    }
    
	public PdfPCell cell_Look(PdfPCell cell, float[] padding, BaseColor color, BaseColor border){
    	if(padding==null){
    		cell.setPadding(0);
    	}
    	else{
	    	cell.setPaddingTop(padding[0]);
	    	cell.setPaddingBottom(padding[1]);
	    	cell.setPaddingLeft(padding[2]);
	    	cell.setPaddingRight(padding[3]);
    	}
    	cell.setBackgroundColor(color);
    	cell.setBorder(0);
    	return cell;
    }
	
	public void skipCells(int no, PdfPTable table){
		for(int i=0; i<no; i++){
			PdfPCell cell = new PdfPCell();
			cell.setPhrase(new Phrase("      ", font));
	        cell_Look(cell, new float[]{2,2,2,2}, null, new BaseColor(22,22,22));
	        cell.setHorizontalAlignment(0);
	        table.addCell(cell);
		}
	}
	
	public void publishCell(String phrase, Font font, PdfPTable tb){
		PdfPCell cell;
		cell = new PdfPCell();
        cell.setPhrase(new Phrase(phrase,font));
        cell_Look(cell, new float[]{2,2,2,2}, null, new BaseColor(22,22,22));
        cell.setHorizontalAlignment(0);
        tb.addCell(cell);
	}
	
	public void publishCell(String phrase, Font font, PdfPTable tb, int colSpan){
		PdfPCell cell;
		cell = new PdfPCell();
		cell.setColspan(2);
        cell.setPhrase(new Phrase(phrase,font));
        cell_Look(cell, new float[]{2,2,2,2}, null, new BaseColor(22,22,22));
        cell.setHorizontalAlignment(0);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        tb.addCell(cell);
	}
	
	public void publishCell(String phrase, Font font, PdfPTable tb, BaseColor color){
		PdfPCell cell;
		cell = new PdfPCell();
        cell.setPhrase(new Phrase(phrase,font));
        cell_Look(cell, new float[]{2,2,2,2}, color, new BaseColor(22,22,22));
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        tb.addCell(cell);
	}
}