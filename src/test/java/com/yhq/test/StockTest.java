package com.yhq.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.Stock;
import com.yhq.service.IStockService;
import com.yhq.utils.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class StockTest {
	
	@Autowired
	private IStockService iss;
	
	@Test
	public void test2(){
		PageBean<Stock> bean = iss.getAllPage(1);
		List<Stock> list = bean.getPageInfo();
		System.out.println(list);
	}
}
