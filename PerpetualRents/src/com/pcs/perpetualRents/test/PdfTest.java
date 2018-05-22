package com.pcs.perpetualRents.test;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.manager.PropertyDeveloperManager;


@SuppressWarnings("unused")
public class PdfTest implements Serializable {

	
private static final long serialVersionUID = 1L;
    
	@Autowired
    private PropertyDeveloperManager propertyDeveloperManager;
   
	private Document document =null;
	private PdfWriter pdfWriter = null;
	private Phrase phrase = null;
	private PdfPCell pageNumberCell =  null;
	
	private final int CENTER  		= Element.ALIGN_CENTER;
	private final int RIGHT   		= Element.ALIGN_RIGHT;
	private final int LEFT    		= Element.ALIGN_LEFT;
	private final int NOBORDER 		= PdfPCell.NO_BORDER;
	private final int BOTTOMBORDER 	= PdfPCell.BOTTOM;
	private final int TOPBORDER 	= PdfPCell.TOP;
	private final int LEFTBORDER 	= PdfPCell.LEFT;
	private final int RIGHTBORDER 	= PdfPCell.RIGHT;
	
	private Font fontSmall8 	= null;
	private Font fontMedium10 	= null;
	private Font fontMedium9 	= null;
	private Font fontBold12 	= null ;
	private Font fontBold18 	= null ;
    private Font font12 = null;
	
    private final int maxRecord = 14; // optimize maximum 
    private int lastPageNo 		=  0; 
    private int full  			=  0;
    private int rest  			=  0;
    private int recordIndex 	=  0;
    private int pageIndex		=  0; 
    private Image logoImage1 = null;
    private Image logoImage2 = null;
    private Image logoImage12 = null;
    private PDProperty pdPropertyObj;
    
		public byte[] createPDF(PDProperty obj){
			OutputStream out = new ByteArrayOutputStream();
			byte[] pdfArray =null;
			try{
				// this.createdOn = new SimpleDateFormat("dd/MM/yyyy").format(createdOn);
				document = new Document();
				
				pdfWriter =  PdfWriter.getInstance(document, out);
				
				Rectangle rect = new Rectangle(36, 54, 559, 788);
				pdfWriter.setBoxSize("art", rect);
	            rect.setBorder(Rectangle.BOX);
	            rect.setBorderWidth(1.5f);
	            
	            fontSmall8   = FontFactory.getFont("Times-Roman",8);
	            font12 = FontFactory.getFont("Times-Roman",10);
	            fontMedium9  = FontFactory.getFont("Times-Roman",9);
	            fontBold12   = FontFactory.getFont("Times-Roman", 12, Font.BOLD);
	            font12 = FontFactory.getFont("Times-Roman", 12);
	            fontBold18 =  FontFactory.getFont("Times-Roman", 18, Font.BOLD);
	            
	            System.out.println("*********");
	      
	         //   logoImage2 = Image.getInstance("WebContent/resource/images/pdfImg2.png");
	            //logoImage12 = Image.getInstance("WebContent/resource/images/imglogo.png");
	  //          String imageUrl = "WebContent/resource/images/pdfImg2.png";

	            document.open();
	            document.add(headerCreation());
	            
//	            PdfContentByte canvas = pdfWriter.getDirectContent();
//	            Image img = logoImage12;
//	            img.scaleToFit(1000, 60);
//	            img.setAbsolutePosition(document.getPageSize().getWidth() -  img.getScaledWidth(), document.getPageSize().getHeight() -  img.getScaledHeight());
	        //  canvas.addImage(img);
	           document.add(bodyCreation(obj));
//	            
//	            Image image = Image.getInstance("WebContent/resource/images/logo1.png");
//	            image.setAbsolutePosition(350f, 570f);
//	            document.add(image);
	            
	       //     document.add(footerCreation());
	            int count = document.getPageNumber();
	            System.out.println("count :: " +count);
	            document.setPageCount(5);
	            System.out.println("count :: " +document.getPageNumber());
	            document.close();
	            
	            ByteArrayOutputStream bOut = (ByteArrayOutputStream) out;
	            pdfArray = bOut.toByteArray();
	          
	           
	           PdfReader reader = new PdfReader(bOut.toByteArray());
	           PdfStamper stamper = new PdfStamper(reader, new FileOutputStream("/home/tarun/aaa.pdf"));
	           int n = reader.getNumberOfPages();
	           System.out.println("total no of pages;;;;; :: "+n);
	           for (int i = 1; i <= n; i++) {
	        	   getFooterTable(i, n).writeSelectedRows( 0, -1, 34, 200, stamper.getOverContent(i));
	           }
               stamper.close();
	           reader.close();
	           out.close();	
			}catch (Exception e) {
				pdfArray = null;
				e.printStackTrace();			
			}
			return pdfArray;
		}
	
