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

//	가상주소 http://localhost:8080/keypoint/product/productList
	@GetMapping("/productList")
	public String productList() {
		// WEB-INF/views/product/productList.jsp
		return "product/productList";
	}// productList [완제품등록]
	
	@GetMapping("/productInsert")
	public String productInsert() {
		return "product/productInsert";
	}// productInsert [완제품등록]	
	
	@GetMapping("/productUpdate")
	public String productUpdate() {
		return "product/productUpdate";
	}// productUpdate [완제품수정]
	
	@GetMapping("/addUnit")
	public String addUnit() {
		return "product/addUnit";
	}// addUnit [단위추가]
	
	

	@GetMapping("/addstock")
	public String addstock() {
		
		// WEB-INF/views/product/addstock.jsp
		return "product/addstock";
	}// add
	
	@GetMapping("/addunitTEST")
	public String addunitTEST() {
		
		// WEB-INF/views/product/addunitTEST.jsp
		return "product/addunitTEST";
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
