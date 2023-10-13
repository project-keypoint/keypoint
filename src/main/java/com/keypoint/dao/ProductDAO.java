package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
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

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("ProductDAO getProductList()");
		return sqlSession.selectList(namespace+".getProductList", pageDTO);
	}// getProductList

	public void deleteProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO deleteProduct()");
		sqlSession.update(namespace+".deleteProduct", productDTO);
	}// deleteProduct

	public ProductDTO getProduct(String productCode) {
		System.out.println("ProductDAO getProduct()");
		return sqlSession.selectOne(namespace+".getProduct", productCode);
	}// getProduct

	public void updateProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO updateProduct()");
		sqlSession.update(namespace+".updateProduct", productDTO);
	}// updateProduct

	public int getProductCount(PageDTO pageDTO) {
		System.out.println("ProductDAO getProductCount()");
		return sqlSession.selectOne(namespace+".getProductCount", pageDTO);
	}

	
	
	
	
	
}
