package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Admin;
import com.demo.model.Employee;
import com.demo.repositories.AdminRepository;
import com.demo.repositories.EmployeeRepository;
import com.demo.service.ResetPasswordService;

@Controller
public class ResetPasswordController {
		
	@Autowired
	AdminRepository arep;
	@Autowired
	ResetPasswordService rps;
	@Autowired
	EmployeeRepository erep;
	
	@RequestMapping("/AdminResetPassword")
	public ModelAndView adminpwd(@RequestParam("id") int id) {
		System.out.println(id);
		Admin admin=arep.findById(id);
		System.out.println(admin);
		ModelAndView mv=new ModelAndView();
		mv.addObject("admin", admin);
		mv.setViewName("AdminResetPassword");
		return mv;
		
	}
	
	@RequestMapping("/adminreset")
	public ModelAndView adminreset(@RequestParam("oldPassword") String oldPass,
							@RequestParam("newPassword") String newPass,
							@RequestParam("id") int id,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		System.out.println(oldPass);
		System.out.println(newPass);
		System.out.println(id);
		Admin admin=arep.findById(id);
		boolean checkPassword=rps.adminPasswordCheck(admin, oldPass);
		if(checkPassword==true) {
			admin.setPassword(newPass);
			arep.save(admin);
			session.invalidate();
			mv.setViewName("login");
			return mv;
		}else {
			String wrongPassword="Please enter correct old password";
			mv.addObject("wrongPassword", wrongPassword);
			mv.addObject("admin", admin);
			mv.setViewName("AdminResetPassword");
			return mv;
		}
	}
	
	@RequestMapping("/EmployeeResetPassword")
	public ModelAndView employeepwd(@RequestParam("id") int id) {
		System.out.println(id);
		Employee employee=erep.findById(id);
		System.out.println(employee);
		ModelAndView mv=new ModelAndView();
		mv.addObject("employee", employee);
		mv.setViewName("EmployeeResetPassword");
		return mv;
		
	}
	
	@RequestMapping("/employeereset")
	public ModelAndView employeeReset(@RequestParam("oldPassword") String oldPass,
							@RequestParam("newPassword") String newPass,
							@RequestParam("id") int id,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		System.out.println(oldPass);
		System.out.println(newPass);
		System.out.println(id);
		Employee employee=erep.findById(id);
		boolean checkPassword=rps.employeePasswordCheck(employee, oldPass);
		if(checkPassword==true) {
			employee.setPassword(newPass);
			erep.save(employee);
			session.invalidate();
			mv.setViewName("login");
			return mv;
		}else {
			String wrongPassword="Please enter correct old password";
			mv.addObject("wrongPassword", wrongPassword);
			mv.addObject("employee", employee);
			mv.setViewName("EmployeeResetPassword");
			return mv;
		}
	}
	
	
}
