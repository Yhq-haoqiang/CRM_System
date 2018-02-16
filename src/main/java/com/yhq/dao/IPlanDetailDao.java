package com.yhq.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.PlanDetail;

public interface IPlanDetailDao extends JpaRepository<PlanDetail, Serializable> {
	
	//Page<PlanDetail> findBy
}
