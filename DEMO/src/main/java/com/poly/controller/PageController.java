package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;


import com.poly.dao.ProductsRepo;
import com.poly.model.Products;

@Controller
public class PageController {
	@Autowired
	ProductsRepo repository;
	@GetMapping("/contact-us")
	public String ContactUs() {
		return"contact-us";
	}
	
	@GetMapping("/about-us")
	public String AboutUs() {
		return"about-us";
	}
	
}
