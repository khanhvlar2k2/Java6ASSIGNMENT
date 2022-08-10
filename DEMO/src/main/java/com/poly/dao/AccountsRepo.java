package com.poly.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.model.Accounts;



@Repository
public interface AccountsRepo extends JpaRepository<Accounts, String>{
	
	Optional<Accounts> findByEmail(String email);
	
	List<Accounts> findByIsAdmin(boolean role);
}
