package com.poly.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.model.Orders;



@Repository
public interface OrdersRepo extends JpaRepository<Orders, Integer>{


	Page<Orders> findByStatus(Integer status, Pageable pageable);

	Page<Orders> findByAccountUsername(String username, Pageable pageable);
}
