package com.poly.fillter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthFillter {
	
	@GetMapping("login")
	public String getLogin() {
		return"sercurity/login";
	}
	
}
