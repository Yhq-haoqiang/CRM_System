package com.yhq.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yhq.pojo.Contacts;

public interface IContactsDao extends JpaRepository<Contacts,Serializable> {
	
	List<Contacts> findByOppid(Integer oppid);

}
