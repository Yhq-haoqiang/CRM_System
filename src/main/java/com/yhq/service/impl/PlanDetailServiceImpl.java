package com.yhq.service.impl;

import org.springframework.stereotype.Service;

import com.yhq.pojo.PlanDetail;
import com.yhq.service.IPlanDetailService;
import com.yhq.utils.PageBean;

@Service
public class PlanDetailServiceImpl implements IPlanDetailService {
	
	//private IPlanDetailDao ipd;
	
	@Override
	public PageBean<PlanDetail> findPlanDetailByPlanidAndPage(int palnid, int pagenum) {
		
		return null;
	}

}
