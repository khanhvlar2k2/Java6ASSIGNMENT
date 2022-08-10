package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.model.ProductImage;


@Repository
public interface ProductImageRepo extends JpaRepository<ProductImage, Integer>{
}
