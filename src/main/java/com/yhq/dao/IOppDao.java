package com.yhq.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yhq.pojo.Opp;

public interface IOppDao extends JpaRepository<Opp, Serializable> {

	Page<Opp> findByStatus(int status, Pageable pageable);

	int countByStatus(int status);

	@Modifying
	@Query("update Opp o set o.status = :status where o.id = :id")
	void updateStatus(@Param("status") int status, @Param("id") int id);

	Page<Opp> findByStatusNot(int status, Pageable pageable);

	int countByStatusNot(int status);

	@Modifying
	@Query("update Opp o set o.status = 3,o.reprieve = :reprieve where o.id = :id")
	void updateStatusAndReprieve(@Param("reprieve") String reprieve, @Param("id") int id);

	@Modifying
	@Query("update Opp o set o.status = 4,o.losedate = now(),o.whyloss = :whyloss where o.id = :id")
	void updateStatusLose(@Param("whyloss") String whyloss, @Param("id") int id);

	@Query(value = "SELECT "
			+ "t.customer"
			+ ",sum(t.money)"
			+ "FROM"
			+ "(SELECT "
			+ "o.customer AS customer,sp.counts * bp.price AS money "
			+ "FROM "
			+ "sale_opp o "
			+ "LEFT JOIN sale_plan p ON o.id = p.opp_id "
			+ "LEFT JOIN sale_plandetail sp ON p.id = sp.plan_id "
			+ "LEFT JOIN base_product bp ON sp.product_id = bp.id "
			+ "WHERE o.`status` = 2 ) AS t GROUP BY customer",nativeQuery=true)
	List<Object[]> selectsummoney();

}
