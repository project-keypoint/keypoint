package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.QualityDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.CustomerService;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {

	
//	CustomerService 객체생성
	@Inject	
	private CustomerService customerService;
	
	
	
	
//	---------------------------------------------------------------------
//	거래처리스트
	@GetMapping("/cusList")
	public String cusList(Model model) {
		System.out.println("CustomerController cusList()");
		
		List<CustomerDTO> cusList = customerService.getCusList();
		model.addAttribute("cusList", cusList);
		
		return "customer/cusList";
	}
	
	
	
//	거래처등록화면
	@GetMapping("/cusInsert")
	public String cusInsert() {
		System.out.println("CustomerController cusInsert()");
		
		return "customer/cusInsert";
	}
	
	
//	거래처등록하기
	@PostMapping("/cusInsertPro")
	public String cusInsertPro(CustomerDTO customerDTO ) {
		System.out.println("CustomerController cusInsertPro()");
		System.out.println(customerDTO);
		
		customerService.insertCustomer(customerDTO);
		
		
		
		if(customerDTO != null) {
			return "receive/msgSuccess"; // 등록완료->수정해야함
		}else {
			return "receive/msgFailed"; // 등록실패->수정해야함
		}
	}
	
	
	
//	거래처상세보기
	@GetMapping("/cusDetails")
	public String cusDetails(Model model, @RequestParam("cusCode") String cusCode) {
		System.out.println("CustomerController cusInsertPro()");
		
		CustomerDTO customerDTO = customerService.getCustomerDetails(cusCode);
		
		model.addAttribute("customerDTO", customerDTO);
		
		return "customer/cusDetails";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
