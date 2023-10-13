package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.CustomerDAO;
import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.PageDTO;



@Service
public class CustomerService {
	
	
//	CustomerDAO 객체생성
	@Inject
	private CustomerDAO customerDAO;
	
	
	
	
//	-------------------------------------------------------------
//	거래처리스트
	public List<CustomerDTO> getCusList(PageDTO pageDTO) {
		System.out.println("CustomerService getCusList()");
		
//		10개씩 가져올 때, 현페이지에 대한 시작하는 행번호 구하기
//		int startRow = (현재페이지번호 -1) * pageSize + 1;
		int startRow = (pageDTO.getCurrentPage() -1) * pageDTO.getPageSize() + 1;
		
//		끝나는 행 번호 구하기
//		int endRow = startRow + pageSize -1;
		int endRow = startRow + pageDTO.getPageSize() -1;
		
//		디비 startRow -1
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(endRow);
		
		return customerDAO.getCusList(pageDTO);
	}



//	거래처등록
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerService insertCustomer()");

		customerDAO.insertCustomer(customerDTO);
	}



//	거래처상세
	public CustomerDTO getCusDetails(String cusCode) {
		System.out.println("CustomerService getCusDetails()");

		return customerDAO.getCusDetails(cusCode);
	}


//	거래처수정
	public void updateCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerService updateCustomer()");
		
		customerDAO.updateCustomer(customerDTO);
		
	}


//	사업자번호 중복체크
	public CustomerDTO cusNumberCheck(String cusNumber) {
		System.out.println("CustomerService cusNumberCheck()");

		return customerDAO.cusNumberCheck(cusNumber);
	}


//	모든 거래처 수
	public int getCusCount() {
		System.out.println("CustomerService getCusCount()");
		
		return customerDAO.getCusCount();
	}


//	'등록'인 거래처 수
	public int getInsertCount() {
		System.out.println("CustomerService getInsertCount()");

		return customerDAO.getInsertCount();
	}






	
	
	
	
	
	
	
	
	
	
	
}
