package com.poly.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.model.Products;



@Repository
public interface ProductsRepo extends JpaRepository<Products, Integer>{
	Products findBySlug(String slug);

	List<Products> findByCategoryIsMale(boolean gender);

	List<Products> findByCategoryId(Integer categoryId , Sort sort);
	
	
	Page<Products> findAll(Pageable pageable);

	Page<Products> findByCategoryId(Integer categoryId, Pageable pageable);
	
	@Query(value = "SELECT TOP 8 * FROM Products order by NEWID()", nativeQuery = true)
	List<Products> findByTop();
	
	@Query(value = "SELECT TOP 3 * FROM Products order by NEWID()", nativeQuery = true)
	List<Products> findByTop3();
	
	
    @Query("SELECT p FROM Products p WHERE p.category.id=?1")
	List<Products> findByCategoryId(Integer cid);
	
}
