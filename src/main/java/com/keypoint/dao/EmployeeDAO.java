package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.ReceiveDTO;

@Repository
public class EmployeeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.employeeMapper";
	
	
	// 사원목록
	public List<EmployeeDTO> getEmployeeList() {
		System.out.println("EmployeeDAO getEmployeeList()");
		return sqlSession.selectList(namespace+".getEmployeeList");
	}// getEmployeeList
	
	
	
	// 사원등록
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO insertEmployee()");
		
		sqlSession.insert(namespace+".insertEmployee", employeeDTO);
	}// insertEmployee

	// 왜 푸시가 안되지?
	// 사원-상세정보
	public EmployeeDTO getEmployeeDetails(int empId) {
		System.out.println("EmployeeDAO getEmployeeDetails()");
		
		return sqlSession.selectOne(namespace+".getEmployeeDetails", empId);
	} // getEmployeeDetails

	
//	// 사원수정
//	public void updateEmployee(EmployeeDTO employeeDTO) {
//		System.out.println("EmployeeDAO updateEmployee()");
//		
//		sqlSession.update(namespace+".updateEmployee", employeeDTO);
//	}// updateEmployee
	

	
//	public void deleteMember(String empId) {
//	System.out.println("EmployeeDAO deleteMember()");
//	sqlSession.update(namespace+".deleteMember", empId);
//}//deleteMember
	
	
	
	
	
} // 클래스

