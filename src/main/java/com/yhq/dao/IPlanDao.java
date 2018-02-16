package com.yhq.dao;

import java.io.Serializable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yhq.pojo.Plan;

public interface IPlanDao extends JpaRepository<Plan, Serializable> {
	
	@Query("select p from Plan p where p.opp_id = :opp_id ")
	Page<Plan> findByOpp_Id(@Param("opp_id")int oppid,Pageable pageable);
	
	@Query("select count(p.id) from Plan p where p.opp_id = :opp_id ")
	int countByOpp_Id(@Param("opp_id")int oppid);
}
