package com.yhq.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.Stock;

public interface IStockDao extends JpaRepository<Stock, Serializable> {

}
