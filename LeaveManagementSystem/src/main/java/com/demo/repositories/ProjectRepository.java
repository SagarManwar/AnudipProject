package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> {
 List<Project> findByProjectName(String projectName);
 List<Project> findByManagerName(String managerName);
}
