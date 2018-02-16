package com.yhq.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yhq.dao.IUserDao;
import com.yhq.pojo.User;
import com.yhq.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	
	@Resource
	private IUserDao iud;
	
	@Override
	public User findByUsername(String username) {
		return iud.findByUsername(username);
	}

	@Override
	public List<String> getAllName() {
		List<User> user = iud.findAll();
		List<String> list = new ArrayList<>();
		for (User u : user) {
			list.add(u.getName());
		}
		return list;
	}

}
