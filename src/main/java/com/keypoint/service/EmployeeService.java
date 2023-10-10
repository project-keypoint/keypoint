package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.EmployeeDAO;
import com.keypoint.dto.EmployeeDTO;

@Service
public class EmployeeService {
	
	@Inject
	private EmployeeDAO employeeDAO;
	
	
	// 사원목록
	public List<EmployeeDTO> getEmployeeList() {
		System.out.println("EmployeeService getEmployeeList");

		return employeeDAO.getEmployeeList();
	} // getEmployeeList
	
	
	// 사원등록
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService insertEmployee()");
		
		employeeDAO.insertEmployee(employeeDTO);
	}// insertEmployee


	// 사원 - 상세정보
	public EmployeeDTO getEmployeeDetails(int empId) {
		System.out.println("EmployeeService getEmployeeDetails()");
		
		return employeeDAO.getEmployeeDetails(empId);
	} // getEmployeeDetails


	// 사원 - 상세정보수정
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService updateEmployee()");

		employeeDAO.updateEmployee(employeeDTO);
	} // updateEmployee

	
	
	// 로그인-강수빈
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService userCheck()");
		
		return employeeDAO.userCheck(employeeDTO);
	}



	
} // class
