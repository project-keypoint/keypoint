package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keypoint.dto.ProductDTO;
import com.keypoint.dto.ReceiveDTO;
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
		
		if(productDTO != null) {
			return "require/msgSuccess"; // 등록완료
		}else {
			return "require/msgFailed"; // 등록실패
		}
	}// productInsertPro [완제품등록]
	
	@GetMapping("/productUpdate")
	public String productUpdate() {
		return "product/productUpdate";
	}// productUpdate [완제품수정]
	
	@GetMapping("/productDelete")
	public String productDelete(ProductDTO productDTO) {
		System.out.println("ProductController productDelete()");
		System.out.println(productDTO);
		productService.deleteProduct(productDTO);
		
		return "product/productList";
	}// productDelete [완제품삭제]
	

	

	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}// class
