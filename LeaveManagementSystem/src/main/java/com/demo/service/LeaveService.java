package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.demo.model.Admin;
import com.demo.model.Employee;
import com.demo.model.Holiday;
import com.demo.model.Leaves;
import com.demo.repositories.EmployeeRepository;
import com.demo.repositories.HolidayRepository;
import com.demo.repositories.LeavesRepository;
@Component
public class LeaveService {
		@Autowired
		EmployeeRepository erep;
		@Autowired
		LeavesRepository lrep;
		@Autowired
		HolidayRepository hrep;
	
	public Admin accept(Leaves leave) {
		int empid=leave.getEmpId();
		Employee employee= erep.findById(empid);
		int days=leave.getDays();
		String[] l = {"Sick Leave","Personal Leave","Casual Leave","Maternity Leave",
					"Paternity Leave","Marriage Leave","Adoption Leave"};
		String lt=leave.getLeaveType();
		if(lt.equals(l[0])) {
			employee.setSickLeave(employee.getSickLeave()-days);
		}else if(lt.equalsIgnoreCase(l[1])) {
			employee.setPersonalLeave(employee.getPersonalLeave()-days);
		}else if(lt.equals(l[2])) {
			employee.setCasualLeave(employee.getCasualLeave()-days);
		}else if(lt.equals(l[3])) {
			employee.setMarriageLeave(employee.getMaternityLeave()-days);
		}else if(lt.equals(l[4])) {
			employee.setPaternityLeave(employee.getPaternityLeave()-days);
		}else if(lt.equals(l[5])) {
			employee.setMarriageLeave(employee.getMarriageLeave()-days);
		}else if(lt.equals(l[6])) {
			employee.setAdoptionLeave(employee.getAdoptionLeave()-days);
		}
		erep.save(employee);
		Admin admin=employee.getAdmin();
		return admin;
	}
	
	public Admin reject(Leaves leave) {
		int empid=leave.getEmpId();
		Employee employee= erep.findById(empid);
		Admin admin=employee.getAdmin();
		return admin;
	}
	
	public Employee empAccept(Leaves leave) {
		Employee employee=erep.findById(leave.getEmpId());
		int days=leave.getDays();
		String[] l = {"Sick Leave","Personal Leave","Casual Leave","Maternity Leave",
					"Paternity Leave","Marriage Leave","Adoption Leave"};
		String lt=leave.getLeaveType();
		if(lt.equals(l[0])) {
			employee.setSickLeave(employee.getSickLeave()-days);
		}else if(lt.equalsIgnoreCase(l[1])) {
			employee.setPersonalLeave(employee.getPersonalLeave()-days);
		}else if(lt.equals(l[2])) {
			employee.setCasualLeave(employee.getCasualLeave()-days);
		}else if(lt.equals(l[3])) {
			employee.setMarriageLeave(employee.getMaternityLeave()-days);
		}else if(lt.equals(l[4])) {
			employee.setPaternityLeave(employee.getPaternityLeave()-days);
		}else if(lt.equals(l[5])) {
			employee.setMarriageLeave(employee.getMarriageLeave()-days);
		}else if(lt.equals(l[6])) {
			employee.setAdoptionLeave(employee.getAdoptionLeave()-days);
		}
		erep.save(employee);
		Employee manager=erep.findByNameAndManagerNameIsNull(employee.getManagerName());
		System.out.println(manager);
		return manager;
	}
	
	public Employee empReject(Leaves leave) {
		Employee employee=erep.findById(leave.getEmpId());
		Employee manager=erep.findByNameAndManagerNameIsNull(employee.getManagerName());
		return manager;
	}
	
	
	public boolean checkEmployeeLeaveDuplicate(Leaves leave) {
		List<Leaves> startDate=lrep.findByEmpIdAndStartDate(leave.getEmpId(), leave.getStartDate());
		List<Leaves> endDate=lrep.findByEmpIdAndEndDate(leave.getEmpId(), leave.getEndDate());
		List<Leaves> both=lrep.findByEmpIdAndStartDateAndEndDate(leave.getEmpId(), leave.getStartDate(), leave.getEndDate());
		if(startDate.isEmpty() && endDate.isEmpty() && both.isEmpty()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean checkHoliday(Leaves leave) {
		List<Holiday> holiday=hrep.findByFromDateOrToDate(leave.getStartDate(),leave.getEndDate());
		if(holiday.isEmpty()) {
			return true;
		}else {
			return false;
		}
		
	}
}
