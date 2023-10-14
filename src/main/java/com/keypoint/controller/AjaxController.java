package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.NoticeDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.service.CustomerService;
import com.keypoint.service.EmployeeService;
import com.keypoint.service.NoticeService;


@RestController
public class AjaxController {

	
//	CustomerService 객체생성
//	EmployeeService 객체생성
	@Inject
	private CustomerService customerService;
	@Inject
	private EmployeeService employeeService;
	@Inject
	private NoticeService noticeService;
	
	
	
	
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
	
	

	
		
		//	가상주소 http://localhost:8080/FunWeb/notice/recentNotice
//		@RequestMapping(value = "/notice/recentNotice", method = RequestMethod.GET)
		@GetMapping("/notice/recentNotice")
		public ResponseEntity<List<NoticeDTO>> recentNotice() {
			//ResponseEntity : 응답출력결과 저장하는 파일 제공
			System.out.println("AjaxController recentNotice()");
			//페이징처리(최근글 5개)
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(5);
			pageDTO.setPageNum("1");
			pageDTO.setCurrentPage(1);
			
	List<NoticeDTO> noticeList = noticeService.getNoticeList(pageDTO);
			// List<BoardDTO> boardList 
//	           => json변경하는 프로그램설치(jackson-databind 설치)
//	           => 자동으로 json 으로 변경
			
			//출력 => 결과 가지고 join.jsp 이동(되돌아감)
	ResponseEntity<List<NoticeDTO>> entity = new 
	ResponseEntity<List<NoticeDTO>>(noticeList, HttpStatus.OK);
			
			return entity;
		}//
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
} // calss
