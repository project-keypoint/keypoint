package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	//productService 객체생성
	@Inject
	private ProductService productService;

//	가상주소 http://localhost:8080/keypoint/product/stock
	@GetMapping("/stock")
	public String stock() {

		// WEB-INF/views/product/stock.jsp
		return "product/stock";
	}// stock

	@GetMapping("/addstock")
	public String addstock() {
		
		// WEB-INF/views/product/addstock.jsp
		return "product/addstock";
	}// add
	
	@GetMapping("/addunit")
	public String addunit() {
		
		// WEB-INF/views/product/addunit.jsp
		return "product/addunit";
	}// addunit
	
//	가상주소 http://localhost:8080/keypoint/product/require
	@GetMapping("/require")
	public String require() {

		// WEB-INF/views/product/require.jsp
		return "product/require";
	}// require

	@GetMapping("/addreq")
	public String addreq() {
		
		// WEB-INF/views/product/addreq.jsp
		return "product/addreq";
	}// addreq
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// class
