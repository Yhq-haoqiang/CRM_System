package com.yhq.service;

import com.yhq.pojo.Record;
import com.yhq.utils.PageBean;

public interface IRecordService {
	
	PageBean<Record> findByOppid(int oppid,int pagenum); 
	
	void saveAndUpdate(Record rec);
	
	Record findById(int id);
	
	void delRecById(int id);
}
