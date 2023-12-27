package com.demo.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.demo.model.Employee;
import com.demo.model.Leaves;
@Service
public class EmailService {
	@Autowired
	JavaMailSender mailSender;
	
	public void sendEmail(String name,String password,String toEmail) {
		
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Congratulations !!!! \nYour UserID Password is :\n"+"Username : "+name+"\nPassword : "+password;
		message.setFrom("prathamvora987@gmail.com");
		message.setTo(toEmail);
		message.setText(emailbody);
		message.setSubject("Your Account Details");
		System.out.println(name);
		System.out.println(password);
		System.out.println(toEmail);
		System.out.println(emailbody);
		System.out.println(message);
		mailSender.send(message);
		System.out.println("Mail Sent");
		}
	
	 public void acceptEmail(String toEmail ,Leaves leave ) {
			
			SimpleMailMessage message =new SimpleMailMessage();
			String emailbody="Dear Employee your leave request has been approved from "+ leave.getStartDate()+" to " + leave.getEndDate(); 
			message.setFrom("prathamvora987@gmail.com");
			message.setTo(toEmail);
			message.setText(emailbody);
			message.setSubject("Leave Approved");
			System.out.println(toEmail);
			System.out.println(emailbody);
			System.out.println(message);
			mailSender.send(message);
			System.out.println("Mail Sent");
			}



public void rejectEmail(String toEmail,Leaves leave) {
	
	SimpleMailMessage message =new SimpleMailMessage();
	String emailbody="Dear Employee your leave request has been rejected from "+ leave.getStartDate()+" to "+ leave.getEndDate();
	message.setFrom("prathamvora987@gmail.com");
	message.setTo(toEmail);
	message.setText(emailbody);
	message.setSubject("Leave Rejected");
	System.out.println(toEmail);
	System.out.println(emailbody);
	System.out.println(message);
	mailSender.send(message);
	System.out.println("Mail Sent");
	}

		public void applyLeave(String toEmail,Leaves leave,Employee employee) {
	
	SimpleMailMessage message =new SimpleMailMessage();
	String emailbody=employee.getUsername()+" have applied for leave from "+leave.getStartDate() +" to " + leave.getEndDate();
	message.setFrom("prathamvora987@gmail.com");
	message.setTo(toEmail);
	message.setText(emailbody);
	message.setSubject("Leave Application");
	System.out.println(toEmail);
	System.out.println(emailbody);
	System.out.println(message);
	mailSender.send(message);
	System.out.println("Mail Sent");
	}
}

