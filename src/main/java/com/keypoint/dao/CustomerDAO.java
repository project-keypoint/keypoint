package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.CustomerDTO;

@Repository
public class CustomerDAO {
	
//	SqlSession 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.customerMapper";
	
	
	
//	----------------------------------------------------------------------------
//	거래처리스트	
	public List<CustomerDTO> getCusList() {
		System.out.println("CustomerDAO getCusList()");
		
		return sqlSession.selectList(namespace+".getCusList");
	}


//	거래처등록
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerDAO insertCustomer()");
		
		sqlSession.insert(namespace+".insertCustomer", customerDTO);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
