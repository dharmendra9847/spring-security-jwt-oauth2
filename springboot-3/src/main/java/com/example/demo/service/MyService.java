package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.EmployeeDTO;
import com.example.demo.entities.EmployeeEntity;
import com.example.demo.repositories.EmployeeRepository;

@Service
public class MyService {
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	public EmployeeEntity save(EmployeeDTO employeeDTO) {
		
		return employeeRepository.save(new EmployeeEntity(employeeDTO.getId(), employeeDTO.getName(), employeeDTO.getAddress(), employeeDTO.getSalary()));
	}

}
