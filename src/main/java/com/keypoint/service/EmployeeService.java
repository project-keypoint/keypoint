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
	
	
	
	public void insertMember(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService insertMember()");
		employeeDAO.insertMember(employeeDTO);
	}// insert
	
	public void deleteMember(String empId) {
		System.out.println("EmployeeService deleteMember()");
		employeeDAO.deleteMember(empId);
	}// delete

	public void updateMember(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService updateMember()");
		employeeDAO.updateMember(employeeDTO);
	}//update
	

	
	
	
} // 클래스
