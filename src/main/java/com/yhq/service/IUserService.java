package com.yhq.service;

import java.util.List;

import com.yhq.pojo.User;

public interface IUserService {
	
	User findByUsername(String username);
	
	List<String> getAllName();
}
