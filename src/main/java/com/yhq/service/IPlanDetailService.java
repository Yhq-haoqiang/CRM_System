package com.yhq.service;

import com.yhq.pojo.PlanDetail;
import com.yhq.utils.PageBean;

public interface IPlanDetailService {

	PageBean<PlanDetail> findPlanDetailByPlanidAndPage(int palnid, int pagenum);
}
