package com.yhq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.yhq.dao.IDictDao;
import com.yhq.pojo.Dict;
import com.yhq.service.IDictService;
import com.yhq.utils.PageBean;

@Service
public class DictServiceImpl implements IDictService {

	@Resource
	private IDictDao idd;
	
	@Override
	public List<Dict> getAllDict() {
		return idd.findAll();
	}

	@Override
	public long getCount() {
		return idd.count();
	}

	@Override
	public PageBean<Dict> getDictByPage(int pagenum) {
		if(pagenum <= 0){
			pagenum = 1;
		}
		PageBean<Dict> bean = new PageBean<>();
		int count = (int)getCount() % bean.getNumOfPage() == 0 ? (int)getCount() / bean.getNumOfPage() : (int)getCount() / bean.getNumOfPage() + 1;
		if(pagenum >= count){
			pagenum = count;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		Page<Dict> page = idd.findAll(pageable);
		bean.setPageInfo(page.getContent());
		bean.setCurrentPage(pagenum);
		bean.setTotalPage(count);
		bean.setTotalCount(getCount());
		return bean;
	}

	@Override
	public void saveAndUpdateDict(Dict dict) {
		idd.saveAndFlush(dict);
	}

	@Override
	public Dict findById(int id) {
		return idd.findOne(id);
	}

	@Override
	public void deleteDictById(int id) {
		idd.delete(id);
	}

	@Override
	public PageBean<Dict> queryDictByPage(Dict dict) {
		if(dict == null){
			throw new RuntimeException("Dict can not is null.");
		}
		String category = dict.getCategory();
		String entry = dict.getEntry();
		String values = dict.getValues();
		return maybe(category, entry, values);
	}

	/**
	 * 封装模糊查询下的pagebean 返回的都是1页
	 * @param list
	 * @return
	 */
	private PageBean<Dict> getPageBean(List<Dict> list){
		PageBean<Dict> bean = new PageBean<>();
		bean.setPageInfo(list);
		bean.setCurrentPage(1);
		bean.setNumOfPage(list.size());
		bean.setTotalCount(list.size());
		bean.setTotalPage(1);
		return bean;
	}
	
	
	
	/**
	 * 处理各种可能的查询
	 * @param category 类型
	 * @param entry 条目
	 * @param values 值
	 * @return 如果三个参数都为null或者空，则返回null
	 */
	private PageBean<Dict> maybe(String category,String entry,String values){
		if(category != null && !category.isEmpty() ){
			if(entry != null && !entry.isEmpty()){
				if(values != null && !values.isEmpty()){
					List<Dict> list = idd.findByCategoryLikeAndEntryLikeAndValuesLike("%" + category + "%", "%" + entry + "%", "%" + values + "%");
					return getPageBean(list);
				}else{
					List<Dict> list = idd.findByCategoryLikeAndEntryLike("%" + category + "%", "%" + entry + "%");
					return getPageBean(list);
				}
			}else if(values != null && !values.isEmpty()){
				List<Dict> list = idd.findByCategoryLikeAndValuesLike("%" + category + "%", "%" + values + "%");
				return getPageBean(list);
			}
			List<Dict> list = idd.findByCategoryLike("%" + category + "%");
			return getPageBean(list);
		}else if(entry != null && !entry.isEmpty()){
			if(values != null && !values.isEmpty()){
				List<Dict> list = idd.findByEntryLikeAndValuesLike("%" + entry + "%", "%" + values + "%");
				return getPageBean(list);
			}
			List<Dict> list = idd.findByEntryLike("%" + entry + "%");
			return getPageBean(list);
		}else if(values != null && !values.isEmpty()){
			List<Dict> list = idd.findByValuesLike("%" + values + "%");
			return getPageBean(list);
		}
		return null;
	}

	@Override
	public List<Dict> findByCategory(String category) {
		return idd.findByCategory(category);
	}

}
