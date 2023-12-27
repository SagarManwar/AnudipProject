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
import com.demo.model.Project;
import com.demo.repositories.AdminRepository;
import com.demo.repositories.EmployeeRepository;
import com.demo.repositories.ProjectRepository;
import com.demo.service.ProjectService;

@Controller
public class ProjectController {
	@Autowired
	ProjectRepository prep;
	@Autowired
	AdminRepository arep;
	@Autowired
	ProjectService ps;
	@Autowired
	EmployeeRepository erep;
	
	@RequestMapping("/addProject")
	public ModelAndView addProject(Model model,Project project,@RequestParam("id") int id) {
		System.out.println(project);
		Admin admin=arep.findById(id);
		System.out.println(admin);
		ModelAndView mv=new ModelAndView();
		boolean duplicate= ps.checkProjectDuplicate(project);
		if(duplicate==false) {
			prep.save(project);
			mv.addObject("admin", admin);
			String success="Project added successfully!!";
			mv.addObject("success", success);
			mv.setViewName("AdminAddProject");
			List<Employee> IT =erep.findByDepartmentAndDesignation("IT", "Manager");
			List<Employee> HR =erep.findByDepartmentAndDesignation("HR", "Manager");
			List<Employee> Finance =erep.findByDepartmentAndDesignation("Finance", "Manager");
			mv.addObject("IT", IT);
			mv.addObject("HR", HR);
			mv.addObject("Finance", Finance);
			return mv;
		}else {
			mv.addObject("admin", admin);
			String duplicates="Project already added";
			mv.addObject("duplicate", duplicates);
			mv.setViewName("AdminAddProject");
			List<Employee> IT =erep.findByDepartmentAndDesignation("IT", "Manager");
			List<Employee> HR =erep.findByDepartmentAndDesignation("HR", "Manager");
			List<Employee> Finance =erep.findByDepartmentAndDesignation("Finance", "Manager");
			mv.addObject("IT", IT);
			mv.addObject("HR", HR);
			mv.addObject("Finance", Finance);
			return mv;
		}
		
		
	}
	
}
