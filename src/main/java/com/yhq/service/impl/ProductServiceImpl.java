package com.yhq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.yhq.dao.IProductDao;
import com.yhq.pojo.Product;
import com.yhq.service.IProductService;
import com.yhq.utils.PageBean;

@Service
public class ProductServiceImpl implements IProductService {

	@Resource
	private IProductDao ipd;

	@Override
	public PageBean<Product> findALLProductPage(int pagenum) {
		if (pagenum <= 0) {
			pagenum = 1;
		}
		PageBean<Product> bean = new PageBean<>();
		int count = (int) ipd.count() % bean.getNumOfPage() == 0 ? (int) ipd.count() / bean.getNumOfPage()
				: (int) ipd.count() / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Product> page = ipd.findAll(pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(ipd.count());
		return bean;

	}

	@Override
	public List<Product> findAll() {
		return ipd.findAll();
	}

}
