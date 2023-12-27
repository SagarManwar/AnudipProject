package com.demo.model;





import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@DynamicUpdate
public class Holiday {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int hid;
	private String fromDate;
	private String toDate;
	private String occasion;
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getOccasion() {
		return occasion;
	}
	public void setOccasion(String occasion) {
		this.occasion = occasion;
	}
	@Override
	public String toString() {
		return "Holiday [hid=" + hid + ", fromDate=" + fromDate + ", toDate=" + toDate + ", occasion=" + occasion + "]";
	}
	
	

	
}
