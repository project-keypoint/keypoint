package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.CustomerDAO;
import com.keypoint.dto.CustomerDTO;



@Service
public class CustomerService {
	
	
//	CustomerDAO 객체생성
	@Inject
	private CustomerDAO customerDAO;
	
	
	
	
//	-------------------------------------------------------------
//	거래처리스트
	public List<CustomerDTO> getCusList() {
		System.out.println("CustomerService getCusList()");
		
		return customerDAO.getCusList();
	}



//	거래처등록
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerService insertCustomer()");

		customerDAO.insertCustomer(customerDTO);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
