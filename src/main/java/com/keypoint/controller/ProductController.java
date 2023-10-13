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

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.dto.RequireDTO;
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
	public String productList(HttpServletRequest request, Model model) {
		System.out.println("ProductController productList()");
		
		// 검색어 가져오기
		String search = request.getParameter("search");
		
		// 한 화면에 보여줄 글개수 설정
		int pageSize = 10;
		// 현 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호가 없을 경우 => "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		// 페이지 번호 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// 검색어 저장
		pageDTO.setSearch(search);
		
		List<ProductDTO> productList = productService.getProductList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = productService.getProductCount(pageDTO);
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 시작하는 페이지 번호
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		// 끝나는 페이지 번호
		int endPage = startPage + pageBlock -1;
		// 끝나는 페이지 번호 전체페이지 개수 비교
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// => 끝나는 페이지 번호가 크면 전체 페이지 개수로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);		
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageDTO", pageDTO);
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
			return "product/msgSuccess"; // 등록완료
		}else {
			return "product/msgFailed"; // 등록실패
		}
	}// productInsertPro [완제품등록]
	
	@GetMapping("/productUpdate")
	public String productUpdate(Model model, @RequestParam("productCode") String productCode) {
		ProductDTO productDTO = productService.getProduct(productCode);
		System.out.println(productDTO);
		model.addAttribute("productDTO", productDTO);
		return "product/productUpdate";
	}// productUpdate [완제품수정]
	
	@PostMapping("/productUpdatePro")
	public String productUpdatePro(ProductDTO productDTO) {
		System.out.println("ProductController productUpdatePro");
		System.out.println(productDTO);
		productService.updateProduct(productDTO);
		
		if(productDTO != null) {
			return "product/msgSuccess"; // 등록완료
		}else {
			return "product/msgFailed"; // 등록실패
		}
	}// productUpdatePro [완제품수정]
	
	@GetMapping("/productDelete")
	public String productDelete(ProductDTO productDTO) {
		System.out.println("ProductController productDelete()");
		System.out.println(productDTO);
		productService.deleteProduct(productDTO);
		
		return "product/productList";
	}// productDelete [완제품삭제]
	

	

	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}// class
