package tech.restapiproject.services;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.restapiproject.dto.EmployeeDTO;
import tech.restapiproject.entities.EmployeeEntity;
import tech.restapiproject.repositories.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	public EmployeeEntity employeeDtoToEmployeeEntity(EmployeeDTO employeeDto) {

		EmployeeEntity employeeEntity = new EmployeeEntity();
		employeeEntity.setId(employeeDto.getId());
		employeeEntity.setName(employeeDto.getName());
		employeeEntity.setAddress(employeeDto.getAddress());
		employeeEntity.setSalary(employeeDto.getSalary());
		employeeEntity.setLocalDateTime(LocalDateTime.now());

		return employeeEntity;
	}

	// save
	public EmployeeEntity saveEmployeeData(EmployeeDTO employeeDto) {
		EmployeeEntity employeeDtoToEmployeeEntity = employeeDtoToEmployeeEntity(employeeDto);
		return employeeRepository.save(employeeDtoToEmployeeEntity);
	}

	// readDataById
	public Optional<EmployeeEntity> readDataById(int id) {
		return employeeRepository.findById(id);
	}

	// readAllData
	public List<EmployeeEntity> readAllData() {
		return employeeRepository.findAll();
	}

	//updateAllData
	public EmployeeEntity updateAllData(int id, EmployeeDTO employeeDto) {

		Optional<EmployeeEntity> optional = employeeRepository.findById(id);
		if (optional.isPresent()) {
			EmployeeEntity employeeEntity = employeeDtoToEmployeeEntity(employeeDto);
			EmployeeEntity updatedEmployee = employeeRepository.save(employeeEntity);
			return updatedEmployee;
		}

		return null;
	}

	//updatePartialData
	public EmployeeEntity updatePartialData(int id, double salary) {

		Optional<EmployeeEntity> optional = employeeRepository.findById(id);

		if (optional.isPresent()) {

			EmployeeEntity employeeEntity = optional.get();
			employeeEntity.setSalary(salary);
			EmployeeEntity updatedEmployeeSalary = employeeRepository.save(employeeEntity);
			return updatedEmployeeSalary;
		}

		return null;
	}

	//deleteData
	public boolean deleteData(int id) {

	    Optional<EmployeeEntity> optional = employeeRepository.findById(id);

	    if (optional.isPresent()) {
	        employeeRepository.delete(optional.get());
	        return true;
	    }

	    return false;
	}

}
