package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.ProductDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	//productService 객체생성
	@Inject
	private ProductService productService;

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
		
		return "redirect:/product/productList";
	}// productInsertPro
	
	@GetMapping("/productUpdate")
	public String productUpdate() {
		return "product/productUpdate";
	}// productUpdate [완제품수정]
	
	@GetMapping("/addUnit")
	public String addUnit() {
		return "product/addUnit";
	}// addUnit [단위추가]
	
//	가상주소 http://localhost:8080/keypoint/product/materialList
	@GetMapping("/materialList")
	public String materialList() {
		// WEB-INF/views/product/materialList.jsp
		return "product/materialList";
	}// materialList [자재목록]
	
	@GetMapping("/materialInsert")
	public String materialInsert() {
		return "product/materialInsert";
	}// materialInsert [자재등록]	
	
	@GetMapping("/materialUpdate")
	public String materialUpdate() {
		return "product/materialUpdate";
	}// materialUpdate [자재수정]
	
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
