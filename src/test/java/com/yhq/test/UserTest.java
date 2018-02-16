package com.yhq.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.User;
import com.yhq.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class UserTest {
	
	
	@Autowired
	private IUserService ius;
	
	@Test
	public void findUser(){
		User user = ius.findByUsername("admin");
		
		System.out.println(user);
	}
	@Test
	public void findUser1(){
		List<String> list = ius.getAllName();
		for (String string : list) {
			System.out.println(string);
		}
	}
}
