package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.ProductDTO;
import com.keypoint.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	//productService 객체생성
	@Inject
	private ProductService productService;
	
	@GetMapping("/addUnit")
	public String addUnit() {
		return "product/addUnit";
	}// addUnit [단위추가]

//	가상주소 http://localhost:8080/keypoint/product/productList
	@GetMapping("/productList")
	public String productList(Model model) {
		List<ProductDTO> productList = productService.getProductList();
		model.addAttribute("productList", productList);
		// WEB-INF/views/product/productList.jsp
		return "product/productList";
	}// productList [완제품목록]
	
	@GetMapping("/productInsert")
	public String productInsert() {
		return "product/productInsert";
	}// productInsert [완제품등록]
	
	@PostMapping("/productInsertPro")
	public String productInsertPro(ProductDTO productDTO) {
		System.out.println("ProductController productInsertPro()");
		//회원가입 처리
		System.out.println(productDTO);
		
		productService.insertProduct(productDTO);
		
		return "product/close";
	}// productInsertPro [완제품등록]
	
	@GetMapping("/productUpdate")
	public String productUpdate() {
		return "product/productUpdate";
	}// productUpdate [완제품수정]
	
	@GetMapping("/productDelete")
	public String productDelete(HttpServletRequest request,Model model) {
		System.out.println("ProductController productDelete()");
		
		String productCode = request.getParameter("productCode");
		System.out.println(productCode);
		ProductDTO productDTO = productService.getProduct(productCode);
		System.out.println(productDTO);
		model.addAttribute("productDTO", productDTO);
		
		return "product/productDelete";
	}// productDelete [완제품삭제]
	
	@PostMapping("/productDeletePro")
	public String productDeletePro(ProductDTO productDTO) {
		System.out.println("ProductController productDeletePro()");
		//회원가입 처리
		System.out.println(productDTO);
		
		productService.deleteProduct(productDTO);
		
		return "product/close";
	}// productDeletePro [완제품삭제]
	

	
	
	
	
	
	
	
//	가상주소 http://localhost:8080/keypoint/product/requireList
	@GetMapping("/requireList")
	public String requireList() {
		// WEB-INF/views/product/requireList.jsp
		return "product/requireList";
	}// requireList [소요량목록]
	
	@GetMapping("/requireInsert")
	public String requireInsert() {
		return "product/requireInsert";
	}// requireInsert [소요량등록]	
	
	@GetMapping("/requireUpdate")
	public String requireUpdate() {
		return "product/requireUpdate";
	}// requireUpdate [소요량수정]
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}// class
