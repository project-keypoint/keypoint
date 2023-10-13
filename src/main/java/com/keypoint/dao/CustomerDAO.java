package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.CustomerDTO;
import com.keypoint.dto.PageDTO;

@Repository
public class CustomerDAO {
	
//	SqlSession 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.customerMapper";
	
	
	
//	----------------------------------------------------------------------------
//	거래처리스트	
	public List<CustomerDTO> getCusList(PageDTO pageDTO) {
		System.out.println("CustomerDAO getCusList()");
		
		return sqlSession.selectList(namespace+".getCusList", pageDTO);
	}


//	거래처등록
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerDAO insertCustomer()");
		
		sqlSession.insert(namespace+".insertCustomer", customerDTO);
		
	}


//	거래처상세
	public CustomerDTO getCusDetails(String cusCode) {
		System.out.println("CustomerDAO getCusDetails()");
		
		return sqlSession.selectOne(namespace+".getCusDetails", cusCode);
	}


//	거래처수정
	public void updateCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerDAO updateCustomer()");
		System.out.println(customerDTO);

		sqlSession.update(namespace+".updateCustomer", customerDTO);
	}


//	사업자번호 중복체크
	public CustomerDTO cusNumberCheck(String cusNumber) {
		System.out.println("CustomerDAO cusNumberCheck()");

		return sqlSession.selectOne(namespace+".cusNumberCheck", cusNumber);
	}


//	전체 거래처 수
	public int getCusCount() {
		System.out.println("CustomerDAO getCusCount()");

		return sqlSession.selectOne(namespace+".getCusCount");
	}


//	'등록'인 거래처 개수 	
	public int getInsertCount() {
		System.out.println("CustomerDAO getInsertCount()");

		return sqlSession.selectOne(namespace+".getInsertCount");
	}



	
	
	
	
	
	
	
	
	
}
