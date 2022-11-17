package com.demo.service;

import java.util.List;

import com.demo.model.Employee;

public interface EmployeeService {	
	List<Employee> getAllEmployees();
	void saveOrUpdateEmployee(Employee employee);
	Employee getEmployeeById(int id);
	void deleteEmployeeById(int id);
	
}
