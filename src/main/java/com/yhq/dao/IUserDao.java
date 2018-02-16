package com.yhq.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.User;

public interface IUserDao extends JpaRepository<User,Serializable> {
	
	User findByUsername(String username);
	
}
