package com.demo.model;




import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.DynamicUpdate;


@Entity
@DynamicUpdate

public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String email;
	private String dob;
	private long mobileNumber;
	private String gender;
	private String joiningDate;
	private String designation;
	private String department;
	private String state;
	private String address;	
	private String managerName;
	//Should be generated.
	private String status;
	private String username;
	private String password;
	private int sickLeave;
	private int casualLeave;
	private int personalLeave;
	private int maternityLeave;
	private int paternityLeave;
	private int marriageLeave;
	private int adoptionLeave;
	@ManyToOne
	Admin admin;
	
	public int getSickLeave() {
		return sickLeave;
	}
	public void setSickLeave(int sickLeave) {
		this.sickLeave = sickLeave;
	}
	public int getCasualLeave() {
		return casualLeave;
	}
	public void setCasualLeave(int casualLeave) {
		this.casualLeave = casualLeave;
	}
	public int getPersonalLeave() {
		return personalLeave;
	}
	public void setPersonalLeave(int personalLeave) {
		this.personalLeave = personalLeave;
	}
	public int getMaternityLeave() {
		return maternityLeave;
	}
	public void setMaternityLeave(int maternityLeave) {
		this.maternityLeave = maternityLeave;
	}
	public int getPaternityLeave() {
		return paternityLeave;
	}
	public void setPaternityLeave(int paternityLeave) {
		this.paternityLeave = paternityLeave;
	}
	public int getMarriageLeave() {
		return marriageLeave;
	}
	public void setMarriageLeave(int marriageLeave) {
		this.marriageLeave = marriageLeave;
	}
	public int getAdoptionLeave() {
		return adoptionLeave;
	}
	public void setAdoptionLeave(int adoptionLeave) {
		this.adoptionLeave = adoptionLeave;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}

	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", email=" + email + ", dob=" + dob + ", mobileNumber="
				+ mobileNumber + ", gender=" + gender + ", joiningDate=" + joiningDate + ", designation=" + designation
				+ ", department=" + department + ", state=" + state + ", address=" + address + ", managerName="
				+ managerName + ", status=" + status + ", username=" + username + ", password=" + password
				+ ", sickLeave=" + sickLeave + ", casualLeave=" + casualLeave + ", personalLeave=" + personalLeave
				+ ", maternityLeave=" + maternityLeave + ", paternityLeave=" + paternityLeave + ", marriageLeave="
				+ marriageLeave + ", adoptionLeave=" + adoptionLeave + ", admin=" + admin + "]";
	}

	
}
