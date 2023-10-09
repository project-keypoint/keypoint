package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.EmployeeService;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Inject
	private EmployeeService employeeService;
	
	
	// 사원목록
	@GetMapping("/employeeList")
	public String employeeList(Model model) {
		System.out.println("EmployeeController employeelist()");
		
		List<EmployeeDTO> employeeList = employeeService.getEmployeeList();
		model.addAttribute("employeeList", employeeList);
		
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
	
		@PostMapping("/loginPro")
		public String loginPro(EmployeeDTO employeeDTO,HttpSession session) {
			System.out.println("EmployeeController loginPro()");
			//로그인 처리
			System.out.println(employeeDTO);
			
			employeeDTO = employeeService.userCheck(employeeDTO);
			
			if(employeeDTO != null) {
				//아이디 비밀번호 일치 => 세션값 생성 => /member/main이동
				session.setAttribute("empId", employeeDTO.getEmpId());
				// 주소변경하면서 이동 /main/main
				return "redirect:/main/main";
			}else {
				//아이디 비밀번호 틀림 => member/msg.jsp 이동
				return "member/msg";
			}
		}//	
	
} // class
