package com.yhq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.yhq.dao.IRecordDao;
import com.yhq.pojo.Record;
import com.yhq.service.IRecordService;
import com.yhq.utils.PageBean;

@Service
public class RecordServiceImpl implements IRecordService {
	
	@Autowired
	private IRecordDao ird;

	@Override
	public PageBean<Record> findByOppid(int oppid, int pagenum) {
		if(pagenum <= 0){
			pagenum = 1;
		}
		PageBean<Record> bean = new PageBean<>();
		int count = ird.countByOppid(oppid) % bean.getNumOfPage() == 0 ? ird.countByOppid(oppid) / bean.getNumOfPage() : ird.countByOppid(oppid) / bean.getNumOfPage() + 1;
		if(pagenum >= count){
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Record> page = ird.findByOppid(oppid, pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(ird.countByOppid(oppid));
		return bean;
	}

	@Override
	public void saveAndUpdate(Record rec) {
		ird.saveAndFlush(rec);
	}

	@Override
	public Record findById(int id) {
		return ird.findOne(id);
	}

	@Override
	public void delRecById(int id) {
		ird.delete(id);
	}
}
