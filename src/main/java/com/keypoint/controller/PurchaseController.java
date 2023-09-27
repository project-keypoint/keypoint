package com.keypoint.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.service.PurchaseService;


@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	//productService 객체생성
	@Inject
	private PurchaseService purchaseService;
	

	@GetMapping("/test1")
	public String test1() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/test1";
	}//
	@GetMapping("/test2")
	public String test2() {
		
		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/test2";
	}//
	
	@GetMapping("/test3")
	public String test3() {
		
		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/test3";
	}//
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
