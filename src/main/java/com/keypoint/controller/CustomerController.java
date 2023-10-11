package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.PageDTO;
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
	public String cusList(HttpServletRequest request, Model model) {
		System.out.println("CustomerController cusList()");
		
//		한 화면에 보여줄 글 개수 설정
		int pageSize = 10;
		
//		현재의 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		
//		페이지 번호 없을 경우 -> "1"로 설정
		if (pageNum == null) {
			pageNum = "1";
		}

//		페이지 번호 -> 정수형으로
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<CustomerDTO> cusList = customerService.getCusList(pageDTO);
		
		
//		거래처 전체 등록 개수 가져오기
		int count = customerService.getCusCount();
		
//		한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		
//		시작하는 페이지 번호
		int startPage = (currentPage -1)/pageBlock*pageBlock+1;
		
//		끝나는 페이지 번호
		int endPage = startPage+pageBlock-1;
		
//		전체페이지 개수
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		
//		끝나는 페이지 번호 / 전체페이지 개수 비교 
//		ㄴ> 끝나는 페이지가 크면 전체 페이지 개수로 변경
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
//		pageDTO에 담기
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("cusList", cusList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("cusCount", count);
		
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
			return "customer/msgSuccess"; // 등록완료
		}else {
			return "customer/msgFailed"; // 등록실패
		}
	}
	
	
	

//	거래처상세
	@GetMapping("/cusDetails")
	public String cusDetails(Model model, @RequestParam("cusCode") String cusCode) {
		System.out.println("CustomerController cusDetails()");
		
		CustomerDTO customerDTO = customerService.getCusDetails(cusCode);
		
		model.addAttribute("customerDTO", customerDTO);
		
		return "customer/cusDetails";
	}
	
	
	
	
//	거래처수정화면
	@GetMapping("/cusUpdate")
	public String cusUpdate(Model model, @RequestParam("cusCode") String cusCode) {
		System.out.println("CustomerController cusUpdate()");
		
		CustomerDTO customerDTO = customerService.getCusDetails(cusCode);
		
		model.addAttribute("customerDTO", customerDTO);
	
		return "customer/cusUpdate";
	}	
	
	
	
//	거래처수정
	@PostMapping("/cusUpdatePro")
	public String cusUpdatePro(CustomerDTO customerDTO) {
		System.out.println("CustomerController cusUpdatePro");
		System.out.println(customerDTO);
		
		customerService.updateCustomer(customerDTO);
		
		
		if(customerDTO != null) {
			return "customer/msgSuccess"; // 등록완료
		}else {
			return "customer/msgFailed"; // 등록실패
		}
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
