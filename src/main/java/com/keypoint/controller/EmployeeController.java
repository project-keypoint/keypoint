package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.ReceiveDTO;
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
		}else {
			return "employee/msgFailed"; // 등록실패
		}
	} // employeeInsertPro	
	


	
	// 내정보수정 , 모든 사원정보수정
	// 사원정보수정화면
//	@GetMapping("/employeeUpdate")
//	public String receiveUpdate(Model model, @RequestParam("roCode") String roCode) {
//		System.out.println("ReceiveController receive/receiveUpdate");
//		
//		ReceiveDTO receiveDTO = employeeService.getReceiveDetails(roCode);
//		model.addAttribute("receiveDTO", receiveDTO);
//		
//		return "receive/receiveUpdate";
//	}// employeeUpdate
//	
//	// 사원정보수정하기
//	@PostMapping("/employeeUpdatePro")
//	public String receiveUpdatePro(ReceiveDTO receiveDTO) {
//		System.out.println("ReceiveController receive/receiveUpdatePro");
//		System.out.println(receiveDTO);
//		
//		employeeService.employeeUpdatePro(receiveDTO);
//		
//		if(receiveDTO != null) {
//			return "employee/msgSuccess"; // 수정완료
//		}else {
//			return "employee/msgFailed"; // 수정실패
//		}
//	}// employeeUpdatePro
	
	
	
	
	
	
//	// 사원삭제(보류)
//	@GetMapping("/delete")
//	public String deleteMember(String empId) {
//		System.out.println("EmployeeController deleteMember()");
//		employeeService.deleteMember(empId);
//		return ""; 
//	}
	
	
	
	
} // 클래스
