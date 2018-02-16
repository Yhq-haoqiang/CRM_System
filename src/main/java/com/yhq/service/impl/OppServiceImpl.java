package com.yhq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yhq.dao.IContactsDao;
import com.yhq.dao.IOppDao;
import com.yhq.pojo.Contacts;
import com.yhq.pojo.Opp;
import com.yhq.service.IOppService;
import com.yhq.utils.PageBean;

@Service
public class OppServiceImpl implements IOppService {

	@Resource
	private IOppDao iod;

	@Resource
	private IContactsDao icd;

	@Override
	public PageBean<Opp> getAllPage(int status, int pagenum) {
		if (pagenum <= 0) {
			pagenum = 1;
		}
		PageBean<Opp> bean = new PageBean<>();
		int count = iod.countByStatus(status) % bean.getNumOfPage() == 0
				? iod.countByStatus(status) / bean.getNumOfPage() : iod.countByStatus(status) / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Opp> page = iod.findByStatus(status, pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(iod.countByStatus(status));
		return bean;
	}

	@Override
	public void addOpp(Opp opp) {
		iod.saveAndFlush(opp);
	}

	@Override
	public Opp findOne(int id) {
		return iod.findOne(id);
	}

	@Override
	public void delOpp(int id) {
		iod.delete(id);
	}

	@Override
	public PageBean<Opp> getAllPage(int pagenum) {
		if (pagenum <= 0) {
			pagenum = 1;
		}
		PageBean<Opp> bean = new PageBean<>();
		int count = (int) iod.count() % bean.getNumOfPage() == 0 ? (int) iod.count() / bean.getNumOfPage()
				: (int) iod.count() / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Opp> page = iod.findAll(pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(iod.count());
		return bean;
	}

	@Transactional
	@Override
	public void updateStatus(int status, int id) {
		iod.updateStatus(status, id);
	}

	@Override
	public List<Contacts> findContactsByOppid(int oppid) {
		try {
			List<Contacts> findByOppid = icd.findByOppid(oppid);
			return findByOppid;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public void addAndUpdateContacts(Contacts con) {
		icd.saveAndFlush(con);
	}

	@Override
	public Contacts findContactsById(int id) {
		return icd.findOne(id);
	}

	@Override
	public PageBean<Opp> findByStatusNot(int status, int pagenum) {
		if (pagenum <= 0) {
			pagenum = 1;
		}
		PageBean<Opp> bean = new PageBean<>();
		int count = iod.countByStatusNot(status) % bean.getNumOfPage() == 0
				? iod.countByStatusNot(status) / bean.getNumOfPage() : iod.countByStatusNot(status) / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Opp> page = iod.findByStatusNot(status, pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(iod.countByStatusNot(status));
		return bean;
	}
	
	@Transactional
	@Override
	public void updateStatusAndReprieve(String reprieve, int id) {
		iod.updateStatusAndReprieve(reprieve, id);
	}
	
	@Transactional
	@Override
	public void updateStatusLose(String whyloss, int id) {
		iod.updateStatusLose(whyloss, id);
	}

	@Override
	public List<Object[]> selectsummoney() {
		return iod.selectsummoney();
	}

}
