package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.EmployeeDTO;

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
	
	
	
	
	public void insertMember(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO insertMember()");
		sqlSession.insert(namespace+".insertMember", employeeDTO);
	}// insertMember

	public void deleteMember(String empId) {
		System.out.println("EmployeeDAO deleteMember()");
		sqlSession.update(namespace+".deleteMember", empId);
	}//deleteMember
	
	public void updateMember(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO updateMember()");
		sqlSession.update(namespace+".updateMember", employeeDTO);
	}//updateMember
	

	
} // 클래스

