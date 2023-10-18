package com.keypoint.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keypoint.dao.EmployeeDAO;
import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.PageDTO;

@Service
public class EmployeeService {
	
	// MemberDAO 객체생성
	@Inject
	private EmployeeDAO employeeDAO;
	
	
	// -------------------------------------------------------------------
 
	// 로그인-강수빈
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService userCheck()");
		
		return employeeDAO.userCheck(employeeDTO);
	}
	
	// 강수빈 - 비밀번호 값 가져오기
	public int getInitialPass() {
        return employeeDAO.getInitialPass();
    }
	
	
	
	// -------------------------------------------------------------------
	
	// 사원목록(+검색)
	public List<EmployeeDTO> getEmployeeList(PageDTO pageDTO) {
		System.out.println("EmployeeService getEmployeeList");

		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
//		int startRow = (현페이지번호-1)*pageSize + 1;
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
		// 끝나는 행번호 구하기
//		int endRow = startRow + pageSize - 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		// 디비 startRow - 1
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return employeeDAO.getEmployeeList(pageDTO);
	} // getEmployeeList
	
	// 페이징(검색) 관련
	public int getEmployeeCount(PageDTO pageDTO) {
		System.out.println("EmployeeService getEmployeeCount()");
		
		return employeeDAO.getEmployeeCount(pageDTO);
	} // getEmployeeCount
	
	
	// 사원등록
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeService insertEmployee()");
		System.out.println(employeeDTO.getEmpAddress_dtail());
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


	// 사원등록 - 중복체크(연락처, 내선번호, 이메일)
	public EmployeeDTO empCheck(String type, String Emp) {
		System.out.println("EmployeeService EmployeeDTO()"); 
		System.out.println(type);
		
		return employeeDAO.empCheck(type,Emp);
	} // empPhoneCheck


	
	 public void resetPassword(int empId) {
	        Map<String, Object> parameterMap = new HashMap<>();
	        parameterMap.put("empId", empId);
	        parameterMap.put("empPass", empId);
	        employeeDAO.resetPassword(parameterMap);
    }

	 



} // class
