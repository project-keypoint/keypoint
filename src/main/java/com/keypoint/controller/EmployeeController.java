package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.EmployeeService;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Inject
	private EmployeeService employeeService;
	
	// 사원목록
	@GetMapping("/employeeList")
	public String memberList(Model model) {
		System.out.println("EmployeeController employeelist()");
		List<EmployeeDTO> memberList = employeeService.getEmployeeList();
		model.addAttribute("memberList", memberList);
		return "employee/employeeList";		
	} // employeeList
	
	
	
	
	
	
	// 사원등록
	@GetMapping("/addPage")
	public String addPage() {
		return "employee/insert";  
	}	
	
	// 사원등록
	@PostMapping("/add")
	public String addMember(EmployeeDTO EeployeeDTO) {
		System.out.println("EmployeeController addMember()");
		System.out.println("EeployeeDTO : " + EeployeeDTO);
		employeeService.insertMember(EeployeeDTO);
		return "";
	}	
	
	// 사원삭제(보류)
	@GetMapping("/delete")
	public String deleteMember(String empId) {
		System.out.println("EmployeeController deleteMember()");
		employeeService.deleteMember(empId);
		return ""; 
	}

	// 사원수정(연락처,재직여부)-항목 수정 필요
	@PostMapping("/update")
	public String updateMember(EmployeeDTO EeployeeDTO) {
		System.out.println("EmployeeController updateMember()");
		employeeService.updateMember(EeployeeDTO);
		return "";
	}

	
	
	
	
	
	
} // 클래스
