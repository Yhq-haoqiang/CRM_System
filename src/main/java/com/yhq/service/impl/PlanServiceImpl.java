package com.yhq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.yhq.dao.IPlanDao;
import com.yhq.dao.IProductDao;
import com.yhq.pojo.Plan;
import com.yhq.pojo.PlanDetail;
import com.yhq.pojo.Product;
import com.yhq.service.IPlanService;
import com.yhq.utils.PageBean;

@Service
public class PlanServiceImpl implements IPlanService {

	@Resource
	private IPlanDao ipd;

	@Resource
	private IProductDao pdao;

	@Override
	public void savePlan(Plan plan) {
		ipd.saveAndFlush(plan);
	}

	@Override
	public PageBean<Plan> findPlanByOppidAndPage(int oppid, int pagenum) {
		if (pagenum <= 0) {
			pagenum = 1;
		}
		PageBean<Plan> bean = new PageBean<>();
		int count = ipd.countByOpp_Id(oppid) % bean.getNumOfPage() == 0 ? ipd.countByOpp_Id(oppid) / bean.getNumOfPage()
				: ipd.countByOpp_Id(oppid) / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Plan> page = ipd.findByOpp_Id(oppid, pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(ipd.countByOpp_Id(oppid));

		return bean;
	}

	@Override
	public Plan findOne(int id) {
		Plan plan = ipd.findOne(id);
		List<PlanDetail> details = plan.getPlanDetails();
		for (PlanDetail pd : details) {
			int product_id = pd.getProduct_id();
			Product product = pdao.findOne(product_id);
			pd.setProduct(product);
		}
		return plan;
	}

}
