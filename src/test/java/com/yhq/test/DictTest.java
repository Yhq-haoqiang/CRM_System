package com.yhq.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.Dict;
import com.yhq.service.IDictService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class DictTest {
	
	@Autowired
	private IDictService ids;
	
	@Test
	public void findAll(){
		List<Dict> list = ids.getAllDict();
		for (Dict dict : list) {
			System.out.println(dict.getCategory());
		}
	}
	@Test
	public void getCount(){
		long l = ids.getCount();
		System.out.println(l);
		
	}
	@Test
	public void getPage(){
		
	}
}
