package com.demo.service;

import org.springframework.stereotype.Component;

import com.demo.model.Admin;
import com.demo.model.Employee;

@Component
public class ResetPasswordService {

	
	public boolean adminPasswordCheck(Admin admin,String oldPassword) {
		if(admin.getPassword().equals(oldPassword)) {
			return true;
		}else {
			return false;
		}
		
	}
	public boolean employeePasswordCheck(Employee employee,String oldPassword) {
		if(employee.getPassword().equals(oldPassword)) {
			return true;
		}else {
			return false;
		}
		
	}
}
