package com.demo.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.model.Employee;

@Repository 
public interface EmployeeRepository extends CrudRepository<Employee, Integer>{ 

}
