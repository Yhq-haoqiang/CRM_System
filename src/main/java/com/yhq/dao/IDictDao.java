package com.yhq.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.Dict;

public interface IDictDao extends JpaRepository<Dict, Serializable>{
	
	List<Dict> findByCategoryLikeAndEntryLikeAndValuesLike(String category,String entry,String values);
	
	List<Dict> findByEntryLikeAndValuesLike(String entry,String values);
	
	List<Dict> findByCategoryLikeAndEntryLike(String category,String entry);
	
	List<Dict> findByCategoryLikeAndValuesLike(String category,String values);
	
	List<Dict> findByCategoryLike(String category);
	
	List<Dict> findByEntryLike(String entry);
	
	List<Dict> findByValuesLike(String values);
	
	List<Dict> findByCategory(String category);
	
}
