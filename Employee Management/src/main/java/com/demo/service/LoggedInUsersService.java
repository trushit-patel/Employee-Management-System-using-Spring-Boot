package com.demo.service;

import java.util.List;

import com.demo.model.LoggedInUsers;

public interface LoggedInUsersService {
	
	List<LoggedInUsers> getAllLoggedInUsers();
	void saveLoggedInUser(LoggedInUsers loggedInUsers);
	LoggedInUsers getLoggedInUserById(int id);
	void deleteLoggedInUserById(int id);
}
