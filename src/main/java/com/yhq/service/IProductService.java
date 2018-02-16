package com.yhq.service;

import java.util.List;

import com.yhq.pojo.Product;
import com.yhq.utils.PageBean;

public interface IProductService {
	
	PageBean<Product> findALLProductPage(int pagenum);
	
	List<Product> findAll();
}
