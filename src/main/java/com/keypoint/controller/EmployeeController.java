package com.keypoint.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.EmployeeService;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	// EmployeeService 객체생성
	@Inject
	private EmployeeService employeeService;
	
	// upload 폴더 파일경로 객체생성
	// name = "uploadPath"(src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml)
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	// -------------------------------------------------------------------
	
	
	// 로그인-강수빈
	@PostMapping("/loginPro")
	public String loginPro(EmployeeDTO employeeDTO,HttpSession session) {
		System.out.println("EmployeeController loginPro()");
		//로그인 처리
		System.out.println(employeeDTO);
			
		employeeDTO = employeeService.userCheck(employeeDTO);
			
		if(employeeDTO != null) {
			//아이디 비밀번호 일치 => 세션값 생성 => /member/main이동
			session.setAttribute("empId", employeeDTO.getEmpId());
			session.setAttribute("empName", employeeDTO.getEmpName());
			// 주소변경하면서 이동 /main/main
			return "redirect:/main/main";
		}else {
			//아이디 비밀번호 틀림 => member/msg.jsp 이동
			return "member/msg";
		}
	}//	
	
	// 로그아웃-강수빈
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션값 초기화 
		session.invalidate();
		// 주소변경하면서 이동 /main/main
		return "redirect:/main/login";
	}//
	
	
	
	// 사원목록
	@GetMapping("/employeeList")
	public String employeeList(HttpServletRequest request, Model model) {
		System.out.println("EmployeeController employeelist()");
		
		// 한 화면에 보여줄 사원 수 설정
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
		
		List<EmployeeDTO> employeeList = employeeService.getEmployeeList(pageDTO);
		
		// 페이징처리
		// 전체 사원 수 가져오기
		int count = employeeService.getEmployeeCount();
		
		// 전체 사원 수 employeeCount에 담기
		model.addAttribute("employeeCount", count);
		
		// 한 화면에 보여줄 사원 수 설정
		int pageBlock = 10;
		
		// 시작하는 페이지 번호
		int startPage = (currentPage -1)/pageBlock*pageBlock+1;
		
		// 끝나는 페이지 번호
		int endPage = startPage+pageBlock-1;
		
     	// 전체페이지 개수
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		
		// 끝나는 페이지 번호 전체페이지 개수 비교 => 끝나는 페이지 번호가 크면 전체페이지 개수로 변경
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "employee/employeeList";		
	} // employeeList
	

	// 사원등록화면
	@GetMapping("/employeeInsert")
	public String employeeInsert() {
		System.out.println("EmployeeController employeeInsert()");
		
		return "employee/employeeInsert";  
	} // employeeInsert	
	
	
	// 사원등록하기
	@PostMapping("/employeeInsertPro")
	public String employeeInsertPro(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeController employeeInsertPro()");
		System.out.println(employeeDTO);
		
		employeeService.insertEmployee(employeeDTO);
		
		if(employeeDTO != null) {
			return "employee/msgSuccess"; // 등록완료
		} else {
			return "employee/msgFailed"; // 등록실패
		}
	
	} // employeeInsertPro	
	
	
	// 사원 상세정보 화면(연결되는지 테스트용)
//	@GetMapping("/employeeDetails")
//	public String employeeDetails() {
//		System.out.println("EmployeeController employeeDetails()");
//		
//		return "employee/employeeDetails";  
//	} 
	
	
	// 사원-상세정보
	@GetMapping("/employeeDetails")
	public String employeeDetails(Model model, @RequestParam("empId") int empId) {
		System.out.println("EmployeeController employeeDetails()");
		
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		
		return "employee/employeeDetails";
	}// employeeDetails
	
	
	// 사원-상세정보 수정화면
	@GetMapping("/employeeUpdate")
	public String employeeUpdate(Model model, @RequestParam("empId") int empId) {
		System.out.println("EmployeeController employeeUpdate()");
		
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		
		return "employee/employeeUpdate";  
	} // employeeUpdate
	

	// 사원-상세정보 수정하기
	@PostMapping("/employeeUpdatePro")
	public String employeeUpdatePro(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeController employeeUpdatePro()");
		System.out.println(employeeDTO);
		
		employeeService.updateEmployee(employeeDTO);
		
		if(employeeDTO != null) {
			return "employee/msgSuccess"; // 등록완료
		} else {
			return "employee/msgFailed"; // 등록실패
		}
	
	} // employeeUpdatePro	
	
	
	// 사원등록-사진첨부
	@PostMapping("/photoPro")
	public String photoPro(HttpServletRequest request, MultipartFile empPhoto) throws Exception{
		System.out.println("EmployeeController photoPro()");
		// name = "file" => MultipartFile file 이름 동일하게 해야 함
		
		EmployeeDTO employeeDTO = new EmployeeDTO();

		// 첨부파일 업로드 => pom.xml에 프로그램 설치
		// servlet-context.xml에 설정
		// 첨부파일을 원하는 곳에 복사(업로드)
		// 파일이름 => 랜덤문자_첨부파일이름
		UUID uuid = UUID.randomUUID();
//		String filename = uuid.toString()+"_"+첨부파일이름;
		String filename = uuid.toString()+"_"+empPhoto.getOriginalFilename();
		// 첨부파일 복사(업로드)
//		FileCopyUtils.copy(원본파일, upload폴더파일(경로, 파일이름));
//		file.getBytes() 원본파일 => upload 첨부파일 복사(업로드)
		FileCopyUtils.copy(empPhoto.getBytes(), new File(uploadPath, filename));
		
		// boardDTO에 첨부파일이름 저장
		employeeDTO.setEmpPhoto(filename);
		
		// 사원등록 목록이 다 넘어갈 수 있게
		employeeDTO.setEmpName(request.getParameter("empName"));
		employeeDTO.setEmpAddress(request.getParameter("empAddress"));
		employeeDTO.setEmpPhone(request.getParameter("empPhone"));
		employeeDTO.setEmpTel(request.getParameter("empTel"));
		employeeDTO.setEmpEmail(request.getParameter("empEmail"));
		
		employeeDTO.setDepartmentName(request.getParameter("departmentName"));
		employeeDTO.setEmpPosition(request.getParameter("empPosition"));
		
		employeeDTO.setEmpBirth(request.getParameter("empBirth"));
		employeeDTO.setEmpHiredate(request.getParameter("empHiredate"));
		employeeDTO.setEmpStatus(request.getParameter("empStatus"));
		
//		employeeDTO.setEmpRole(request.getParameter("empRole"));
		
		employeeService.insertEmployee(employeeDTO);
		
		if(employeeDTO != null) {
			return "employee/msgSuccess"; // 등록완료
		} else {
			return "employee/msgFailed"; // 등록실패
		}
	} // photoPro
	
	


	
	

		
		
		
} // class
