package com.yhq.service;

import java.util.List;

import com.yhq.pojo.Dict;
import com.yhq.utils.PageBean;

public interface IDictService {
	
	List<Dict> getAllDict();
	
	long getCount();
	
	PageBean<Dict> getDictByPage(int pagenum);
	
	void saveAndUpdateDict(Dict dict);
	
	Dict findById(int id);
	
	void deleteDictById(int id);
	
	PageBean<Dict> queryDictByPage(Dict dict);
	
	
	List<Dict> findByCategory(String category);
	
}
