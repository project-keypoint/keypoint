package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ProductDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductDTO;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;

	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductService insertProduct()");
		productDAO.insertProduct(productDTO);
	}// insertProduct

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("ProductService getProductList()");
		// 10개씩 가져올 때 현 페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// 끝나는 행번호 구하기
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);			
		return productDAO.getProductList(pageDTO);
	}// getProductList

	public void deleteProduct(ProductDTO productDTO) {
		System.out.println("ProductService deleteProduct()");
		productDAO.deleteProduct(productDTO);
	}// deleteProduct

	public ProductDTO getProduct(String productCode) {
		System.out.println("ProductService getProduct()");
		return productDAO.getProduct(productCode);
	}// getProduct

	public void updateProduct(ProductDTO productDTO) {
		System.out.println("ProductService updateProduct()");
		productDAO.updateProduct(productDTO);
	}// updateProduct

	public int getProductCount(PageDTO pageDTO) {
		System.out.println("ProductService getProductCount()");
		return productDAO.getProductCount(pageDTO);
	}



	
}
