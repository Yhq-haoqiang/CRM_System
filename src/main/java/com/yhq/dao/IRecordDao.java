package com.yhq.dao;

import java.io.Serializable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.Record;

public interface IRecordDao extends JpaRepository<Record, Serializable>{
	
	Page<Record> findByOppid(int oppid,Pageable pageable);
	
	int countByOppid(int oppid);
}
