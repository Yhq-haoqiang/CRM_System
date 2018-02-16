package com.yhq.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.yhq.pojo.Contacts;
import com.yhq.pojo.Opp;
import com.yhq.utils.PageBean;

public interface IOppService {

	PageBean<Opp> getAllPage(int status, int pagenum);

	PageBean<Opp> getAllPage(int pagenum);

	void addOpp(Opp opp);

	Opp findOne(int id);

	void delOpp(int id);

	@Transactional
	void updateStatus(int status, int id);

	List<Contacts> findContactsByOppid(int oppid);

	void addAndUpdateContacts(Contacts con);

	Contacts findContactsById(int id);

	PageBean<Opp> findByStatusNot(int status, int pagenum);

	@Transactional
	void updateStatusAndReprieve(String reprieve, int id);

	@Transactional
	void updateStatusLose(String whyloss, int id);
	
	List<Object[]> selectsummoney();
}
