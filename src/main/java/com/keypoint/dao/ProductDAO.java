package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.ProductDTO;

@Repository
public class ProductDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.productMapper";

	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO insertProduct()");
		sqlSession.insert(namespace+".insertProduct", productDTO);
	}// insertProduct

	public List<ProductDTO> getProductList() {
		System.out.println("ProductDAO getProductList()");
		return sqlSession.selectList(namespace+".getProductList");
	}// getProductList

	public void deleteProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO deleteProduct()");
		sqlSession.update(namespace+".deleteProduct", productDTO);
	}// deleteProduct

	public ProductDTO getProduct(String productCode) {
		System.out.println("ProductDAO getProduct()");
		return sqlSession.selectOne(namespace+".getProduct", productCode);
	}

	
	
	
	
	
}
