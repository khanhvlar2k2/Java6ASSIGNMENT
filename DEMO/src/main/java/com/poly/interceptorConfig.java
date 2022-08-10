package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.Golballinterceptor;

@Configuration
public class interceptorConfig implements WebMvcConfigurer {
	@Autowired
	Golballinterceptor globallinterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(globallinterceptor).addPathPatterns("/**").excludePathPatterns("/rest/**", "/admin/**",
				"/assets/**");
	}
}