		public  PdfPTable getFooterTable(int x, int y) throws Exception {
			 PdfPTable table = new PdfPTable(1);
		      float[] columnWidth = {100};
		      table.setWidthPercentage(columnWidth, new Rectangle(0, 0, 100, 100));
		      table.setWidthPercentage(100);  
		        
		      table.setSpacingBefore(2.5f);table.setSpacingAfter(1f);
			PdfPCell cell ;
	        table.setTotalWidth(527);
	   /*   table.setLockedWidth(true);
	        table.getDefaultCell().setFixedHeight(60);*/
	        
	        cell = new PdfPCell(new Phrase(String.format("Page %d of %d", x, y), fontSmall8));
	        cell.setBorder(BOTTOMBORDER);
	        cell.setHorizontalAlignment(RIGHT);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Company number 07152564 and with our registered office Unit 2 Craftsmans works, Sneyd Street,",fontMedium9));
       	    cell.setBorder(NOBORDER);
	        cell.setVerticalAlignment(CENTER);
	        cell.setHorizontalAlignment(CENTER);
	      
	        table.addCell(cell);	
	       
	        //////////////////////////////////////////
	        cell = new PdfPCell(new Phrase ("Sneyd Green, Stoke-on-Trent, ST6 2NZ.© 2014",fontMedium9));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);
	        cell.setBorder(NOBORDER);
	        table.addCell(cell);
	        
