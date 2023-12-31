package com.keypoint.controller;

import java.io.File;
import java.net.CacheResponse;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import com.keypoint.dto.PageDTO;
import com.keypoint.security.SaltGenerator;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.EmployeeService;
import com.mysql.cj.Session;


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
	public String loginPro(EmployeeDTO employeeDTO, HttpSession session, Model model) {
	    // 로그인 처리
	    employeeDTO = employeeService.userCheck(employeeDTO);
	    
	    if (employeeDTO != null) {
	        // 사용자의 empRoll 값을 확인하고 로그인 처리
	        if (employeeDTO.getEmpRole() == 0) {
	            // empRoll 값이 0인 경우 로그인 불가능
//	            model.addAttribute("error", "로그인에 권한이 없습니다. 관리자에게 문의하세요.");
	            return "member/msg2";
	        } else {
	            // empRoll 값이 0이 아닌 경우 로그인 성공
	            session.setAttribute("empId", employeeDTO.getEmpId());
	            session.setAttribute("empName", employeeDTO.getEmpName());
	            session.setAttribute("empPhoto", employeeDTO.getEmpPhoto());
	            session.setAttribute("departmentName", employeeDTO.getDepartmentName());
	            session.setAttribute("empRole", employeeDTO.getEmpRole());
	            // 주소 변경하면서 이동 /main/main
	            return "redirect:/main/main";
	        }
	    } else {
	        // 아이디 비밀번호 틀림 => member/msg.jsp 이동
	        return "member/msg";
	    }
	}
	
	// 로그아웃-강수빈
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션값 초기화 
		session.invalidate();
		// 주소변경하면서 이동 /main/main
		return "redirect:/main/login";
	}//
	
	// 강수빈 - 비밀번호 값 가져오기
	@GetMapping("/getInitialPass")
	@ResponseBody
	public String getInitialPass() {
	    int initialPass = employeeService.getInitialPass();
	    return String.valueOf(initialPass);
	}
	
	
	
	// -------------------------------------------------------------------
	
	
	// 사원목록(+검색, 페이징)
	@GetMapping("/employeeList")
	public String employeeList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("EmployeeController employeelist()");
		// 세션에서 empId 가져오기
		int empId = (int) session.getAttribute("empId");
		
		// 검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		
		
		// 한 화면에 보여줄 사원 수 설정
		int pageSize = 8;
		// 현 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호가 없을 경우 => "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
				
		// 다른 페이지 누를때 여백제거
		pageNum = pageNum.trim();
		// 페이지 번호 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
				
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		// 검색어 저장
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);
		
		List<EmployeeDTO> employeeList = employeeService.getEmployeeList(pageDTO);
		
		// 페이징처리
		// 전체 사원 수 가져오기
		int count = employeeService.getEmployeeCount(pageDTO);
		
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

		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		return "employee/employeeList";		
	} // employeeList
	

	// 사원등록화면
	@GetMapping("/employeeInsert")
	public String employeeInsert() {
		System.out.println("EmployeeController employeeInsert()");
		
		return "employee/employeeInsert";  
	} // employeeInsert	
	
	
	// 사원등록 - 사진첨부하기가 포함된 사원등록
	@PostMapping("/photoPro")
	// 첨부파일은 boardDTO에 못 담음
	public String photoPro(HttpServletRequest request, MultipartFile empPhoto, HttpSession session ) throws Exception{
		System.out.println("EmployeeController photoPro()");
		// name = "file" => MultipartFile file 이름 동일하게 해야 함
		// 리눅스 서버에 올리기
		String uploadPath = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadPath);
		
		EmployeeDTO employeeDTO = new EmployeeDTO();
		
		String empSalt = SaltGenerator.getSalt();

		System.out.println("empSalt: " + empSalt);
		if (empPhoto.isEmpty()) {
			employeeDTO.setEmpPhoto("test.png");
		} else {
			// 첨부파일 업로드 => pom.xml에 프로그램 설치
			// servlet-context.xml에 설정
			// 첨부파일을 원하는 곳에 복사(업로드)
			// 파일이름 => 랜덤문자_첨부파일이름
			UUID uuid = UUID.randomUUID();
//			String filename = uuid.toString()+"_"+첨부파일이름;
			String filename = uuid.toString()+"_"+empPhoto.getOriginalFilename();
			// 첨부파일 복사(업로드)
//			FileCopyUtils.copy(원본파일, upload폴더파일(경로, 파일이름));
//			file.getBytes() 원본파일 => upload 첨부파일 복사(업로드)
			FileCopyUtils.copy(empPhoto.getBytes(), new File(saveDir, filename));
			
			// boardDTO에 첨부파일이름 저장
			employeeDTO.setEmpPhoto(filename);
		}

		
		// 목록이 다 넘어갈 수 있게
		// 비밀번호
		employeeDTO.setEmpPass(request.getParameter("empPass") + empSalt);
		employeeDTO.setEmpSalt(empSalt);
		
		// 이름, 주소, 연락처, 내선번호, 이메일
		employeeDTO.setEmpName(request.getParameter("empName"));
		employeeDTO.setEmpAddress(request.getParameter("empAddress"));
		employeeDTO.setEmpAddress_dtail(request.getParameter("empAddress_dtail"));
		employeeDTO.setEmpPhone(request.getParameter("empPhone"));
		employeeDTO.setEmpTel(request.getParameter("empTel"));
		employeeDTO.setEmpEmail(request.getParameter("empEmail"));
		
		// 부서, 직급
		employeeDTO.setDepartmentName(request.getParameter("departmentName"));
		employeeDTO.setEmpPosition(request.getParameter("empPosition"));
		 
		// 생년월일, 고용일, 재직여부
		employeeDTO.setEmpBirth(request.getParameter("empBirth"));
		employeeDTO.setEmpHiredate(request.getParameter("empHiredate"));
		employeeDTO.setEmpStatus(request.getParameter("empStatus"));
		
		// 권한
		employeeDTO.setEmpRole(Integer.parseInt(request.getParameter("empRole")));
		
		employeeService.insertEmployee(employeeDTO);
		
		if(employeeDTO != null) {
			return "employee/msgSuccess"; // 등록완료
		} else {
			return "employee/msgFailed"; // 등록실패
		}
	} // photoPro
	
	
	// 사원-상세정보
	@GetMapping("/employeeDetails")
	public String employeeDetails(Model model, @RequestParam("empId") int empId, HttpSession session) {
		System.out.println("EmployeeController employeeDetails()");
		
		// 세션에서 empId 가져오기
		int empIdSession = (int) session.getAttribute("empId");
		
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		System.out.println("DTO"+employeeDTO);
		
		model.addAttribute("employeeDTO", employeeDTO);
		
		// empId로 사원정보 가져오기(세션)
		EmployeeDTO employeeDTO1 = employeeService.getEmployeeDetails(empIdSession );
		model.addAttribute("employeeDTO1", employeeDTO1);
		System.out.println("DTO1"+employeeDTO1);
		
		return "employee/employeeDetails";
	}// employeeDetails
	
	
	// 사원 - 상세정보 수정화면
	@GetMapping("/employeeUpdate")
	public String employeeUpdate(Model model, @RequestParam("empId") int empId, HttpSession session) {
		System.out.println("EmployeeController employeeUpdate()");
		// 세션에서 empId 가져오기
		int empIdSession = (int) session.getAttribute("empId");
				
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		
		// empId로 사원정보 가져오기(세션)
		EmployeeDTO employeeDTO1 = employeeService.getEmployeeDetails(empIdSession );
		model.addAttribute("employeeDTO1", employeeDTO1);
		System.out.println("DTO1"+employeeDTO1);
		
		return "employee/employeeUpdate";  
	} // employeeUpdate
	
	
	// 사원수정 - 첨부파일이 포함된 사원정보수정하기
			@PostMapping("/photoUpdatePro")
			// 첨부파일은 boardDTO에 못 담음
			public String photoUpdatePro(Model model, HttpServletRequest request, MultipartFile empPhoto, HttpSession session)throws Exception {
				System.out.println("EmployeeController photoUpdatePro()");
				
				// 세션에서 empId 가져오기
				int empIdSession = (int) session.getAttribute("empId");
				
				// empId로 사원정보 가져오기(세션)
				EmployeeDTO employeeDTO1 = employeeService.getEmployeeDetails(empIdSession );
				model.addAttribute("employeeDTO1", employeeDTO1);
				System.out.println("DTO1"+employeeDTO1);	
				
				// 리눅스 서버에 올리기
				String uploadPath = "/resources/upload";
				String saveDir = session.getServletContext().getRealPath(uploadPath);
				
				// 수정 할 값 넘어오게
				EmployeeDTO employeeDTO = new EmployeeDTO();
				int empId = Integer.parseInt(request.getParameter("empId"));
				
				String empSalt = employeeService.getEmpSalt(empId);
				System.out.println(empSalt);
				
				// 사번, 이름 , 생일, 주소 , 상세주소
				employeeDTO.setEmpId(Integer.parseInt(request.getParameter("empId")));
				employeeDTO.setEmpName(request.getParameter("empName"));
				employeeDTO.setEmpBirth(request.getParameter("empBirth"));
				employeeDTO.setEmpAddress(request.getParameter("empAddress"));
				employeeDTO.setEmpAddress_dtail(request.getParameter("empAddress_dtail"));
				
				// 이메일,연락처,내선번호 / 비밀번호는 따로
				employeeDTO.setEmpEmail(request.getParameter("empEmail"));
				employeeDTO.setEmpPhone(request.getParameter("empPhone"));
				employeeDTO.setEmpTel(request.getParameter("empTel"));
				
				// 부서,직급,재직여부
				employeeDTO.setDepartmentName(request.getParameter("departmentName"));
				employeeDTO.setEmpPosition(request.getParameter("empPosition"));
				employeeDTO.setEmpStatus(request.getParameter("empStatus"));
				
				// 입사일,휴직일,퇴직일
				employeeDTO.setEmpHiredate(request.getParameter("empHiredate"));
				employeeDTO.setEmpLeavedate(request.getParameter("empLeavedate"));
				employeeDTO.setEmpRetiredate(request.getParameter("empRetiredate"));
				
				// 권한
				employeeDTO.setEmpRole(Integer.parseInt(request.getParameter("empRole")));
			
				// 업로드파일 있는지 없는지 파악
				if(empPhoto.isEmpty()) {
					System.out.println("oldfile");
					// 첨부파일이 없는 경우 => oldfile 저장
					employeeDTO.setEmpPhoto(request.getParameter("oldfile"));
				} else {
					System.out.println("newfile");
					// 첨부파일이 있는 경우
					// 업로드파일이름 랜덤문자_파일이름
					UUID uuid = UUID.randomUUID();
					String filename = uuid.toString()+"_"+empPhoto.getOriginalFilename();
					// 원본파일 => upload폴더 복사
					FileCopyUtils.copy(empPhoto.getBytes(), new File(saveDir, filename));
					// boardDTO 저장
					employeeDTO.setEmpPhoto(filename);
				}
				
				// 수정
				employeeService.updateEmployee(employeeDTO);
				
				if(employeeDTO != null) {
					return "employee/msgSuccess"; // 등록완료
				} else {
					return "employee/msgFailed"; // 등록실패
				}
			
			} // photoUpdatePro
			
			

		
		@PostMapping("/modifyPass/{empId}")
		@ResponseBody
		public void modifyPass(@PathVariable int empId, @RequestBody Map<String, String> passwordData) {
		    String empPass = passwordData.get("empPass");
		    
		    if (empPass != null && !empPass.trim().isEmpty()) {
		        System.out.println("Received empId: " + empId);
		        System.out.println("Received empPass: " + empPass);

		        // 비밀번호 변경 로직 호출
		        employeeService.modifyPass(empId, empPass);
		    } else {
		       
		        System.err.println("Invalid password received from client.");
		 
		    }
		}
	
		
		
		// 비밀번호 초기화

		@PostMapping("/resetPassword/{empId}")
		@ResponseBody
	    public void resetPassword(@PathVariable int empId) {
			 System.out.println("Received empId: " + empId);
			
			employeeService.resetPassword(empId);
	    }
		

		
		
		
		
		
} // class