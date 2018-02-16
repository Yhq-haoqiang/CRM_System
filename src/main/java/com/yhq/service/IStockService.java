package com.yhq.service;

import com.yhq.pojo.Stock;
import com.yhq.utils.PageBean;

public interface IStockService {
	
	PageBean<Stock> getAllPage(int pagenum);
}
