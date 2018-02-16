package com.yhq.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.Ser;
import com.yhq.service.ISerService;
import com.yhq.utils.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class SerTest {
	
	@Autowired
	private ISerService iss;
	
	@Test
	public void saveSer(){
		Ser s = new Ser();
		s.setCustomer("天网软件");
		s.setTypes("上市具体时间");
		s.setOutline("概要1111");
		s.setStatus(0);
		s.setRequest("服务请求。。。。");
		s.setCre_name("admin");
		s.setCre_date(new Date());
		iss.saveAndUpdate(s);
		System.out.println("success");
	}
	@Test
	public void test2(){
		PageBean<Ser> bean = iss.getDispatch(3,0);
		List<Ser> list = bean.getPageInfo();
		System.out.println(list);
	}
	@Test
	public void test4(){
		iss.updateDisName(1, "wangwu", 10);
	}
}
