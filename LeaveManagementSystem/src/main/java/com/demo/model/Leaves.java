package com.demo.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicUpdate;




@Entity
@DynamicUpdate
public class Leaves {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int lid;
	private int empId;
	private String empName;
	private String startDate;
	private String endDate;
	private int days;
	private String leaveType;
	private String reason;
	private String status;
	private String empDesignation;
	private String managerName;
	
	
	
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getEmpDesignation() {
		return empDesignation;
	}
	public void setEmpDesignation(String empDesignation) {
		this.empDesignation = empDesignation;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getLeaveType() {
		return leaveType;
	}
	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "Leaves [lid=" + lid + ", empId=" + empId + ", empName=" + empName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", days=" + days + ", leaveType=" + leaveType + ", reason=" + reason
				+ ", status=" + status + ", empDesignation=" + empDesignation + ", managerName=" + managerName + "]";
	}
	
	
	
	
	
}
