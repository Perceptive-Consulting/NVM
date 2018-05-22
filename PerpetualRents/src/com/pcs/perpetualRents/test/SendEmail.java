package com.pcs.perpetualRents.test;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail{
	
   public static void main(String [] args) throws UnsupportedEncodingException {
	   final String username = "chintandhingra3@gmail.com";
		final String password = "good@commitment";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {
			System.out.println("sending mail...");
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("abc@gmail.com", "my company"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("perpetual.rents@gmail.com"));
			message.setSubject("Testing Subject");
			message.setText("I am testing something please support,"
				+ "\n\n No spam to my email, please!");

			message.setHeader("DATA-HEADER", "workroom-1234567989");
			
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
   }
}