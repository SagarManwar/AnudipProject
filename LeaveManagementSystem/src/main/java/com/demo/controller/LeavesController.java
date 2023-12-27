package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Admin;
import com.demo.model.Employee;
import com.demo.model.Leaves;
import com.demo.repositories.AdminRepository;
import com.demo.repositories.EmployeeRepository;
import com.demo.repositories.LeavesRepository;
import com.demo.service.EmailService;
import com.demo.service.LeaveService;

@Controller
public class LeavesController {
	@Autowired
	LeavesRepository lrep;
	@Autowired
	EmployeeRepository erep;
	@Autowired
	LeaveService ls;
	@Autowired 
	AdminRepository arep;
	@Autowired
	EmailService es;
	@RequestMapping("/applyLeave")
	public ModelAndView leaveApplication(Model model,Leaves leave) {
		System.out.println("Welcome to leave application");
		ModelAndView mv=new ModelAndView();
		boolean checkDuplicate=ls.checkEmployeeLeaveDuplicate(leave);
		boolean checkHoliday =ls.checkHoliday(leave);
		if(checkDuplicate==true && checkHoliday==true) {
			leave.setStatus("Pending");
			System.out.println(leave);
			lrep.save(leave);
		
			mv.setViewName("ManagerApplyLeave");
			Employee employee =erep.findById(leave.getEmpId());
			mv.addObject("employee", employee);
			Admin admin = arep.findById(employee.getAdmin().getId());
			es.applyLeave(admin.getEmail(), leave, employee);
			String success="Leave applied Successfully";
			mv.addObject("success", success);
			System.out.println(leave);
			return mv;
		}else if(checkDuplicate==true && checkHoliday==false) {
			mv.setViewName("ManagerApplyLeave");
			Employee employee =erep.findById(leave.getEmpId());
			mv.addObject("employee", employee);
			String duplicate="It's holiday";
			mv.addObject("duplicate", duplicate);
			return mv;
		}else {
			mv.setViewName("ManagerApplyLeave");
			Employee employee =erep.findById(leave.getEmpId());
			mv.addObject("employee", employee);
			String duplicate="Already applied for this leave";
			mv.addObject("duplicate", duplicate);
			return mv;
		}
	
		
	}
	
	@RequestMapping("/accept")
	public ModelAndView accept(@RequestParam("lid") int id) {
		System.out.println("Accept controller");
		ModelAndView mv=new ModelAndView();
		Leaves leave=lrep.findById(id);
		Employee employee=erep.findById(leave.getEmpId());
		leave.setStatus("Approved");
		lrep.save(leave);
		Admin admin= ls.accept(leave);
		es.acceptEmail(employee.getEmail(), leave);
		mv.setViewName("AdminManageLeave");
		mv.addObject("admin", admin);
		List<Leaves> leaves=lrep.findByEmpDesignationAndStatus("Manager","Pending");
		List<Leaves> rest=lrep.findByEmpDesignationAndStatusNot("Manager", "Pending");
		System.out.println(rest);
		mv.addObject("rest", rest);
		System.out.println(leaves);
		mv.addObject("leaves", leaves);
		return mv;
	}
	
	@RequestMapping("/reject")
	public ModelAndView reject(@RequestParam("lid") int id) {
		ModelAndView mv=new ModelAndView();
		Leaves leave=lrep.findById(id);
		leave.setStatus("Denied");
		lrep.save(leave);
		Admin admin= ls.reject(leave);
		Employee employee =erep.findById(leave.getEmpId());
		es.rejectEmail(employee.getEmail(), leave);
		mv.setViewName("AdminManageLeave");
		mv.addObject("admin", admin);
		List<Leaves> leaves=lrep.findByEmpDesignationAndStatus("Manager","Pending");
		List<Leaves> rest=lrep.findByEmpDesignationAndStatusNot("Manager", "Pending");
		System.out.println(rest);
		mv.addObject("rest", rest);
		System.out.println(leaves);
		mv.addObject("leaves", leaves);
		return mv;
	}
	
	@RequestMapping("/empApplyLeave")
	public ModelAndView empApplyLeave(Leaves leave) {
		ModelAndView mv=new ModelAndView();
		boolean checkDuplicate=ls.checkEmployeeLeaveDuplicate(leave);
		boolean checkHoliday =ls.checkHoliday(leave);
		if(checkDuplicate==true && checkHoliday==true) {
			leave.setStatus("Pending");
			lrep.save(leave);
		
			mv.setViewName("EmployeeApplyLeave");
			Employee employee =erep.findById(leave.getEmpId());
			Employee manager = erep.findByNameAndManagerNameIsNull(employee.getManagerName());
			es.applyLeave(manager.getEmail(), leave, employee);
			mv.addObject("employee", employee);
			String success="Leave applied Successfully";
			mv.addObject("success", success);
			leave.setStatus("Pending");
			lrep.save(leave);
			return mv;
		}else if(checkDuplicate==true && checkHoliday==false){
			mv.setViewName("EmployeeApplyLeave");
			Employee employee =erep.findById(leave.getEmpId());
			mv.addObject("employee", employee);
			String duplicate="Its Holiday";
			mv.addObject("duplicate", duplicate);
			return mv;
		}else {
			mv.setViewName("EmployeeApplyLeave");
			Employee employee =erep.findById(leave.getEmpId());
			mv.addObject("employee", employee);
			String duplicate="Already applied for this leave";
			mv.addObject("duplicate", duplicate);
			return mv;
		}
		
	}
	
	@RequestMapping("/empaccept")
	public ModelAndView empAccept(@RequestParam("lid") int id) {
		System.out.println("emp accept");
		System.out.println(id);
		ModelAndView mv = new ModelAndView();
		Leaves leave= lrep.findById(id);
		leave.setStatus("Approved");
		Employee employee=erep.findById(leave.getEmpId());
		es.acceptEmail(employee.getEmail(), leave);
		Employee manager= ls.empAccept(leave);
		mv.addObject("employee", manager);
		List<Leaves> leaves=lrep.findByManagerNameAndStatus(manager.getName(),"Pending");
		List<Leaves> rest= lrep.findByManagerNameAndStatusNot(manager.getName(), "Pending");
		mv.addObject("rest", rest);
		mv.addObject("employee", manager);
		mv.setViewName("ManagerManageLeave");
		mv.addObject("leaves", leaves);
		return mv;
		
	}
	
	@RequestMapping("/empreject")
	public ModelAndView empReject(@RequestParam("lid") int id) {
		System.out.println("Emp accept");
		ModelAndView mv = new ModelAndView();
		Leaves leave=lrep.findById(id);
		leave.setStatus("Denied");
		lrep.save(leave);
		Employee manager=ls.empReject(leave);
		Employee employee=erep.findById(leave.getEmpId());
		es.rejectEmail(employee.getEmail(), leave);
		List<Leaves> leaves=lrep.findByManagerNameAndStatus(manager.getName(),"Pending");
		List<Leaves> rest= lrep.findByManagerNameAndStatusNot(manager.getName(), "Pending");
		mv.addObject("rest", rest);
		mv.addObject("employee", manager);
		mv.setViewName("ManagerManageLeave");
		mv.addObject("leaves", leaves);
		return mv;
		
	}
}
