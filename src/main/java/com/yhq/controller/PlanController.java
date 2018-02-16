package com.yhq.controller;

import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.pojo.Plan;
import com.yhq.pojo.PlanDetail;
import com.yhq.service.IOppService;
import com.yhq.service.IPlanService;

@Controller
public class PlanController {

	@Autowired
	private IPlanService ips;

	@Autowired
	private IOppService ios;

	@PostMapping("/saveplananddetail")// 通过获得订单计划    获得商品id数组 和 对应的数量数组 
	public String savePlanAndDetail(Plan plan, String[] product_ids, Integer[] counts) {
		List<PlanDetail> planDetails = plan.getPlanDetails();
		int a = 0;
		for (String s : product_ids) {
			String[] strings = s.split(",");
			System.out.println("::::id=" + strings[0]);
			PlanDetail pd = new PlanDetail();
			pd.setProduct_id(Integer.parseInt(strings[0]));
			pd.setCounts(counts[a]);
			a++;
			pd.setPlan(plan);
			planDetails.add(pd);
		}
		// 添加数据
		ips.savePlan(plan);
		// 更改营销机会状态为1，开发中
		ios.updateStatus(1, plan.getOpp_id());
		return "redirect:/todevlist/1";
	}
	
	@RequestMapping("/toorderdetailpage")
	public String toorderdetailpage(HttpServletRequest req,Model m){
		String oppid = req.getParameter("id");
		String customer = req.getParameter("customer");
		String planid = req.getParameter("planid");
		m.addAttribute("oppid", oppid);
		m.addAttribute("customer", customer);
		Plan plan = ips.findOne(Integer.parseInt(planid));
		List<PlanDetail> details = plan.getPlanDetails();
		int sum = 0;
		for (PlanDetail planDetail : details) {
			sum += planDetail.getProduct().getPrice() * planDetail.getCounts();
		}
		m.addAttribute("sum", sum);
		m.addAttribute("plan",plan);
		return "crm_cus/info/order_detail";
	}
}
