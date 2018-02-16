package com.yhq.dao;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yhq.pojo.Ser;

public interface ISerDao extends JpaRepository<Ser, Serializable> {
	
	Page<Ser> findByStatus(int status,Pageable pageable);
	
	@Modifying
	@Query("update Ser s set s.status = :status , s.dis_date = now() , s.dis_name = :disname  where s.id = :id")
	void updateDisName(@Param("status")int status,@Param("disname")String name,@Param("id")int id);
	
	int countByStatus(int status);
	
	@Modifying
	@Query("update Ser s set s.handle = :handle , s.handle_date = :handle_date , s.handle_name = :handle_name , s.status = 2  where s.id = :id")
	void updateHandel(@Param("handle")String handle,@Param("handle_date")Date handle_date,@Param("handle_name")String handle_name  ,@Param("id")int id);
	
	@Modifying
	@Query("update Ser s set s.status = 3 , s.handle_result = :handle_result , s.satisfaction = :Satisfaction  where s.id = :id")
	void updateFeedBack(@Param("handle_result")String handle_result,@Param("Satisfaction")String Satisfaction,@Param("id")int id);

}
