package com.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.model.LoggedInUsers;

@Repository
public interface LoggedInUsersRepository extends JpaRepository<LoggedInUsers, Integer> {

}
