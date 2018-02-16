package com.yhq.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.Product;

public interface IProductDao extends JpaRepository<Product, Serializable> {
	
	
}
