package com.yhq.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.Product;
import com.yhq.service.IProductService;
import com.yhq.utils.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class ProductTest {

	
	@Autowired
	private IProductService ips;
	
	@Test
	public void test() {
		PageBean<Product> bean = ips.findALLProductPage(2);
		System.out.println(bean.getPageInfo());
		
	}

}
