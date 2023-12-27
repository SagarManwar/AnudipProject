package com.demo.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.demo.model.Employee;
import com.demo.model.Holiday;
import com.demo.repositories.EmployeeRepository;
import com.demo.repositories.HolidayRepository;

@Component
public class AdminService {
	@Autowired
	EmployeeRepository erep;
	@Autowired
	HolidayRepository hrep;
	public Employee add(Employee employee) {
		
		employee.setAdoptionLeave(30);
		employee.setCasualLeave(15);
		employee.setMarriageLeave(15);
		employee.setMaternityLeave(180);
		employee.setPaternityLeave(30);
		employee.setPersonalLeave(15);
		employee.setSickLeave(15);
		employee.setStatus("Active");
		
	erep.save(employee);
		
		
		Employee emp=erep.findById(erep.findByMaxId());
		String name=emp.getName();
		
		int id=emp.getId();
		emp.setUsername(name+id);
		Random random =new Random();
		int num =random.nextInt(1000);
		emp.setPassword(name+num);
		
		return emp;
		
	}
	
	public boolean checkDuplicate(Employee employee) {
		List<Employee> duplicate=erep.findByEmail(employee.getEmail());
		System.out.println(duplicate);
		if(duplicate.isEmpty()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean checkDuplicateHoliday(Holiday holiday) {
		List<Holiday> start = hrep.findByFromDate(holiday.getFromDate());
		List<Holiday> end = hrep.findByToDate(holiday.getToDate());
		List<Holiday> both = hrep.findByFromDateAndToDate(holiday.getFromDate(), holiday.getToDate());
		if(start.isEmpty() && end.isEmpty() && both.isEmpty()) {
			return false;
			
		}else {
			return true;
		}
 	}
}
