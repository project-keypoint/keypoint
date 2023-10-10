package com.keypoint.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keypoint.dto.CustomerDTO;
import com.keypoint.service.CustomerService;


@RestController
public class AjaxController {

	
//	CustomerService 객체생성
	@Inject
	private CustomerService customerService;
	
	
//	--------------------------------------------------------------------------
//	사업자번호 중복확인
	@GetMapping("/customer/cusNumberCheck")
	public ResponseEntity<String> cusNumberCheck(HttpServletRequest request) {
//		ResponseEntity : 응답/출력 결과를 저장하는 파일 제공
		System.out.println("AjaxController cusNumberCheck()");
		
		String cusNumber = request.getParameter("cusNumber");
		CustomerDTO customerDTO = customerService.cusNumberCheck(cusNumber);
		String result = "";
		
		if (customerDTO != null) {
//			사업자번호 있음 -> 중복
			result = "iddup";
			
		} else {
//			사업자번호 없음 -> 사용가능
			result = "idok";
		}
		
//		출력 -> 결과를 가지고 돌아가는 개념
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
		
	}
	
	
	
	
	
	
	
	
}
