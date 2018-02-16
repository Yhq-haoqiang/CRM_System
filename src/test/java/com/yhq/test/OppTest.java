package com.yhq.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.Contacts;
import com.yhq.pojo.Opp;
import com.yhq.service.IOppService;
import com.yhq.utils.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class OppTest {
	
	
	@Autowired
	private IOppService ios;
	
	@Test
	public void test1(){
		PageBean<Opp> bean = ios.getAllPage(0, 1);
		List<Opp> list = bean.getPageInfo();
		
		for (Opp opp : list) {
			System.out.println(opp);
		}
		
	}
	@Test
	public void test2(){
		Opp opp = new Opp();
		
		opp.setOppcome("网络");
		opp.setCustomer("前方1211");
		opp.setOdds("50%");
		opp.setOutline("hahahha13213");
		opp.setCre_name("admin");
		opp.setCre_date(new Date());
		Contacts contacts = new Contacts();
		contacts.setName("小钱12321");
		contacts.setPhone("123456465444");
		contacts.setSex(1);
		opp.setContacts(contacts);
		ios.addOpp(opp);
		System.out.println("成功");
	}
	@Test
	public void test3(){
		ios.delOpp(4);
		System.out.println("成功");
	}
	@Test
	public void test5(){
		
		List<Object[]> list = ios.selectsummoney();
		
		for (Object[] objects : list) {
				System.out.println(":: 第一个值" +objects[0] + ":: 第二个值" + objects[1]);
		}
	}
	
	@Test
	public void test4(){
		PageBean<Opp> bean = ios.findByStatusNot(2, 5);
		List<Opp> list = bean.getPageInfo();
		for (Opp opp : list) {
			System.out.println(opp.getStatus());
		}
	}
}
