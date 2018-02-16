package com.yhq.service;

import com.yhq.pojo.Plan;
import com.yhq.utils.PageBean;

public interface IPlanService {
	
	void savePlan(Plan plan);
	
	PageBean<Plan> findPlanByOppidAndPage(int oppid,int pagenum);
	
	/**
	 * 收订获取该完成计划订单的 产品明细
	 * @param id
	 * @return
	 */
	Plan findOne(int id);
}
