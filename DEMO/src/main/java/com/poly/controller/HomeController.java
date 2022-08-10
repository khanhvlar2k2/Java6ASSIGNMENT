package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ProductsRepo;
import com.poly.model.ProductColor;
import com.poly.model.Products;

@Controller
public class HomeController {
	@Autowired
	ProductsRepo repo;
	@GetMapping("")
	public String getIndexOnce(Model model) {
		model.addAttribute("items", repo.findByTop());
		model.addAttribute("items3", repo.findByTop3());
		return"index";
	}
	@GetMapping("/home")
	public String getIndexTow(Model model) {
		model.addAttribute("items", repo.findByTop());
		model.addAttribute("items3", repo.findByTop3());
		return"index";
	}
	
}
