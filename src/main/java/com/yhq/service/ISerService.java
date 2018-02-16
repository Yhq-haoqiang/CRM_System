package com.yhq.service;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import com.yhq.pojo.Ser;
import com.yhq.utils.PageBean;

public interface ISerService {

	void saveAndUpdate(Ser ser);

	PageBean<Ser> getDispatch(int pagenum, int status);

	@Transactional
	void updateDisName(int status, String disname, int id);

	void deleteById(int id);

	Ser findOne(int id);

	@Transactional
	void updateHandel(String handle, Date handle_date, String handle_name, int id);

	@Transactional
	void updateFeedBack(String handle_result, String Satisfaction, int id);
}
