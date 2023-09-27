package com.keypoint.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ProductDAO;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;
	
}
