package com.yhq.service.impl;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.yhq.dao.IStockDao;
import com.yhq.pojo.Stock;
import com.yhq.service.IStockService;
import com.yhq.utils.PageBean;

@Service
public class StockServiceImpl implements IStockService {

	@Resource
	private IStockDao isd;

	@Override
	public PageBean<Stock> getAllPage(int pagenum) {
		if (pagenum <= 0) {
			pagenum = 1;
		}
		PageBean<Stock> bean = new PageBean<>();
		int count = (int) isd.count() % bean.getNumOfPage() == 0 ? (int) isd.count() / bean.getNumOfPage()
				: (int) isd.count() / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Stock> page = isd.findAll(pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(isd.count());
		return bean;
	}

}
