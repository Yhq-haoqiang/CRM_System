package com.yhq.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhq.pojo.Plan;
import com.yhq.pojo.PlanDetail;
import com.yhq.service.IPlanService;
import com.yhq.utils.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-jpa.xml")
public class PlanTest {
	
	@Autowired
	private IPlanService ips;
	
	@Test
	public void test1(){
		Plan plan = new Plan();
		plan.setNumber("a123");
		plan.setOpp_id(1);
		plan.setComplete(0);
		plan.setOrderdate(new Date());
		//List<PlanDetail> planDetails = new ArrayList<>();
		List<PlanDetail> planDetails = plan.getPlanDetails();
		for (int i = 0; i < 3; i++) {
			PlanDetail p = new PlanDetail();
			p.setProduct_id(i+1);
			p.setCounts(20+i);
			p.setPlan(plan);
			planDetails.add(p);
		}
		ips.savePlan(plan);
	}
	
	@Test
	public void test2(){
		PageBean<Plan> bean = ips.findPlanByOppidAndPage(1, 1);
		List<Plan> list = bean.getPageInfo();
		for (Plan plan : list) {
			List<PlanDetail> list2 = plan.getPlanDetails();
			for (PlanDetail planDetail : list2) {
				System.out.println(":shuliang"+planDetail.getCounts());
			}
		}
	}
}
