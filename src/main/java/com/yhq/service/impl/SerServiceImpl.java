package com.yhq.service.impl;


import java.util.Date;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yhq.dao.ISerDao;
import com.yhq.pojo.Ser;
import com.yhq.service.ISerService;
import com.yhq.utils.PageBean;

@Service
public class SerServiceImpl implements ISerService {
	
	@Resource
	private ISerDao isd;
	
	@Override
	public void saveAndUpdate(Ser ser) {
		isd.saveAndFlush(ser);
	}

	@Override
	public PageBean<Ser> getDispatch(int pagenum,int status) {
		if(pagenum <= 0){
			pagenum = 1;
		}
		PageBean<Ser> bean = new PageBean<>();
		int count = isd.countByStatus(status) % bean.getNumOfPage() == 0 ? isd.countByStatus(status) / bean.getNumOfPage() : isd.countByStatus(status) / bean.getNumOfPage() + 1;
		if(pagenum >= count){
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Ser> page = isd.findByStatus(status, pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(isd.countByStatus(status));
		return bean;
	}
	
	@Transactional
	@Override
	public void updateDisName(int status, String disname, int id) {
		isd.updateDisName(status, disname, id);
	}

	@Override
	public void deleteById(int id) {
		 isd.delete(id);
	}

	@Override
	public Ser findOne(int id) {
		return isd.findOne(id);
	}
	
	@Transactional
	@Override
	public void updateHandel(String handle, Date handle_date, String handle_name, int id) {
		isd.updateHandel(handle, handle_date, handle_name, id);
	}
	
	@Transactional
	@Override
	public void updateFeedBack(String handle_result, String Satisfaction, int id) {
		isd.updateFeedBack(handle_result, Satisfaction, id);
	}
}
