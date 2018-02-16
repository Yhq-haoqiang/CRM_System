package com.yhq.utils;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public class PageUtils {

	/**
	 * 获得一个计算好的Pageable对象
	 * 
	 * @param count
	 *            总条目数
	 * @param pagenum
	 *            当前页
	 * @return
	 */
	public static <T> Pageable getPageable(long count, int pagenum) {
		if (pagenum == 0) {
			pagenum = 1;
		}
		PageBean<T> bean = new PageBean<>();
		int counts = (int) count % bean.getNumOfPage() == 0 ? (int) count / bean.getNumOfPage()
				: (int) count / bean.getNumOfPage() + 1;
		if (pagenum >= count) {
			pagenum = counts;
		}
		Pageable pageable = new PageRequest(pagenum - 1, bean.getNumOfPage());
		return pageable;
	}
}
