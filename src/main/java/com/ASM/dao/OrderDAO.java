package com.ASM.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ASM.entity.Account;
import com.ASM.entity.Order;
import com.ASM.entity.Product;



public interface OrderDAO extends JpaRepository<Order, Long> {
	 Page<Order> findByAccount(Account account, Pageable pageable);

	    Order findById(Integer id);

	

}
