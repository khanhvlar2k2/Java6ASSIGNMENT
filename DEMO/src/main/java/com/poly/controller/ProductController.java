package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoriesRepo;
import com.poly.dao.ProductsRepo;
import com.poly.model.ProductColor;
import com.poly.model.Products;


@Controller
public class ProductController {

	
	@Autowired
	ProductsRepo prodRepository;
	
	@GetMapping("/shopping-products")
	public String getShopping(Model model,@RequestParam("cid") Optional<Integer> cid) {
		if (cid.isPresent()) {
			model.addAttribute("products", prodRepository.findByCategoryId(cid.get()));
		}else {
			model.addAttribute("products", prodRepository.findAll());
			
		}
		return"shopping";
	}
	
	@GetMapping("/shopping-products/detail/{slug}")
	public String getProductDetail(@PathVariable Optional<String> slug, Model model) {
		if (slug.isPresent()) {
			Products product = prodRepository.findBySlug(slug.get());
			ProductColor color = product.getColors().get(0);
			model.addAttribute("product", product);
			model.addAttribute("color", color);
			model.addAttribute("products", prodRepository.findAll());
			model.addAttribute("topList", prodRepository.findByTop());
			return "product-detail";
		} else
			return "redirect:/shopping-products";
	}
}