	        return table;
	    }
		
		private  PdfPTable headerCreation() throws Exception 
		{
	        PdfPTable table = new PdfPTable(3);
	        float[] columnWidth = {40,20,40};
	        table.setWidthPercentage(columnWidth, new Rectangle(0, 0, 100, 100));
	        PdfPCell cell;
	        table.setWidthPercentage(100);
	        
	        cell = new PdfPCell();  
	        cell.setColspan(1);	
	        cell.setRowspan(1);
	        cell.setBorder(NOBORDER);
	        cell.setHorizontalAlignment(LEFT);
	        table.addCell(cell);
	        
	        cell = new PdfPCell();  //logoImage = Image.getInstance
	        cell.setColspan(1);	
	        cell.setRowspan(1);
	        cell.setBorder(NOBORDER);
	        cell.setHorizontalAlignment(LEFT);
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setColspan(1);	
	        cell.setRowspan(1);
	        cell.setHorizontalAlignment(LEFT);
	        cell.setBorder(NOBORDER);
	        table.addCell(cell);
	        
	        Paragraph preface = new Paragraph();
		        preface.add(new Paragraph("Proposed Development Application Form", fontBold18));
	        cell = new PdfPCell(preface);
	        cell.setColspan(1);	
	        cell.setRowspan(3);
	        cell.setTop(20f);
	   //   cell.setBottom(50f);
	        cell.setHorizontalAlignment(CENTER);
	        cell.setBorder(NOBORDER);
	        cell.setLeading(30f, 2f);
	        cell.setPaddingBottom(20f);
	        table.addCell(cell);
	        
	        return table;
		}
		
		private PdfPTable bodyCreation(PDProperty obj) throws Exception{
			
			this.pdPropertyObj = obj;
			
			PdfPTable table = new PdfPTable(3);
	        float[] columnWidth = {10,50,40};
	        table.setWidthPercentage(columnWidth, new Rectangle(0, 0, 100, 100));
	        PdfPCell cell;
	        table.setWidthPercentage(90);
	        
	        cell = new PdfPCell();
	        cell.setColspan(3);	
	        cell.setRowspan(3);
	        cell.setBorder(LEFTBORDER | RIGHTBORDER | TOPBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setColspan(3);	
	        cell.setRowspan(3);
	        cell.setBorder(LEFTBORDER | RIGHTBORDER | TOPBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Paragraph("Please complete 1 form per proposed site", fontBold18));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(3);		        
	        cell.setBorder(LEFTBORDER | RIGHTBORDER | TOPBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(3);		        
	        cell.setBorder(LEFTBORDER | RIGHTBORDER | TOPBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(3);		        
	        cell.setBorder(NOBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Paragraph("Please see ADPL 1 and ADPL 2  these are to  be read in conjunction with this form"));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(3);		        
	        cell.setBorder(LEFTBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(3);		        
	        cell.setBorder(BOTTOMBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin------------------*/
	        cell = new PdfPCell(new Phrase("1",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Name of applicant:",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(obj.getCompanyName(),font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("2",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Contact number: ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(obj.getIsJointVenture(),font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("3",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("If this is a Joint venture what are the names of the other partners?",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(obj.getNameOfOtherPartners(),font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("4",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Do we have your permission to carry out and relevant security and financial check if deemed necessary? ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  4",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("5",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Emergency contact number: ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  5",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("6",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Email address/s",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  6",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("7",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Company name to be used if any and is it a Limited company: ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  7",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------data begin--------*/
	        cell = new PdfPCell(new Phrase("8",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Has an NDA been completed and returned?  Yes / No, if not do not proceed with this application until one has been completed and returned.",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  8",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("9",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(" Date NDA was complete: ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  9",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("10",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Expected rental level PCM per flat or in the case of an HMO per room PCM,",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("£ "+"A10",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("11",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Type of accommodation: Studio flat, one bedroom flat ? ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(" A 11",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("12",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);			        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("In the Case of an HMO what deductions do you make for bills?",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(" A 12",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("13",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Number of units ie flats per this address",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(" A 13",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("15",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Will each unit have its own metering supply ? please elaborate",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase(" A 15",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("16",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Rateable Value?",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("£ "+"A16",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("17",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Water rates Value?",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("£ "+"A17",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("18",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Number of studio flats per this address ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  18",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("19",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Site address with post code",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  19",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("20",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Complete the relevant section",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  20",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Is this a refurbishment project? And if so will the following be replaced? ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        /* -----------------------------Blank--------*/
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Windows UPVC  lockable, conforming to building regulations?",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("D1",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | RIGHTBORDER);
	        table.addCell(cell);
	     /*---------sub-------------*/   
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("UPVC external doors with multipoint locking mechanism",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);      
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	     /*---------sub-------------*/  
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Solid wood internal doors (front doors fire rated to building regulations standard)",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        /*---------sub-------------*/          
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Kitchen facilities - modern cupboards, integrated electric oven, hood and hob",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        /*---------sub-------------*/        
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Toilet facilities - White goods (Toilet, shower, basin, chrome taps, etc) Vinyl flooring.",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        /*---------sub-------------*/     
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Painted/varnished woodwork/joinery",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        /*---------sub-------------*/       
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Walls in contemporary colours, painted/wallpapered.",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        /*---------sub-------------*/     
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Carpeted throughout",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        
	        /*---------sub-------------*/     
	        cell = new PdfPCell(new Phrase("* ",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Outdoor communal space will be pointed, painted and tidied.",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER );
	        table.addCell(cell);
	        
	        cell = new PdfPCell();
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	
	        cell.setBorder(LEFTBORDER |RIGHTBORDER);
	        table.addCell(cell);
	        
	   /* -------------------------------------------------------21--------*/
	        cell = new PdfPCell(new Phrase("21",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | TOPBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("What Sustainable features will there be?",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | TOPBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  21",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f); 
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER | TOPBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("22",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Expected EPC Rating after works are completed? ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  22",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("23",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Or new build? "+
	        							"Please provide details of the building specification"+
	        							"Word document or pdf",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("A 23",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("24",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Estimated scheme Start Date :",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("A 24",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("25",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Estimated Scheme completion date: ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  25",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("26",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Estimated handover date: ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  26",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        /* -----------------------------data begin--------*/
	        cell = new PdfPCell(new Phrase("27",font12));
	        cell.setHorizontalAlignment(CENTER);
	        cell.setColspan(1);		        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Buildings insurance policy number and start date?  ",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);	        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("  27",font12));
	        cell.setHorizontalAlignment(LEFT);
	        cell.setColspan(1);		
	        cell.setLeading(5f, 1f);
	        cell.setPaddingBottom(5f);        
	        cell.setBorder(LEFTBORDER | BOTTOMBORDER | RIGHTBORDER);
	        table.addCell(cell);
	        
	        return table;
		}
		
		/*public PdfPTable footerCreation() throws Exception {
			
	        PdfPCell cell;
	        
	        PdfPTable table1 = new PdfPTable(1);
	        float[] columnWidth1 = {80};
	        table1.setWidthPercentage(columnWidth1, new Rectangle(0, 0, 100, 100));
	        table1.setWidthPercentage(100);  
	        
	        	table1.setSpacingBefore(2.5f);
	        			
		        cell = new PdfPCell(phrase);
		        cell.setHorizontalAlignment(LEFT);
		        cell.setColspan(1);
		        cell.setBorder(NOBORDER);
		        table1.addCell(cell);
	        	
	        	cell = new PdfPCell(new Phrase("Company number 07152564 and with our registered office Unit 2 Craftsmans works, Sneyd Street,",fontMedium9));
	        	 cell.setBorder(NOBORDER);
		        cell.setVerticalAlignment(CENTER);
		        cell.setHorizontalAlignment(CENTER);
		      //  cell.setPadding(30f);
		        cell.setColspan(1);
		        cell.setRowspan(1);
		        table1.addCell(cell);	
		        
		        //////////////////////////////////////////
		        
		        cell = new PdfPCell(phrase);
		        cell.setHorizontalAlignment(LEFT);
		        cell.setColspan(1);
		        cell.setBorder(NOBORDER);
		        table1.addCell(cell);
		        
		        //////////////////////////////////////////
		        cell = new PdfPCell(new Phrase ("Sneyd Green, Stoke-on-Trent, ST6 2NZ.© 2014",fontMedium9));
		        cell.setHorizontalAlignment(CENTER);
		        cell.setColspan(1);
		        cell.setBorder(NOBORDER);
		        table1.addCell(cell);
		        
		        return table1 ;
		        
		   //     document.add(table1);
	    } */
	
	//@SuppressWarnings("resource")
	public static void main(String[] args) {
		 PDProperty pdPropertyObj = new PDProperty();
		/*ApplicationContext apContext = new ClassPathXmlApplicationContext(ctxPath);
		ApplicationSettings applicationSettings = (ApplicationSettings)apContext.getBean("applicationSettings");*/
		/*pdPropertyObj = propertyDeveloperManager.loadPDPropertyById(39);*/
		pdPropertyObj.setId(40l);
		pdPropertyObj.setContactPerson("Arvind Jha");
		pdPropertyObj.setPropertyDeveloperId(29l);
		pdPropertyObj.setIsJointVenture("NOi..");
		pdPropertyObj.setPermissionToCarryOut("");
		pdPropertyObj.setNameOfOtherPartners("permissionToCarryOut");
		pdPropertyObj.setCompanyName("companyName");
		pdPropertyObj.setNdaStatus("ndaStatus");
		pdPropertyObj.setExpectedRentalLevel("expectedRentalLevel");
		pdPropertyObj.setAccommodationType("accommodationType");
		
		
	try {	
		File file = new File("/home/tarun/novoidsdoc.pdf");
		 
		if (!file.exists()) {
			file.createNewFile();
		} 
		FileOutputStream fos = new FileOutputStream(file);

		BufferedOutputStream bos = new BufferedOutputStream(fos);
		PdfTest obj = new PdfTest();
		byte[] pdfContent = obj.createPDF(pdPropertyObj);
		System.out.println(pdfContent.clone().length);
		bos.write(pdfContent);
		bos.flush();
		bos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}		

    
}
