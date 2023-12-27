package com.demo.repositories;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.model.Holiday;

public interface HolidayRepository extends JpaRepository<Holiday, Integer>{
		
	List<Holiday> findByFromDate(String fromDate);
	List<Holiday> findByToDate(String toDate);
	List<Holiday> findByFromDateAndToDate(String fromDate,String toDate);
	List<Holiday> findByFromDateOrToDate(String fromDate,String toDate);
}
