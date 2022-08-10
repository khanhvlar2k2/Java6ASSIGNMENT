package com.poly.Admin.Controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoriesRepo;
import com.poly.dao.OrdersRepo;
import com.poly.dao.ProductColorRepo;
import com.poly.dao.ProductImageRepo;
import com.poly.dao.ProductsRepo;


@Controller
@RequestMapping("admin")
public class indexController {
	@Autowired
	HttpSession session;

	@Autowired
	CategoriesRepo cateRepo;

	@Autowired
	ProductColorRepo colorRepo;

	@Autowired
	ProductImageRepo imageRepo;

	@Autowired
	ProductsRepo productRepo;

	@Autowired
	OrdersRepo orderRepo; 
	
	@GetMapping("")
	public String getIndexAdmin() {
		return"admin/admin_home";
	}
	
	@PostMapping("/edit-product")
	public String postEditProduct() {
		return"admin/admin_edit_product";
	}
	
	@GetMapping("/add-product")
	public String getAddProduct() {
		return"admin/admin_add_product";
	}
	
	@GetMapping("/products-list")
	public String getAllProduct(@RequestParam Optional<Integer> categoryId, @RequestParam Optional<String> sort,
			@RequestParam Optional<Integer> page, Model model) {
		int p = 0;
		if (page.isPresent()) {
			p = page.get();
		}
		Pageable pageable = null;
		if (sort.isPresent() && sort.get().length() > 0) {
			pageable = PageRequest.of(p, 5, Sort.by(sort.get()).descending());
		} else
			pageable = PageRequest.of(p, 5);

		if (categoryId.isPresent()) {
			model.addAttribute("products", productRepo.findByCategoryId(categoryId.get(), pageable));
		} else {
			model.addAttribute("products", productRepo.findAll(pageable));
		}
		model.addAttribute("categories", cateRepo.findAll());
		return "admin/admin_product_list";
	}
}
