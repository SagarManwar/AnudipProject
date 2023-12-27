package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Employee;
import com.demo.model.Holiday;
import com.demo.model.Leaves;
import com.demo.model.Project;
import com.demo.repositories.EmployeeRepository;
import com.demo.repositories.HolidayRepository;
import com.demo.repositories.LeavesRepository;
import com.demo.repositories.ProjectRepository;
@Controller
public class EmployeeRedirectController {
		@Autowired
		EmployeeRepository erep;
		@Autowired
		LeavesRepository lrep;
		@Autowired
		ProjectRepository prep;
		@Autowired
		HolidayRepository hrep;
	
	@RequestMapping("/EmployeeDashboard")
	public ModelAndView employeeDashboard(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
		Employee employee=erep.findById(id);
		mv.setViewName("EmployeeDashboard");
		mv.addObject("employee", employee);
		return mv;
	}
	@RequestMapping("/EmployeeApplyLeave")
	public ModelAndView EmployeeApplyLeave(@RequestParam("id") int id) {
		System.out.println("Employee apply leave");
		ModelAndView mv=new ModelAndView();
		Employee employee=erep.findById(id);
		mv.setViewName("EmployeeApplyLeave");
		mv.addObject("employee", employee);
		return mv;
	}
	@RequestMapping("/EmployeeLeaveTracker")
	public ModelAndView EmployeeLeaveTracker(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
		Employee employee=erep.findById(id);
		List<Leaves> leaves=lrep.findByEmpId(id);
		mv.addObject("leaves", leaves);
		mv.setViewName("EmployeeLeaveTracker");
		mv.addObject("employee", employee);
		return mv;
	}
	@RequestMapping("/EmployeeViewProject")
	public ModelAndView EmployeeViewProject(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
		Employee employee=erep.findById(id);
		List<Project> projects=prep.findByManagerName(employee.getManagerName());
		mv.addObject("project", projects);
		mv.setViewName("EmployeeViewProject");
		mv.addObject("employee", employee);
		return mv;
	}
	@RequestMapping("/EmployeeViewHoliday")
	public ModelAndView managerViewHoliday(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
		Employee employee=erep.findById(id);
		List<Holiday> holiday=hrep.findAll();
		mv.addObject("holiday", holiday);
		mv.setViewName("EmployeeViewHoliday");
		mv.addObject("employee", employee);
		return mv;
	}
}
