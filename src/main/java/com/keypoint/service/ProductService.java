package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ProductDAO;
import com.keypoint.dto.ProductDTO;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;

	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductService insertProduct()");
		productDAO.insertProduct(productDTO);
	}// insertProduct

	public List<ProductDTO> getProductList() {
		System.out.println("ProductService getProductList()");
		return productDAO.getProductList();
	}// getProductList

	
}
