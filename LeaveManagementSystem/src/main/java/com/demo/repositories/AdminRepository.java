package com.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
	Admin findById(int id);
	Admin findByUsernameAndPassword(String username,String password);
	
	
}
