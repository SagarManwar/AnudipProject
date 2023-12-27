package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.demo.model.Project;
import com.demo.repositories.ProjectRepository;

@Component
public class ProjectService {
	@Autowired
	ProjectRepository prep;
	
	public boolean checkProjectDuplicate(Project project) {
		List<Project> projects=prep.findByProjectName(project.getProjectName());
		if(projects.isEmpty()) {
			return false;
		}else {
			return true;
		}
	}
}
