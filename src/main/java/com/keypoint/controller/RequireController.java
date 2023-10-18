package com.keypoint.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.RequireDTO;
import com.keypoint.service.EmployeeService;
import com.keypoint.service.RequireService;

@Controller
@RequestMapping("/require/*")
public class RequireController {
	
	//requireService 객체생성
	@Inject
	private RequireService requireService;
	
	//employeeService 객체생성
	@Inject
	private EmployeeService employeeService;
	
//	가상주소 http://localhost:8080/keypoint/require/requireList
	@GetMapping("/test")
	public String test() {
		return "require/test";
	}// requireList [소요량목록]

	//	가상주소 http://localhost:8080/keypoint/require/requireList
	@GetMapping("/requireList")
	public String requireList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("RequireController requireList()");
		// 세션에서 empId 가져오기
		int empId = (int) session.getAttribute("empId");
		
		// 검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
		
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
		pageDTO.setSearch2(search2);
		
		List<RequireDTO> requireList = requireService.getRequireList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = requireService.getRequireCount(pageDTO);
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 5;
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
		
		model.addAttribute("requireList", requireList);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println(pageDTO);
		
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		// WEB-INF/views/require/requireList.jsp
		return "require/requireList";
	}// requireList [소요량목록]
	
	@GetMapping("/requireInsert")
	public String requireInsert() {
		return "require/requireInsert";
	}// requireInsert [소요량등록]	
	
	@PostMapping("/requireInsertPro")
	public String requireInsertPro(RequireDTO requireDTO) {
		System.out.println("RequireController requireInsertPro()");
		//회원가입 처리
		System.out.println(requireDTO);
		try {
			requireService.insertRequire(requireDTO);
		} catch (Exception e) {
			return "require/msgDuplicated"; // 등록실패
		}
		
		if(requireDTO != null) {
			return "require/msgSuccess"; // 등록완료
		}else {
			return "require/msgFailed"; // 등록실패
		}
	}// requireInsertPro [소요량등록]
	
	@GetMapping("/requireUpdate")
	public String requireUpdate(@RequestParam Map<String,Object> param, Model model) {
		System.out.println(param);
		model.addAttribute("param", param);
		RequireDTO requireDTO = requireService.getRequire(param);
		model.addAttribute("requireDTO", requireDTO);
		System.out.println(requireDTO);
		return "require/requireUpdate";
	}// requireUpdate [소요량수정]
	
	@PostMapping("/requireUpdatePro")
	public String requireUpdatePro(RequireDTO requireDTO) {
		System.out.println("RequireController requireUpdatePro");
		System.out.println(requireDTO);
		requireService.updateRequire(requireDTO);
		
		if(requireDTO != null) {
			return "require/msgSuccess"; // 등록완료
		}else {
			return "require/msgFailed"; // 등록실패
		}
	}// requireUpdatePro [소요량수정]
	
	@GetMapping("/requireDelete")
	public String requireDelete(RequireDTO requireDTO) {
		System.out.println("RequireController requireDelete()");
		System.out.println(requireDTO);
		requireService.deleteRequire(requireDTO);

		return "require/requireList";
	}// requireDelete [소요량삭제]
	
	// 다중삭제
	@PostMapping("/requireDeleteChecked")
	public ResponseEntity<String> requireDeleteChecked(@RequestBody RequireDTO requireDTO) {
	  System.out.println("RequireController requireDeleteChecked()");
	  System.out.println(requireDTO);
	  try {
	    requireService.requireDeleteChecked(requireDTO);
	    return ResponseEntity.ok("success");
	  } catch (Exception e) {
	    e.printStackTrace();
	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	  }
	}


	

	
	
	
	
	
	
	
	
	
	
	
	
}// class