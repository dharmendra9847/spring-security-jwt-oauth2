package com.example.demo;

import com.example.demo.entities.EmployeeEntity;
import com.example.demo.repositories.EmployeeCrud;

import java.util.List;
import java.util.Optional;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.domain.Sort;

@SpringBootApplication
public class Springboot2Application {

	private final EmployeeCrud employeeCrud;

	Springboot2Application(EmployeeCrud employeeCrud) {
		this.employeeCrud = employeeCrud;
	}

	public static void main(String[] args) {
		
		ConfigurableApplicationContext ac = SpringApplication.run(Springboot2Application.class, args);
		EmployeeCrud bean = ac.getBean(EmployeeCrud.class);
		
//		bean.save(new EmployeeEntity(12,"Ajju", "Nepal", 4510));
//		bean.save(new EmployeeEntity(13,"Kaju", "Up", 3000));
//		bean.save(new EmployeeEntity(14,"Maju", "Bhopal", 7800));   // update also
//		
//		
		
		System.out.println("\n ********************************************************************* \n");
		
		
		List<EmployeeEntity> list1 = bean.findAll();
		for(EmployeeEntity emp : list1) {
			System.out.println(emp);
		}
		
		System.out.println("\n ********************************************************************* \n");
		
		List<EmployeeEntity> list2 = bean.findAll(Sort.by("esalary"));
		for(EmployeeEntity emp : list2) {
			System.out.println(emp);
		}
		
		System.out.println("\n ********************************************************************* \n");
		
//		Optional<EmployeeEntity> byId = bean.findById(12);
//		EmployeeEntity employeeEntity = byId.get();
//		System.out.println(employeeEntity);
		
//		bean.deleteById(12);
//		bean.deleteAll();
		
//		bean.saveMyData(123, "Mohan", "Delhi", 50000);
//		int saveMyData = bean.saveMyData(101, "Rohan", "Delhi", 150000);
//		System.out.println(saveMyData);

		
//		List<EmployeeEntity> myData = bean.readMyData();
//		for(EmployeeEntity emp : myData) {
//			System.out.println(emp);
//		}
		
//		List<EmployeeEntity> myAllData = bean.readMyAllData();
//		for(EmployeeEntity emp : myAllData) {
//			System.out.println(emp);
//		}
		
		
		System.out.println("Test...");
		
		List<EmployeeEntity> byEsalary = bean.findByEsalary(1000);
		for(EmployeeEntity emp : byEsalary) {
			System.out.println(emp);
		}
		
		
		
		List<EmployeeEntity> findByEsalaryLessThan = bean.findByEsalaryLessThan(5000);
		for(EmployeeEntity emp : findByEsalaryLessThan) {
			System.out.println(emp);
		}
		
		
		System.out.println("\n ********************************************************************* \n");
		
	}

}
