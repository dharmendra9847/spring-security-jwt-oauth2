package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.EmployeeEntity;

public interface EmployeeCrud extends JpaRepository<EmployeeEntity, Integer>{
	
	@Modifying
	@Transactional
	@Query(value = "insert into employee (eid, ename, eaddress, esalary) values(:eid, :ename, :eaddress, :esalary)", nativeQuery=true)
	public int saveMyData( @Param("eid") int eid, @Param("ename") String ename, @Param("eaddress") String eaddress, @Param("esalary") int esalary);
	
	
	@Query(value = "select * from employee where esalary > 5000", nativeQuery=true)
	public List<EmployeeEntity> readMyData();
	
	
	@Query(value = "from EmployeeEntity" )
	public List<EmployeeEntity> readMyAllData();
	
	
	public List<EmployeeEntity> findByEsalary(int esalary); 	// "select * from employee where esalary=:esalary
	
	public List<EmployeeEntity> findByEsalaryLessThan(int esalary); 	// "select * from employee where esalary<:esalary

}
