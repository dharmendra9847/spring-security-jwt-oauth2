package tech.restapiproject.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tech.restapiproject.dto.EmployeeDTO;
import tech.restapiproject.entities.EmployeeEntity;
import tech.restapiproject.services.EmployeeService;

@RestController
@RequestMapping("/api")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	// save data
	@PostMapping("/employee")
	public ResponseEntity<?> saveData(@RequestBody EmployeeDTO employeeDto) {

		EmployeeEntity employeeEntity = employeeService.saveEmployeeData(employeeDto);
//		return ResponseEntity.status(HttpStatus.CREATED).body(employeeEntity);

		return new ResponseEntity<EmployeeEntity>(employeeEntity, HttpStatus.CREATED);
	}

	// read data by id
	@GetMapping("/employee/{id}")
	public ResponseEntity<?> readDataById(@PathVariable int id) {

		Optional<EmployeeEntity> optional = employeeService.readDataById(id);

		if (optional.isPresent()) {
			EmployeeEntity employeeEntity = optional.get();
			return ResponseEntity.status(HttpStatus.OK).body(employeeEntity);
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

	// read all data
	@GetMapping("/employee")
	public ResponseEntity<List<EmployeeEntity>> readAllData() {

		List<EmployeeEntity> list = employeeService.readAllData();
		return ResponseEntity.status(HttpStatus.OK).body(list);

	}

	// update all data
	@PutMapping("/employee/{id}")
	public ResponseEntity<EmployeeEntity> updateAllData(@PathVariable int id, @RequestBody EmployeeDTO employeeDto) {

		EmployeeEntity employeeEntity = employeeService.updateAllData(id, employeeDto);
		if (employeeEntity != null) {
			return ResponseEntity.status(HttpStatus.OK).body(employeeEntity);
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

	// update partial
	@PatchMapping("/employee/{id}/salary")
	public ResponseEntity<EmployeeEntity> updatePartialData(@PathVariable int id, @RequestParam double salary) {

		EmployeeEntity employeeEntity = employeeService.updatePartialData(id, salary);
		if (employeeEntity != null) {
			return ResponseEntity.status(HttpStatus.OK).body(employeeEntity);
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

	// delete
	@DeleteMapping("/employee/{id}")
	public ResponseEntity<Void> deleteData(@PathVariable int id) {

		boolean isDeleted = employeeService.deleteData(id);

		if (isDeleted) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build(); // 204
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build(); // 404

	}

//	@GetMapping("/books")
//	public ResponseEntity<?> readData() {
//		
//		List<String> books = Arrays.asList("b1", "b2", "b3");
//		return books; //NOT RECCOMMENDED

	// THESE ARE SHORT-HAND PROPERTIES
//		return ResponseEntity.ok().build();
//		return ResponseEntity.notFound().build();

	// THESE ARE SPECIFIC PROPERTIES
//		return ResponseEntity.status(HttpStatus.FOUND).body(books);
//		return ResponseEntity.status(HttpStatus.CREATED).body(books);
//		return ResponseEntity.status(HttpStatus.ACCEPTED).body(books);
//	}
}
