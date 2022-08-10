package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.model.Categories;



@Repository
public interface CategoriesRepo extends JpaRepository<Categories, Integer>{
	Categories findByName(String name);
	
	List<Categories> findByIsMale(boolean gender);
}
