package com.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.model.LoggedInUsers;
import com.demo.repo.LoggedInUsersRepository;

@Service
public class LoggedInUsersImp implements LoggedInUsersService {
	
	@Autowired
	private LoggedInUsersRepository loggedInUsersRepository;

	@Override
	public List<LoggedInUsers> getAllLoggedInUsers() {
		// TODO Auto-generated method stub
		return loggedInUsersRepository.findAll();
	}

	@Override
	public void saveLoggedInUser(LoggedInUsers loggedInUsers) {
		// TODO Auto-generated method stub
		this.loggedInUsersRepository.save(loggedInUsers);
	}

	@Override
	public LoggedInUsers getLoggedInUserById(int id) {
		// TODO Auto-generated method stub
		
		Optional<LoggedInUsers> optional = loggedInUsersRepository.findById(id);
		LoggedInUsers loggedInUsers = null;
		if(optional.isPresent()) {
			loggedInUsers = optional.get();
		}else {
			throw new RuntimeException("Branch not found for id :: " + id);
		}
		return loggedInUsers;
	}

	@Override
	public void deleteLoggedInUserById(int id) {
		// TODO Auto-generated method stub
		this.loggedInUsersRepository.deleteById(id);
	}

}
