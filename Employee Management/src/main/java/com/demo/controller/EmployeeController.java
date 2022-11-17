package com.demo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.PasswordGenerator;
import com.demo.model.Employee;
import com.demo.service.EmployeeServiceImpl;
import com.demo.service.LoggedInUsersImp;
import com.demo.service.UserDetailsServiceImpl;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeServiceImpl service;
	
	@Autowired
	UserDetailsServiceImpl userSerevice;
	
	@Autowired
	LoggedInUsersImp loggedInUsersImp;
	
	PasswordGenerator passwordgenerator = new PasswordGenerator();
	
	@RequestMapping(method=RequestMethod.POST,value="admin/employee")
	public String addEmployee(Employee employee) {
		
		service.saveOrUpdateEmployee(employee);

		
		return "redirect:/admin/employee-datatable";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="admin/employeeUpdate")
	public String updateEmployee(Employee employee, @RequestParam int id) {
		
		System.out.println(id);
		employee.setId(id);
		
		service.saveOrUpdateEmployee(employee);

		return "redirect:/admin/viewEmployee?id="+id;
		
	}

	
	@GetMapping("admin/viewEmployee")
	public String viewEmployee(@RequestParam int id, Model model) {
		
		Employee employee = service.getEmployeeById(id);
		
		System.out.print(model);
		model.addAttribute("employee", employee);
		System.out.print(employee);
		System.out.print(id);
		
		return "employee/view_employee_data";
	}
	
	
	@RequestMapping("/admin/deleteEmployee")
	public String deleteEmployee(@RequestParam int id) {
		
		service.deleteEmployeeById(id);
		return "redirect:/admin/employee-datatable";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Model model) {
        return "loginPage";
    }

    @RequestMapping("/success")
    public void loginPageRedirect(HttpServletRequest request, HttpServletResponse response, Authentication authResult) throws IOException, ServletException {

        String role =  authResult.getAuthorities().toString();

        if(role.contains("ADMIN")){
         response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/admin/employee-dashboard"));                            
         }
         else if(role.contains("USER")) {
             response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/admin/employee-user-dashboard"));
         }
    }


	
	
}
