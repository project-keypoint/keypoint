
package com.keypoint.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	 // 강수빈 - 비밀번호 값 가져오기
	 public int getInitialPass() {
	        return sqlSession.selectOne(namespace+".getInitialPass");
	    }
	 // 강수빈 - 솔트 값 가져오기
	 public String getEmpSalt(int empId) {
		    return sqlSession.selectOne(namespace + ".getEmpSalt", empId);
		}

	 
	// ---------------------------------------------------------------------------
	 
	// 사원목록(+검색)
	public List<EmployeeDTO> getEmployeeList(PageDTO pageDTO) {
		System.out.println("EmployeeDAO getEmployeeList()");
		
		return sqlSession.selectList(namespace+".getEmployeeList", pageDTO);
	}// getEmployeeList
	
	
	// 페이징(검색) 관련
	public int getEmployeeCount(PageDTO pageDTO) {
	    System.out.println("CustomerDAO getEmployeeCount()");
	    
	    return sqlSession.selectOne(namespace + ".getEmployeeCount", pageDTO);
	} // getEmployeeCount

	
	// 사원등록
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO insertEmployee()");
		
		sqlSession.insert(namespace+".insertEmployee", employeeDTO);
	}// insertEmployee


	// 사원-상세정보 화면보이게
	public EmployeeDTO getEmployeeDetails(int empId) {
		System.out.println("EmployeeDAO getEmployeeDetails()");
		
		return sqlSession.selectOne(namespace+".getEmployeeDetails", empId);
	} // getEmployeeDetails


	// 사원-상세정보 수정하기
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAO updateEmployee()");
		System.out.println(employeeDTO);
		
		sqlSession.update(namespace+".updateEmployee", employeeDTO);
	} // updateEmployee

	
	// 사원등록 - 중복체크(연락처, 내선번호, 이메일)
	public EmployeeDTO empCheck(String type, String Emp) {
		System.out.println("EmployeeDAO empPhoneCheck()");
		if (type.equals("phone")) {
			String empPhone = Emp;
			
			return sqlSession.selectOne(namespace+".empPhoneCheck", empPhone);
		}
		else if(type.equals("tel")) {
			String empTel = Emp;
			
			return sqlSession.selectOne(namespace+".empTelCheck", empTel);
			}
		else if(type.equals("email")) {
			String empEmail = Emp;
			
			return sqlSession.selectOne(namespace+".empEmailCheck", empEmail);
			}
		else {
		return null;
		}
	} // empPhoneCheck

	
	
	
	
	public void resetPassword(Map<String, Object> parameterMap) {
	    System.out.println("Parameter Map: " + parameterMap);
	    sqlSession.update(namespace + ".resetPassword", parameterMap);
	}

	
	
	

	
} // class

