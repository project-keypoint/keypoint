package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.PageDTO;

@Repository
public class EmployeeDAO {
	
	// 마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.employeeMapper";
	
	
	// ---------------------------------------------------------------------------

	
	// 로그인-강수빈
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO userCheck()");
		return sqlSession.selectOne(namespace+".userCheck", employeeDTO);
	}
	
	// 사원목록
	public List<EmployeeDTO> getEmployeeList(PageDTO pageDTO) {
		System.out.println("EmployeeDAO getEmployeeList()");
		
		return sqlSession.selectList(namespace+".getEmployeeList", pageDTO);
	}// getEmployeeList
	
	public int getEmployeeCount() {
		System.out.println("CustomerDAO getEmployeeCount()");

		return sqlSession.selectOne(namespace+".getEmployeeCount");
	} // getEmployeeCount
	
	
	// 사원등록
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO insertEmployee()");
		
		sqlSession.insert(namespace+".insertEmployee", employeeDTO);
	}// insertEmployee


	// 사원-상세정보
	public EmployeeDTO getEmployeeDetails(int empId) {
		System.out.println("EmployeeDAO getEmployeeDetails()");
		
		return sqlSession.selectOne(namespace+".getEmployeeDetails", empId);
	} // getEmployeeDetails


	// 사원-상세정보수정
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO updateEmployee()");
		System.out.println(employeeDTO);
		
		sqlSession.update(namespace+".updateEmployee", employeeDTO);
	} // updateEmployee

	
	//	사원 등록 - 연락처 중복체크
	public EmployeeDTO empPhoneCheck(String empPhone) {
		System.out.println("EmployeeDAO empPhoneCheck()");
		
		return sqlSession.selectOne(namespace+".empPhoneCheck", empPhone);
	} // empPhoneCheck

	 public int getInitialPass() {
	        return sqlSession.selectOne(namespace+".getInitialPass");
	    }

	
	
	






	

	
	
	
	
} // class

