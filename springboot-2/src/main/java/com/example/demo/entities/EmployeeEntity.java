package com.example.demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "employee")
public class EmployeeEntity {
	
	@Id
	private int eid;
	private String ename;
	private String eaddress;
	private int esalary;
	
	
	public EmployeeEntity() {
		// TODO Auto-generated constructor stub
	}


	public EmployeeEntity(int eid, String ename, String eaddress, int esalary) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.eaddress = eaddress;
		this.esalary = esalary;
	}


	public int getEid() {
		return eid;
	}


	public void setEid(int eid) {
		this.eid = eid;
	}


	public String getEname() {
		return ename;
	}


	public void setEname(String ename) {
		this.ename = ename;
	}


	public String getEaddress() {
		return eaddress;
	}


	public void setEaddress(String eaddress) {
		this.eaddress = eaddress;
	}


	public int getEsalary() {
		return esalary;
	}


	public void setEsalary(int esalary) {
		this.esalary = esalary;
	}


	@Override
	public String toString() {
		return "EmployeeEntity [eid=" + eid + ", ename=" + ename + ", eaddress=" + eaddress + ", esalary=" + esalary
				+ "]";
	}
	
	
	
}
