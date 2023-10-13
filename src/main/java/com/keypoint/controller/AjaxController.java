package com.keypoint.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.CustomerService;
import com.keypoint.service.EmployeeService;


@RestController
public class AjaxController {

	
//	CustomerService 객체생성
//	EmployeeService 객체생성
	@Inject
	private CustomerService customerService;
	@Inject
	private EmployeeService employeeService;
	
	
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
	
	
//	--------------------------------------------------------------------------
	
// 사원등록 - 중복확인(연락처, 내선번호, 이메일)
		@GetMapping("/employee/empCheck")
		public ResponseEntity<String> empCheck(HttpServletRequest request) {
		    System.out.println("AjaxController empPhoneCheck()");
		    
		    String empPhone = request.getParameter("empPhone");
		    String empTel = request.getParameter("empTel");
		    String empEmail = request.getParameter("empEmail");
		    String type = request.getParameter("type");
		    
		    String result ="";
		    String emp  = "";
		    
		    System.out.println(empPhone);
		    System.out.println(empTel);
		    System.out.println(empEmail);
		    System.out.println(type);
		
		    if (type.equals("phone")) {
		    	emp = empPhone;
		    }
		    
		    else if(type.equals("tel")) {
		    	emp = empTel;
		    }
		    
		    else if(type.equals("email")) {
		    	emp = empEmail;
		    }
		    
		    if (employeeService.empCheck(type,emp) != null) {
		        result = "iddup";
		    } else {
		        result = "idok";
		    }
		    ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		    
		    return entity;
		} // empCheck
	
	
} // calss
